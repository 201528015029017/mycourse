class Comment < ActiveRecord::Base
    validates :userid, presence: true
    validates :dishid, presence: true
    validates :content, presence: true, length: { maximum: 500 }
    validates :score, presence: true
end
