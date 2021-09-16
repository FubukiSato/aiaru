class Contact < ApplicationRecord

    with_options presence: true do
        validates :name
        validates :email
        validates :phone_number
        validates :message
    end
end
