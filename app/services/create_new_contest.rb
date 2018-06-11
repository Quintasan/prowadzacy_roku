require "csv"
require "pry"
require "byebug"

class ContestAlreadyCreated < StandardError; end

class CreateNewContest
  def initialize(fixture)
    @fixture = fixture
  end

  def call
    contest = @fixture.file
      .yield_self { |it| convert_to_hash(it) }
      .yield_self { |it| build_contest(it) }
    create_votes(contest)
  end

  def create_votes(contest)
    spread = Roo::Excel.new(@fixture.students.storage.path(@fixture.students.id))
    binding.pry
    indexes = spread.map do |row|
      value = row.first
      next if value.is_a?(String)
      value.round(0).to_s
    end
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

    contest
  end
end
