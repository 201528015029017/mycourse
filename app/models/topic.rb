class Topic < ActiveRecord::Base
    validates :userid, presence: true
    validates :content, presence: true, length: { maximum: 500 }
end
