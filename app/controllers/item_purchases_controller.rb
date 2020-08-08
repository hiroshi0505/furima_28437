class ItemPurchasesController < ApplicationController

  def index
    @item_purchases = Item.all
  end

end
