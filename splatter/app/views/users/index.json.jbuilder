json.users @users do |user|
  json.user do
    json.name user.name
    json.email user.email
    json.blurb user.blurb
    json.joined_splatter user.created_at
  end
end
