# frozen_string_literal: true

class Admin::VotesController < ApplicationController
  expose :votes, -> { Vote.all }
  expose :vote

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if vote.save
        format.html { redirect_to vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: vote }
      else
        format.html { render :new }
        format.json { render json: vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if vote.update(vote_params)
        format.html { redirect_to vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: vote }
      else
        format.html { render :edit }
        format.json { render json: vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(
      :contest_id,
      :contestant_id,
    )
  end
end
