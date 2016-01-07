class UsersController < ApplicationController
        protect_from_forgery :except => :index
  def index
    #@ok=1
  end
  def getUser
    render :json => session[:user]
    
  end

  
  def login
    @uemail=params[:email]
    @upwd=params[:password]
    @user=User.where(:email=>@uemail)
    if @user[0].nil?||@user[0].password !=@upwd
      #email or pwd is wrong
      
     render :text=>false
    else
      session[:user] = @user[0]
      puts 'now'
      puts session[:user].email
      render :text=>true
    end
  end

  def logout
    puts '123'
    session[:user] = nil
  end
 
  def register
    @uemail = params[:email]
    @uname = params[:nickname]
    @password = params[:password]
    @user=User.where(:email =>@uemail)
    if @user[0].nil?
      @user = User.create(:email =>@uemail,:username =>@uname,:isadmin =>'0' ,:password =>@password)
      session[:user] = @user
      render :text=>true
    else
      render :text=>false
    end
    
  end
  
  def show
  end
  
  def create
  end
end
