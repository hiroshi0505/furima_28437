class ItemsController < ApplicationController

  before_action :move_to_index, only: :new
  
  def index  # toppageに行く、一覧表示
  end

  def new  # 投稿ページに行く
    # @items = Item.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
end
