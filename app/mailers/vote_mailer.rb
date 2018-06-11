# frozen_string_literal: true

class VoteMailer < ApplicationMailer
  def send_vote(vote:)
    mail(
      to: vote.email,
      subject: "Oddaj głos na Prowadzącego Roku!"
    )
  end
end
