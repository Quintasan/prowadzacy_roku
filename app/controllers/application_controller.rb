# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def root; end

  private

  def record_not_found
    redirect_to root_path, alert: "Coś poszło nie tak, upewnij się że link z wiadomości został poprawnie przekopiowany"
  end
end
