class UsersController < ApplicationController

before_filter :set_headers
  
  # GET /users
  # Returns a list of all users
  def index
    db = UserRepository.new(Riak::Client.new)
    @users = db.all
  end

  # GET /users/[:id]
  # Returns user with specified id
  def show
    db = UserRepository.new(Riak::Client.new)
    if !@user.errors
      @user = db.find(params[:id])
    else
      render json: @user.errors, status: :not_found
    end
  end

  # POST /users
  # Creates a user - using POST body
  def create
    db = UserRepository.new(Riak::Client.new)

    @user = User.new
    @user.email = params[:user][:email]
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.blurb = params[:user][:blurb]

    if db.save(@user)
      render "show", status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/[:id]
  # Updates a user with specified id - using PUT body
  def update
    db = UserRepository.new(Riak::Client.new)
    if db.update(params[:id], user_params(params[:user]))
      head :no_content
    else
      render json: "Failed to update", status: :unprocessable_entity
    end
  end

  # DELETE /users/[:id]
  # Deletes user with specified id
  def destroy
    db = UserRepository.new(Riak::Client.new)
    db.delete(params[:id])

    head :no_content
  end
  
  #White listing for user
  def user_params(params)
	params.permit(:email, :password, :name, :blurb)
  end
  
  # GET /users/splatts/[:id]
  # Returns splatts for user with specified id
  def splatts
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])
    db = SplattRepository.new(Riak::Client.new, @user)
    @splatts = db.all
  end
  
  # GET /users/follows/[:id]
  # Returns list of users followed by specified user
  def show_follows
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])
  end
  
  # GET /users/followers/[:id]
  # Returns list of user who follow user with specified id
  def show_followers
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])
  end
  
  # POST /users/follows
  # Creates a follower/followed relationship - using POST body
  def add_follows
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])
    @user_to_follow = db.find(params[:follows_id])
    
    if db.follow(@user, @user_to_follow)
      render "show_follows"
    else
      render json: "error saving follow relationship", status: :unprocessable_entity
    end
  end
  
  # DELETE /users/follows/[:id1]/[:id2]
  # Causes user with id1 to unfollow the user with id2
  def delete_follows
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])
    @user_to_unfollow = db.find(params[:followed_id])
    
    if db.unfollow(@user, @user_to_unfollow)
      render "show_follows"
    else
      render json: "error removing follow relationship", status: :unprocessable_entity
    end
  end
  
  # GET /users/splatts-feed/[:id]
  #Returns the splatts feed for the user with the specified id
  def splatts_feed
    @id = params[:id]
    db = UserRepository.new(Riak::Client.new)
    @feed = db.splatts_feed(@id) 

  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
