class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper :all # include all helpers, all the time
  protect_from_forgery
end
