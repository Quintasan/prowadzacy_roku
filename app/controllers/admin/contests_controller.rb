# frozen_string_literal: true

class Admin::ContestsController < ApplicationController
  before_action :authenticate_admin!
  expose :contests, -> { Contest.all }
  expose :contest

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if contest.save
        format.html { redirect_to contest, notice: 'Contest was successfully created.' }
        format.json { render :show, status: :created, location: contest }
      else
        format.html { render :new }
        format.json { render json: contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if contest.update(contest_params)
        format.html { redirect_to contest, notice: 'Contest was successfully updated.' }
        format.json { render :show, status: :ok, location: contest }
      else
        format.html { render :edit }
        format.json { render json: contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_votes
    contest.votes.each do |vote|
      SendVotingMailJob.perform_later(vote: vote)
    end
    redirect_to contests_url, notice: "Successfully sent messages"
  end

  private

  def contest_params
    param.require(:contest).permit(
      :name,
      :expires_at,
    )
  end
end
