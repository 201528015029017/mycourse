class TopicsController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:create]
def index
    @topics_list = Topic.find_by_sql("select topics.id,username,content,topics.createtime,count from users,topics where users.id = topics.userid")

end

def create
    puts "create topic"
    userid = sessionOrNot
    if userid == 0 
        render :text=> 0
    else
        content = params[:topic_content]
        time = Time.new
        Topic.create(:userid =>userid,:content =>content,:createtime =>time ,:count =>0)
        render :text=> 1
    end
end
end
