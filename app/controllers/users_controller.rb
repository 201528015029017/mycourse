class UsersController < ApplicationController
        protect_from_forgery :except => :index
        
  ALG = 'DES-EDE3-CBC'  
  KEY = "mDAd2dF3"  
  DES_KEY = "1dsD5F4s"  
  
  #加密  
  def encode(str)  
    des = OpenSSL::Cipher::Cipher.new(ALG)  
    des.pkcs5_keyivgen(KEY, DES_KEY)  
    des.encrypt  
    cipher = des.update(str)  
    cipher << des.final  
    return Base64.encode64(cipher) #Base64编码，才能保存到数据库  
  end  
  
  #解密    
  def decode(str)  
    str = Base64.decode64(str)  
    des = OpenSSL::Cipher::Cipher.new(ALG)  
    des.pkcs5_keyivgen(KEY, DES_KEY)  
    des.decrypt  
    des.update(str) + des.final  
  end  
        
  def index
    #@ok=1
  end
  def getUser
    render :json => session[:user]
    
  end
  
  def changePwd
    uid = params[:id]
    pwd = params[:password]
    pwd = encode(pwd)
    user = User.find(uid)
    user.update_attributes!(:password =>pwd )
    session[:user] = user
    render :text=>true 
  end

  
  def login
    @uemail=params[:email]
    @upwd=params[:password]
    @user=User.where(:email=>@uemail)
    if @user[0].nil?||decode(@user[0].password) !=@upwd
      #email or pwd is wrong
      
     render :text=>false
    else
      session[:user] = @user[0]
      render :text=>true
    end
    
    
  end

  def logout
    session[:user] = nil
  end
 
  def register
    @uemail = params[:email]
    @uname = params[:nickname]
    @password = params[:password]
    #加密
    @password = encode(@password) 
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
