class Clickzan < ActiveRecord::Base
    validates :userid, presence: true
    validates :topicid, presence: true
end
