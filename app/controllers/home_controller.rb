class HomeController < ApplicationController
  
    def top
        @work = Work.order("created_at DESC")

        
        #@work.each do |work|
         #   limit = work.updated_at
         #   limit.to_date
         #   limit = limit + 1
         #   now = Time.now
         #   if now.after? limit
         #       work.destroy
        #    end
        #end

        #@work = Work.order("created_at DESC")
        
    end

    def detail
        @work = Work.find_by(user_id: params[:id])
    end
end
