class CommType < ActiveRecord::Base
  has_many :phones, dependent: :restrict_with_exception
  has_many :emails, dependent: :restrict_with_exception
end
