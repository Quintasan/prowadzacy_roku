# frozen_string_literal: true

class Admin::ContestantsController < ApplicationController
  before_action :authenticate_admin!
  expose :contestants, -> { Contestant.all }
  expose :contestant

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if contestant.save
        format.html { redirect_to contestant, notice: 'Contestant was successfully created.' }
        format.json { render :show, status: :created, location: contestant }
      else
        format.html { render :new }
        format.json { render json: contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if contestant.update(contestant_params)
        format.html { redirect_to contestant, notice: 'Contestant was successfully updated.' }
        format.json { render :show, status: :ok, location: contestant }
      else
        format.html { render :edit }
        format.json { render json: contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    contestant.destroy
    respond_to do |format|
      format.html { redirect_to contestants_url, notice: 'Contestant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def contestant_params
    params.require(:contestant).permit(
      :name,
      :surname,
      :title,
    )
  end
end
