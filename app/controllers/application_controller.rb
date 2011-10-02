class ApplicationController < ActionController::Base
  protect_from_forgery

  require File.join(Rails.root, "lib", "authen.rb")
  include ::Authen
end
