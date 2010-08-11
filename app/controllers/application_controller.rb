class ApplicationController < ActionController::Base
  include ActionView::Helpers::TextHelper
  protect_from_forgery
  layout 'application'
  before_filter :authenticate_user!
end
