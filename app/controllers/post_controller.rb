class PostController < ApplicationController
    before_action :authenticate_user!

    def new
        if Work.find_by(user_id: current_user.id).present?
            @work = Work.find_by(user_id: current_user.id)
        else
            @work = Work.new
        end
    end

    def create
        @work = Work.new(work_params)
        @work.user_id = current_user.id
        if @work.save
            redirect_to("/home")
        else
            render 'new'
        end
        
    end

    def edit
        @work = Work.find_by(user_id: current_user.id)
    end

    def update
        @work = Work.find_by(user_id: current_user.id)
        @work.update(work_params)
        @work.save
        
        redirect_to("/home")
    end

    def deleteconfirm
        @work = Work.find_by(user_id: current_user.id)
    end

    def delete
        @work = Work.find_by(user_id: current_user.id)
        @work.destroy
        redirect_to("/home");
    end

    private
        def work_params
            params.require(:work).permit(:image,:name,:occupation,:wage,:hours,:location,:period,:link,:note)
        end


end
