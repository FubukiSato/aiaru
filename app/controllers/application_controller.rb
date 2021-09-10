class ApplicationController < ActionController::Base
  before_filter :miniprofiler

  require "rack-mini-profiler"

  private
  def miniprofiler
    Rack::MiniProfiler.authorize_request
  end
end
