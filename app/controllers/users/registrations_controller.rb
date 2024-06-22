# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      if resource.persisted?
        if params[:user][:role] == 'dancer'
          Dancer.create(user: resource)
        elsif params[:user][:role] == 'producer'
          Producer.create(user: resource)
        end
      end
    end
  end

  def update
    super do |resource|
      if resource.persisted? && params[:user][:role] != resource.role
        create_profile_for(resource)
      end
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def create_profile_for(user)
    if user.role == 'dancer' && user.dancer.nil?
      Dancer.create(user: user)
    elsif user.role == 'producer' && user.producer.nil?
      Producer.create(user: user)
    end
  end

  def after_update_path_for(resource)
    root_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
