class Item < ApplicationRecord
  belongs_to :feed
  validates :feed, uniqueness: { scope: :link }
end
