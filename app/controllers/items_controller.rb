class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all.order(id: :desc)
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :link, :description, :feed_id)
    end
end
