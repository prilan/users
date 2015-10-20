class User < ActiveRecord::Base
  has_many :assignments
  has_many :services, through: :assignments
  validates :name, presence: true,
      length: { minimum: 3 }

end
