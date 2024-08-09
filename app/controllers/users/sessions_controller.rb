# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  after_action :check_for_validation_errors, only: [:create]

  private

  def check_for_validation_errors
    if resource.errors.any?
      flash[:alert] = resource.errors.full_messages.to_sentence
    end
  end
end
