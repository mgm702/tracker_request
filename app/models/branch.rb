class Branch < ActiveRecord::Base
  belongs_to :repository
  has_many :commits
end
