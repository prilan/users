class User < ActiveRecord::Base
  has_many :assignments
  has_many :services, through: :assignments
  validates :name, presence: true,
      length: { minimum: 3 }

  def activate(record)
    self.log += " Activate:" + record
  end

  def deactivate(record)
    self.log += " Deactivate:" + record
  end
end
