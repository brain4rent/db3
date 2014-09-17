class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :blurb, type: String
  embeds_many :splatts
  has_and_belongs_to_many :follows, class_name: "User"
  has_and_belongs_to_many :followers, clas_name: "User"
end
