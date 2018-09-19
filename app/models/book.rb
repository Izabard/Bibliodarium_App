class Book < ApplicationRecord
    belongs_to :user
    belongs_to :category
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true
    validates :author, presence: true
    validates :category, presence: true
end
