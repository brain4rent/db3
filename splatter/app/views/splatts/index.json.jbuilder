@user_db = UserRepository.new(Riak::Client.new)
json.splatts @splatts do |splatt|
   json.splatt do
      json.id splatt.id
      json.body splatt.body
      json.created splatt.created_at
      json.last_updated splatt.updated_at
      json.user do
         @user = @user_db.find(splatt.user)
         json.name @user.name
         json.email @user.email
      end
   end
end
