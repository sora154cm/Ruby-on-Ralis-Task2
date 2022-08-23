class Book < ApplicationRecord

belongs_to :user

#Titleが存在しているかを確認するバリデーション
validates :title, presence: true
#Opinionが存在しているかを確認するバリデーション
validates :body, presence: true, length: { maximum: 200}

end
