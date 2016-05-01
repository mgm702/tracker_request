class Repository < ActiveRecord::Base
  belongs_to :user
  has_many :branches
  has_many :pull_requests
  has_many :pull_request_comments
end
