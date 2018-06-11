# frozen_string_literal: true

class Admin::FixturesController < ApplicationController
  expose :fixtures, -> { Fixture.all }
  expose :fixture

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    respond_to do |format|
      if fixture.save
        result = CreateNewContest.new(fixture).call
        format.html { redirect_to admin_fixture_path(fixture), notice: 'Fixture was successfully created.' }
        format.json { render :show, status: :created, location: fixture }
      else
        format.html { render :new }
        format.json { render json: fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if fixture.update(fixture_params)
        format.html { redirect_to admin_fixture_path(fixture), notice: 'Fixture was successfully updated.' }
        format.json { render :show, status: :ok, location: fixture }
      else
        format.html { render :edit }
        format.json { render json: fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    fixture.destroy
    respond_to do |format|
      format.html { redirect_to admin_fixtures_url, notice: 'Fixture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def fixture_params
    params.require(:fixture).permit(
      :file,
      :students
    )
  end
end
