class UserRepository
  BUCKET = 'users'

  # sets up our connection to the Riak db
  def initialize(client)
    @client = client
  end

  def all
    @users = Array.new
    @client.bucket(BUCKET).keys do |keys|
        key do |user|
	  user << @users
        end
    end
  end

  def delete(user)
    @users = client.find(BUCKET)
    @users.delete(user)
  end

  def find(key)
    riak_obj = @client.bucket(BUCKET)[key]
    user = User.new
    user.email = riak_obj.data['email']
    user.name = riak_obj.data['name']
    user.password =riak_obj.data['password']
    user.blurb = riak_obj.data['blurb']
    user.follows = riak_obj.data['follows']
    user.followers = riak_obj.data['followers']
    user
  end

  def save(user)
    users = @client.bucket(BUCKET)
    key = user.email

    unless users.exists?(key)
      riak_obj = users.new(key)
      riak.obj.data = user
      riak_obj.content_type = 'application/json'
      riak_obj.store
    end
  end

  def update(user)
    @key = user.email
    @user = @client.find(@key)
    @user.data = user
    @user.store
  end
end