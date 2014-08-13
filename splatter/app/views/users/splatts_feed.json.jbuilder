json.splatts_feed @feed do |splatt|
	json.name User.find(splatt.user).name
	json.date splatt.updated_at
	json.splatt splatt.body
end
	