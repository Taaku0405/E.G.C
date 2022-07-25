class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_users, dependent: :destroy
  has_many :chats, dependent: :destroy

  has_many :users, through: :group_users, source: :user

  has_one_attached :group_image

  validates :name, presence: true
  validates :introduction, presence: true

  #グループ写真を設定しなかった場合
  def get_group_image
    if group_image.attached?
      group_image
    else
      "E.G.C-logo.png"
    end
  end

  #グループオーナーの定義
  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

end
