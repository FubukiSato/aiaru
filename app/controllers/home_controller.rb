class HomeController < ApplicationController
  def top
    @work = Work.find_by(id: 5)
  end
end
