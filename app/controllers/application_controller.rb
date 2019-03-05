class ApplicationController < ActionController::Base

  def splash
    render file: 'applications/splash'
  end
end
