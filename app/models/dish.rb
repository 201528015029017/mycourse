class Dish < ActiveRecord::Base
    validates :dishname, presence: true, length: { maximum: 50 }
    validates :price, presence: true
    validates :dining, presence: true
end
