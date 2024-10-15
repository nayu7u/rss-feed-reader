class FetchItemsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Feed.all.each(&:create_items)
  end
end
