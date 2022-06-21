class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: :true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #検索機能の定義
  def self.search_for(content, method)
    if method == "perfect"
      Post.where(name: content)
    elsif method == "forward"
      Post.where("name LIKE ?", content+"%")
    elsif method == "backward"
      Post.where("name LIKE ?", "%"+content)
    else
      Post.where("name LIKE ?", "%"+content+"%")
    end
  end

end
