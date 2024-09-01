require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /items" do
    it "responds ok" do
      get items_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /items/:id" do
    it "responds ok" do
      feed = Feed.create
      item = Item.create(feed:)
      get item_path(item)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /items/:id" do
    it "redirect to items_path" do
      feed = Feed.create
      item = Item.create(feed:)
      delete item_path(item)
      expect(response).to redirect_to(items_path)
    end
  end
end
