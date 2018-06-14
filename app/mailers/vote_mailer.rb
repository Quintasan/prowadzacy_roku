# frozen_string_literal: true

class VoteMailer < ApplicationMailer
  default from: "samorzad.iz@gmail.com"
  def send_vote(vote:)
    @vote = vote
    mail(
      to: @vote.email,
      subject: "Oddaj głos na Prowadzącego Roku!"
    )
  end
end
