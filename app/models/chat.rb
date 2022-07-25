class Chat < ApplicationRecord
   belongs_to :user
   belongs_to :group

   validates :message, length: { minimum: 1, maximum: 300 }
end
