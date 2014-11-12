class UserRepository
  BUCKET = 'users'

  # sets up our connection to the Riak db
  def initialize(client)
    @client = client
  end

  def all
    @users = Array.new
    @client.bucket(BUCKET).keys do |keys|
        key.each do |key|
	  @users << find(key)
        end
    end
    @users
  end

  def delete(user)
    @users = @client.bucket(BUCKET)
    @users.delete(user)
  end

  def find(key)
    users = @client.bucket(BUCKET)
    user = User.new
    if users.exists?(key)
      riak_obj = users[key]
      user.email = riak_obj.data['email']
      user.name = riak_obj.data['name']
      user.password = riak_obj.data['password']
      user.blurb = riak_obj.data['blurb']
      user.follows = riak_obj.data['follows']
      user.followers = riak_obj.data['followers']
      user.created_at = riak_obj.data['created_at']
    else
      user.errors = 'User not found' 
    end

    user
  end

  def save(user)
    users = @client.bucket(BUCKET)
    key = user.email
    user.created_at = DateTime.now
    unless users.exists?(key)
      riak_obj = users.new(key)
      riak_obj.data = user
      riak_obj.content_type = 'application/json'
      riak_obj.store
    end
  end

  def update(key, user)
    users = @client.bucket(BUCKET)
    if users.exists?(key)
      riak_obj = users[key]
      if user[:name]
        riak_obj.data['name'] = user[:name]
      end

      if user[:password]
        riak_obj.data['password'] = user[:password]
      end

      if user[:blurb]
        riak_obj.data['blurb'] = user[:blurb]
      end
      
      riak_obj.store
      true
    else
      false
    end
  end
  
  def follow(follower, followed)
    if follower.follows
      follower.follows << followed.email
    else
      follower.follows = [followed.email]
    end

    if followed.followers
      followed.followers << follower.email
    else
      followed.followers = [follower.email]
    end

    update(followed.email, followed)
    update(follower.email, follower)
  end
  
  def unfollow(follower, followed)
    if follower.follows
      follower.follows.delete(followed.email)
    end

    if followed.followers
      followed.followers.delete(follower.email)
    end

    update(follower.email, follower)
    update(followed.email, followed)
  end
  
  def splatts_feed(key)
    @feed = [];
    @user = find(key)
    user_db = SplattRepository.new(@client, @user)
    @feed.concat(user_db.splatts)
    if @user.follows
      @user.follows.each do |follower|
         flwr = find(follower)
         flwr_db = SplattRepository.new(@client, flwr)
         @feed.concat(flwr_db.splatts)
      end
    end

    @feed.sort! { |a,b| a.updated_at <=> b.updated_at }

    @feed
  end
end
