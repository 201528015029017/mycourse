class TopicsController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:create]
def index
    if params[:sortby].nil?
        sortby = "count"
    else
        sortby = params[:sortby]
    end
    if sortby == "count"
        @topics_list = Topic.find_by_sql("select topics.*,username  from users,topics where users.id = topics.userid order by topics.count desc")
    else
        @topics_list = Topic.find_by_sql("select topics.*,username  from users,topics where users.id = topics.userid order by topics.createtime desc")
    end
    userid = sessionOrNot
    @clickzan_list = Clickzan.find_by_sql("select topicid from clickzans where userid = #{userid}")
    puts @clickzan_list
end

def create
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

def clickzan
    topicid = params[:topicid]
    userid = sessionOrNot
    if userid > 0
        @zan = Clickzan.create(:userid => userid,:topicid => topicid)
        @topic =Topic.find(topicid)
        @topic.count = @topic.count + 1
        @topic.save
        render :text=> @topic.count
    else 
        render :text=> -1
    end
end
end
