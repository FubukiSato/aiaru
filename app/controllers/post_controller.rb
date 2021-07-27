class PostController < ApplicationController
    before_action :authenticate_user!

    def new
        @work = Work.find_by(user_id: current_user.id)
    end

    def create
        @work = Work.new(name: params[:name],occupation: params[:occupation],wage: params[:wage],hours: params[:hours],location: params[:location],period: params[:period],link: params[:link],note: params[:note],user_id: current_user.id)
        @work.image = "#{current_user.id}.jpg"
        @work.save
        image = params[:image]
        File.binwrite("public/#{@work.image}",image.read)
        redirect_to("/home")
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


end
