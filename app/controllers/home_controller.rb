class HomeController < ApplicationController
  
    def top
        @work = Work.all
    end
end
