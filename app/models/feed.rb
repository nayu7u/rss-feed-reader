require "net/http"

class Feed < ApplicationRecord
  has_many :items

  def rss
    xml = Net::HTTP.get(URI.parse(url))
    RSS::Parser.parse(xml)
  end

  def create_items
    rss.items.map do |item|
      Item.create!(title: item.title, link: item.link, description: item.description, feed_id: self.id)
    end
  end
end
