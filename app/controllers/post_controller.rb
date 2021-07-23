class PostController < ApplicationController
    before_action :authenticate_user!

    def new

    end

    def create
        @work = Work.new(name: params[:name],occupation: params[:occupation],wage: params[:wage],hours: params[:hours],location: params[:location],period: params[:period],link: params[:link],note: params[:note],user_id: current_user.id)
        @work.save
        @work.image = "#{current_user.id}.jpg"
        image = params[:image]
        File.binwrite("public/ptj_images/#{@work.image}",image.read)
        redirect_to("/home")
    end
end
