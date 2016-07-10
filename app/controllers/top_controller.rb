# Contoller for top page.
# @see http://guides.rubyonrails.org/action_controller_overview.html
class TopController < ApplicationController
  def index
    @tweets = Tweet.order 'updated_at DESC'
    @tweet = Tweet.new
  end
end
