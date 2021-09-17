class ContactMailer < ApplicationMailer

    def send_mail(contact)
        @contact = contact
        mail to: ENV['ContactMAIL'] , subject: '【お問い合わせ】' 
    end
    
end
