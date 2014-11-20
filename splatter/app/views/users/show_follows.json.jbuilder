json.following @follows do |following|
  json.user do
    json.name following.name
    json.blurb following.blurb
    json.email following.email
    json.joined_splatter following.created_at
  end
end
