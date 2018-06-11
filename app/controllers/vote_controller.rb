# frozen_string_literal: true

class VoteController < ApplicationController
  expose(:user_vote) { Vote.find_by!(token: params[:token]) }
  expose(:contest) { user_vote.contest }
  expose(:entries) { contest.entries.includes([:contestant]) }

  def vote
    verify_token || return
  end

  def cast_vote
    verify_token || return
    if user_vote.update(vote_params)
      user_vote.update(cast: true)
      redirect_to root_path, notice: "Dziękujemy za oddanie głosu!"
    else
      render :vote, notice: "Coś poszło nie tak, spróbuj jeszcze raz."
    end
  end

  private

  def vote_params
    params.require(:vote).permit(
      :id,
      :entry_id
    )
  end

  def verify_token
    if params[:token] != user_vote.token || user_vote.cast
      redirect_to(root_path, alert: "Oddałeś już głos. Jeżeli tak nie jest to prosimy o kontakt z Samorządem Studenckim W-8") && return
    end

    true
  end
end
