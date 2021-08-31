class HomeController < ApplicationController
  
    def top
        @work = Work.order("created_at DESC")

        
        @work.each do |work|
            @limit = work.updated_at
            @limit_date = @limit.to_date
            @limit_1 = @limit_date + 60
            @now = Time.now
            if @now.after? @limit_1
                work.destroy
            end
        end

        @work = Work.order("created_at DESC")

    end

    def detail
        @work = Work.find_by(user_id: params[:id])
    end
end
