require "net/http"

class Feed < ApplicationRecord
  def rss
    xml = Net::HTTP.get(URI.parse(url))
    RSS::Parser.parse(xml)
  end
end
