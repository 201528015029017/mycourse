class DishesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:deletedish]
  
  @@dishtagsname = {:difangcai => "地方菜" , :huoguo => "火锅",:quanbu => "全部",:rihanliaoli => "日韩料理", :tesexiaochi => "特色小吃", :xiaoye => "宵夜",
     :xinpin =>"新品",:xishikuaican => "西式快餐" ,:yinliao => "饮料"  
  }
  def self.dishtagsname
    @@dishtagsname
  end
  def getDishes
    dining = params[:dining]
    #
    #puts search
    if dining == '0'
      dishes = Dish.all
    else
      dishes = Dish.where(:dining => dining)
    end

    #puts 1111
    #puts dishes[0].id
    render :json => dishes
    #render :text=>true
  end
  
  def selectDishes
    search = params[:search_text]
     if !search.nil?
      @dishes = Dish.find_by_sql("select * from dishes where dishname like '%" + search + "%'");
     end
  end
  #首页
  def index
  end
  
  def updatedish 
   # put 111111111111
   dishid = params[:id]
   oridish = Dish.find(dishid)
   
    
    if params[:product_edit].nil?
      pictureUrl = oridish.picurl
    else
      aaa = params[:product_edit][:edit_image_url]
      pictureUrl = uploadfile(aaa)
      file_path = "#{Rails.root}/public/images/upload_dish_images/#{oridish.picurl}"
      if File.exist?(file_path)
        File.delete(file_path)
        puts oridish.picurl
        puts file_path
      end
    end
    dishname= params[:edit_dish_anme_input]
    dishdesc= params[:edit_dish_anme_textarea]
    dishdining= getDining(params[:edit_dish_dining])
    dishfloor= getfloor(params[:edit_dish_floor])
    dishprice= params[:edit_dish_price].to_f
    discheckedhtag = params[:edit_shaixuan]
    dishtags="";
    if !discheckedhtag.nil?
       
       discheckedhtag.each do |tag|
       dishtags += tag
       dishtags += "#"
       end
    end
    oridish.update_attributes!(:dishname =>dishname,:price =>dishprice, :dining => dishdining, :floor =>dishfloor, :tags =>dishtags, :picurl =>pictureUrl, :describtion =>dishdesc);
    #dish = Dish.find_by_sql("uptate dishes set dishname = '#{dishname}' ,price = #{dishprice} ,dining = #{dishdining} ,floor =#{dishfloor} ,tags = '#{dishtags}' ,
    #      picurl = '#{pictureUrl}' ,describtion = '#{dishdesc}' where id = #{dishid}");
    
    redirect_to dishdetails_path(:id => dishid)
  end
  
  def upload 
   # put 111111111111
    aaa = params[:product][:image_url]
    pictureUrl = uploadfile(aaa);
    dishname= params[:dish_anme_input]
    dishdesc= params[:dish_anme_textarea]
    dishdining= getDining(params[:add_dish_dining])
    dishfloor= getfloor(params[:add_dish_floor])
    dishprice= params[:add_dish_price].to_f
    discheckedhtag = params[:create_shaixuan]
    dishcratetime = Time.new
    dishtags="";
    if !discheckedhtag.nil?
      
      discheckedhtag.each do |tag|
      dishtags += tag
      dishtags += "#"
      end
    end
    
    dish = Dish.create(:dishname =>dishname,:price =>dishprice, :dining => dishdining, 
      :floor =>dishfloor, :tags =>dishtags, :score =>0 ,:count =>0,:createtime =>dishcratetime, :picurl =>pictureUrl, :describtion =>dishdesc)
    
    redirect_to dishdetails_path(:id => dish.id)
  end
  
  def create
       
  end
  
  def dishdetails
    @dishid = params[:id]
    @singleDish = Dish.find(@dishid)
    @dishcomment = Comment.find_by_sql("select comments.id as id,userid,username,content,comments.createtime as createtime,comments.score as score from users, comments, dishes where users.id = comments.userid
                                          and comments.dishid = dishes.id and dishes.id = #{@dishid}" )
    
  end
  
  def addComment
    dishid = params[:dishid]
    userid = sessionOrNot
    if userid == 0
      render :text => 0
    else
      content = params[:comment]
      score = params[:rating]
      createtime = Time.new
      comm = Comment.create!(:userid => userid, :dishid => dishid, :content => content,:score => score ,:createtime  =>createtime);
      alertdish = Dish.find_by_sql("update dishes set count = count+1,score=score+#{score} where id = #{dishid}")
      if comm.nil?
        render :text => 1
      else
        render :text => 2
      end
    end
    
  end
  
  def deletedish
    dishid = params[:id]
    Dish.delete(dishid)
    
    redirect_to dishes_path
  end
  
  
  private
  def getDining(src)
    if src == "一食堂"
      return 1;
    elsif src == "二食堂"
      return 2;
    else
      return 3;
    end
  end
  
  
  private
  def getfloor(src)
    if src == "一层"
      return 1;
    elsif src == "二层"
      return 2;
    else
      return 3;
    end
  end
  
  protected
  def uploadfile(file)
    if !file.original_filename.empty?
      filename = Time.new.strftime("%Y%m%d%H%M%S") + newpass(5) + file.original_filename
      #设置目录路径，如果目录不存在，生成新目录
      FileUtils.mkdir("#{Rails.root}/public/images/upload_dish_images") unless File.exist?("#{Rails.root}/public/images/upload_dish_images")
      #写入文件      
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open("#{Rails.root}/public/images/upload_dish_images/#{filename}", "wb") do |f|
        f.write(file.read)
      end
      return filename
    end
  end
  
  private
   def newpass( len )
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

end
