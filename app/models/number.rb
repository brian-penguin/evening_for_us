class Number <ActiveRecord::Base
  belongs_to :user

  validates! :user, presence: true
  validates :number, presence: true
end
