class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  #検索機能の定義
  def self.search_for(content, method)
    if method == "perfect"
      Genre.where(name: content)
    elsif method == "forward"
      Genre.where("name LIKE ?", content+"%")
    elsif method == "backward"
      Genre.where("name LIKE ?", "%"+content)
    else
      Genre.where("name LIKE ?", "%"+content+"%")
    end
  end
end
