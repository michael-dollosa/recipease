class ApplicationController < ActionController::Base
  # adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def parse_youtube_url(url)
    url_regexp = %r{(?:.be/|/watch\?v=|/(?=p/))([\w/\-]+)}
    # url_regexp = %r{youtube.com.*(?:\/|v=)(.+)}
    return url if url.match(url_regexp).nil?

    id = url_regexp.match(url)[1]
    "https://www.youtube.com/embed/#{id}"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fullname username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fullname username])
  end
end
