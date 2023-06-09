class Post < ApplicationRecord
  #belongs_to :user
  validates :name, presence: true
  validates :text, presence: true, length: { minimum: 1, maximum: 140 }
end
