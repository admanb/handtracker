class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.xml
  
  before_filter :current_user, :only => [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @tpls = Template.find_all_by_public(true)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user
        flash[:notice] = 'Registration complete.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(login_url) }
      format.xml  { head :ok }
    end
  end
  
  def login
  end
  
  def authenticate
    @user = User.find_by_login_and_password(params[:user][:login], params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to(@user)
    else
      flash[:error] = 'Invalid username or password.'
      render :action => 'login'
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(login_url)
  end
  
  private
  
  def current_user
    if User.find(params[:id]) != @user
      flash[:notice] = "That isn\'t you."
      @user ? redirect_to(user_url(@user)) : redirect_to(login_url)
    end
  end
  
end
