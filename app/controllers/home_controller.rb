class HomeController < ApplicationController
  def top
    @work = Work.find_by(id: 1)
  end
end
