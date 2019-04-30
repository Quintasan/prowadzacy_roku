# frozen_string_literal: true

class SendVotingMailJob < ApplicationJob
  queue_as :default

  def perform(vote:)
    @vote = vote
    VoteMailer.send_vote(vote: vote).deliver_later
  end
end
