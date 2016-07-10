# Model for tweet
# @see http://guides.rubyonrails.org/active_record_basics.html
class Tweet < ActiveRecord::Base
  validates :content, length: { maximum: 255 }
  validates :content, presence: true
end
