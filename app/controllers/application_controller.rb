class ApplicationController < ActionController::Base
  # adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def parse_youtube_url(url)
    url_regexp = %r{(?:.be/|/watch\?v=|/(?=p/))([\w/\-]+)}
    return url if url.match(url_regexp).nil?

    id = url.split('=').last
    "https://www.youtube.com/embed/#{id}"
  end
end
