FactoryBot.define do
  factory :feed do
    name { "MyString" }
    url { "MyString" }

    after(:build) do |feed|
      def feed.rss
        if url == "invalid url"
          raise
        else
          RSS::RDF.new
        end
      end
    end
  end
end
