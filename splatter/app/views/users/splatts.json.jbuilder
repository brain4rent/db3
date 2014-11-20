json.splatts @splatts do |splatt|
  json.splatt do
    json.body splatt.body
    json.created splatt.created_at
    json.last_updated splatt.updated_at
    json.user do
      json.name @user.name
      json.email @user.email
    end
  end
end
