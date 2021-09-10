class ApplicationController < ActionController::Base
  before_filter :miniprofiler

  

  private
  def miniprofiler
    Rack::MiniProfiler.authorize_request
  end
end
