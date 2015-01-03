class Feed < ActiveRecord::Base
  validates :url, presence: true,
                  length: {minimum: 1}
end
