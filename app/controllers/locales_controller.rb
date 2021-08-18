class LocalesController < ApplicationController
  # skip_before_action :authenticate_user!

  def site_locale
    configure_locale(new: locale_params[:locale])
    redirect_back fallback_location: root_path
  end

  def default_locale
    self.cookie_locale = nil
    configure_locale
    redirect_back fallback_location: root_path
  end

  private

  def locale_params() = params.permit(:locale)
end
