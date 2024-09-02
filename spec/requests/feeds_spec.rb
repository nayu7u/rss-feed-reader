require 'rails_helper'

RSpec.describe "Feeds", type: :request do
  describe "GET /feeds" do
    it "responds ok" do
      get feeds_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /feeds/new" do
    it "responds ok" do
      get new_feed_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /feeds" do
    it "save new feed" do
      expect {
        post feeds_path, params: { feed: { name: "name", url: "url" } }
      }.to change(Feed, :count).by(1)
    end

    it "redirect_to feed_path(Feed.last)" do
      post feeds_path, params: { feed: { name: "name", url: "url" } }
      expect(response).to redirect_to(feed_path(Feed.last))
    end
  end

  describe "GET /feeds/:id" do
    it "responds ok" do
      feed = create(:feed)
      get feed_path(feed)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /feeds/:id/edit" do
    it "responds ok" do
      feed = create(:feed)
      get edit_feed_path(feed)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /feeds/:id/edit" do
    it "redirect to feed_path(feed)" do
      feed = create(:feed)
      patch feed_path(feed), params: { feed: { name: "name", url: "url" } }
      expect(response).to redirect_to(feed_path(feed))
    end
  end

  describe "DELETE /feeds/:id" do
    it "destroy the feed" do
      feed = create(:feed)
      expect {
        delete feed_path(feed)
      }.to change(Feed, :count).by(-1)
    end

    it "redirect to feeds_path" do
      feed = create(:feed)
      delete feed_path(feed)
      expect(response).to redirect_to(feeds_path)
    end
  end
end
