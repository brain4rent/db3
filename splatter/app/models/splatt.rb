class Splatt
  include Mongoid::Document
  include Mongoid::TimeStamps::Created
  field :body, type: String
  embedded_in :user
end
