require "net/http"

class Feed < ApplicationRecord
  has_many :items, dependent: :destroy

  validate :url_is_parsable

  def rss
    xml = Net::HTTP.get(URI.parse(url))
    RSS::Parser.parse(xml)
  end

  def create_items
    rss.items.map do |item|
      Item.create(title: item.title, link: item.link, description: item.description, feed_id: self.id)
    end
  end

  private

  def url_is_parsable
    begin
      rss
    rescue
      errors.add(:url, "is not parserable")
    end
  end
end
