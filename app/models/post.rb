class Post < ApplicationRecord
    has_many :comments 
    has_many :post_tags
    has_manmy :tags, through: :post_tags
end
