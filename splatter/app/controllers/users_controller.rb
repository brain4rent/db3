class UsersController < ApplicationController

before_filter :set_headers
  
  # GET /users
  # Returns a list of all users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/[:id]
  # Returns user with specified id
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # Creates a user - using POST body
  def create
    @user = User.new(user_params(params[:user]))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/[:id]
  # Updates a user with specified id - using PUT body
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params[:user]))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/[:id]
  # Deletes user with specified id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  #White listing for user
  def user_params(params)
	params.permit(:email, :password, :name, :blurb)
  end
  
  # GET /users/splatts/[:id]
  # Returns splatts for user with specified id
  def splatts
	@user = User.find(params[:id])
	
	render json: @user.splatts
  end
  
  # GET /users/follows/[:id]
  # Returns list of users followed by specified user
  def show_follows
	@user = User.find(params[:id])
	
	render json: @user.follows
  end
  
  # GET /users/followers/[:id]
  # Returns list of user who follow user with specified id
  def show_followers
	@user = Users.find(params[:id])
	
	render json: @user.followed_by
  end
  
  # POST /users/follows
  # Creates a follower/followed relationship - using POST body
  def add_follows
	@user = User.find(params[:follower_id])
	@follows User.find(params[:followed_id])

	if @user.follows << @follows and @follows.followers << @user
	  head :no_content
	  render json: @user.follows
	else
  	  render json: @user.errors, status: :unprocessable_entity
	end
  end
  
  # DELETE /users/follows/[:id1]/[:id2]
  # Causes user with id1 to unfollow the user with id2
  def delete_follows
	@user = User.find(params[:id])
	@follows = User.find(params[:follows_id])
	
	@user.follows.delete(@follows)
	@follows.followers.delete(@user)
	
	render json: @user.follows
  end
  
  # GET /users/splatts-feed/[:id]
  #Returns the splatts feed for the user with the specified id
  def splatts_feed
	@feed = Splatt.find_by_sql(["SELECT * FROM splatts JOIN follows ON splatts.user_id = follows.followed_id JOIN users ON follows.follower_id = users.id WHERE users.id = ?", params[:id]])
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
