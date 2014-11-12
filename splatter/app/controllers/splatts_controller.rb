class SplattsController < ApplicationController
  # GET /splatts
  # GET /splatts.json
  def index
    @client = Riak::Client.new
    @user_db = UserRepository.new(@client)
    @users = @user_db.all
    @splatts = []
    @users.each do |user|
    	splatt_db = SplattRepository.new(@client, user)
    	@splatts.concat(splatt_db.all)
    end
    @splatts
  end

  # GET /splatts/1
  # GET /splatts/1.json
  def show
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:user_id])
    db = SplattRepository.new(Riak::Client.new, @user)
    @splatt = db.find(params[:id])
  end

  # POST /splatts
  # POST /splatts.json
  def create
    @splatt = Splatt.new
    @splatt.id = SecureRandom.uuid
    @splatt.created_at = Time.now
    @splatt.updated_at = Time.now
    @splatt.body = params[:splatt][:body]
    @splatt.user = params[:splatt][:user]
	
    client = Riak::Client.new
    user = UserRepository.new(client).find(params[:splatt][:user])
    db = SplattRepository.new(client, user)
    
    if db.save(@splatt)
      render "show", status: :created, location: @splatt
    else
      render json: @splatt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /splatts/1
  # DELETE /splatts/1.json
  def destroy
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:user_id])
    db = SplattRepository.new(Riak::Client.new, @user)
    if db.delete(params[:id])
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unauthorized
    end
    head :no_content
  end
end

private

   def splatts_params(params)
      params.permit(:body, :user_id)
   end
