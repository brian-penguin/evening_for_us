class Number <ActiveRecord::Base
  belongs_to :user

  validates! :user, presence: true
  validates :number, presence: true, length: { minimum: 1000000000, maximum: 9999999999 }
  validates :number, numericality: { only_integer: true }
end
