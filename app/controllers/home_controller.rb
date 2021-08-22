class HomeController < ApplicationController
  
    def top
        @work = Work.order("created_at DESC")
    end
end
