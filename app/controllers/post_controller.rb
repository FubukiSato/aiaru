class PostController < ApplicationController
    before_action :authenticate_user!

    def new
        @work = Work.new
        if Work.find_by(id: current_user.id)
            redirect_to("/home")
        end
    end

    def create
        @user = User.new(work_params)
        @user.user_id = current_user.id
        if @user.save
            render 'top'
        else
            render 'new'
        end
        
    end

    def edit
        @work = Work.find_by(user_id: current_user.id)
    end

    def update
        @work = Work.find_by(user_id: current_user.id)
        @work.update(name: params[:name],occupation: params[:occupation],wage: params[:wage],hours: params[:hours],location: params[:location],period: params[:period],link: params[:link],note: params[:note])
        
        if params[:image].present?
        @work.image = "#{current_user.id}.jpg"
        image = params[:image]
        File.binwrite("public/#{@work.image}",image.read)
        end

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
