require "csv"

class ContestAlreadyCreated < StandardError; end

class CreateNewContest
  def initialize(fixture)
    @file = fixture.file
  end

  def call
    @file
      .yield_self { |it| convert_to_hash(it) }
      .yield_self { |it| build_contest(it) }
  end

  def convert_to_hash(file)
    csv = file.read
    rows = CSV.parse(csv)
    contest = {
      name: rows[0].first,
      expires_at: rows[1].first
    }
    contestants = rows[2..-1].map do |row|
      {
        name: row[0],
        surname: row[1],
        title: row[2],
      }
    end
    [contest, contestants]
  end

  def build_contest(params)
    contest = params.first
    contestants = params.last
    contest = Contest.find_or_initialize_by(
      name: contest[:name],
      expires_at: contest[:expires_at],
    )

    raise ContestAlreadyCreated unless contest.new_record?

    contestants = contestants.map do |contestant|
      Contestant.find_or_initialize_by(
        name: contestant[:name],
        surname: contestant[:surname],
        title: contestant[:title],
      )
    end

    entries = contestants.map do |contestant|
      Entry.new(
        contest: contest,
        contestant: contestant,
      )
    end

    ActiveRecord::Base.transaction do
      contest.save!
      entries.each(&:save!)
    end
  end
end
