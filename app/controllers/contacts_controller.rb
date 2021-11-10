class ContactsController < ApplicationController
    def new
        @contact = Contact.new
      end
    
      def confirm
        @contact = Contact.new(contact_params)
        if @contact.invalid?
          flash.now[:alert] = "お問い合わせに失敗しました"
          render :new
        end
      end
    

      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.send_mail(@contact).deliver_now
          flash[:notice] = "お問い合わせが完了しました"
          redirect_to("/home")
        else
          flash.now[:alert] = "お問い合わせに失敗しました"
          render :new
        end
      end
    
      private
    
      def contact_params
        params.require(:contact).permit(:email,:name,:phone_number,:message)
      end
end
