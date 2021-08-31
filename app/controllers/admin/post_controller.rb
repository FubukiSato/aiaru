class Admin::PostController < ApplicationController
    before_action :if_not_admin

    def admin_delete
        @work = Work.find_by(id: params[:id])
        if @work.destroy
            flash[:notice] = "アルバイトの募集を削除しました"
            redirect_to("/home");
        else
            flash[:alert] = "アルバイトの削除に失敗しました"
            redirect_to("/home")
        end
    end

    private
    def if_not_admin

        if user_signed_in? && current_user.admin?
        else
            redirect_to("/home")
        end
    end
  end