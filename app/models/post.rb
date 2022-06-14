class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: :true
end
