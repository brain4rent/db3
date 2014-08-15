class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params[:user]))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params[:user]))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  def user_params(params)
	params.permit(:email, :password, :name, :blurb)
  end
  
  def splatts
	@user = User.find(params[:id])
	
	render json: @user.splatts
  end
  
  # GET /users/follows/1
  # GET /users/follows/1.json
  def show_follows
	@user = User.find(params[:id])
	
	render json: @user.follows
  end
  
  # GET /users/followers/1
  # GET /users/followers/1.json
  def show_followers
	@user = Users.find(params[:id])
	
	render json: @user.followed_by
  end
  
  # POST /users/follows
  def add_follows
	@user = User.find(params[:follower_id])
	@user_to_follow = User.find(params[:followed_id])

	@user.follows << @user_to_follow
	
	render json: @user.follows
  end
  
  # DELETE /users/follows/1/2
  # DELETE /users/follows/1/2.json
  def delete_follows
	@user = User.find(params[:id])
	@user_to_delete = User.find(params[:follows_id])
	
	@user.follows.delete(@user_to_delete)
	
	render json: @user.follows
  end
  
  # GET /users/splatts-feed/1
  def splatts_feed
	@feed = Splatt.find_by_sql(["SELECT * FROM splatts JOIN follows ON splatts.user_id = follows.followed_id JOIN users ON follows.follower_id = users.id WHERE users.id = ?", params[:id]])
	
	
  end
end
