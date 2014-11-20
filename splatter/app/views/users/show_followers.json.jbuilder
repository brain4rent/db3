json.followers @followers do |follower|
  json.user do
    json.name follower.name
    json.blurb follower.blurb
    json.email follower.email
    json.joined_splatter follower.created_at
  end
end
