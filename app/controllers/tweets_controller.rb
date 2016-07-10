# Contoller for tweets.
# @see http://guides.rubyonrails.org/action_controller_overview.html
class TweetsController < ApplicationController
  def create
    @tweet = Tweet.new tweet_params
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "ツイートしました。" }
        format.json { redirect_to root_path, notice: "ツイートしました。" }
      end
    else
      @tweets = Tweet.order 'updated_at DESC'
      respond_to do |format|
        format.html { render template: 'top/index' }
        format.json { render json: @tweet.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path, notice: "ツイートを削除しました"
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: "ツイートを編集しました。" }
        format.json { redirect_to root_path, notice: "ツイートを編集しました。" }
      end
    else
      @tweets = Tweet.order 'updated_at DESC'
      respond_to do |format|
        format.html { render template: 'top/index' }
        format.json { render json: @tweet.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
