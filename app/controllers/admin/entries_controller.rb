# frozen_string_literal: true

class Admin::EntriesController < ApplicationController
  before_action :authenticate_admin!
  expose :contestants, -> { Contestant.all }
  expose :contests, -> { Contest.active }
  expose :entries, -> { Entry.all }
  expose :entry

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if entry.save
        format.html { redirect_to entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: entry }
      else
        format.html { render :new }
        format.json { render json: entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if entry.update(entry_params)
        format.html { redirect_to entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: entry }
      else
        format.html { render :edit }
        format.json { render json: entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def entry_params
    params.require(:entry).permit(
      :contestant_id,
      :contest_id
    )
  end
end
