require 'rails_helper'

RSpec.describe Feed, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "validate :url_is_parseable" do
    it "is valid if url is parsearble" do
      expect(build(:feed)).to be_valid
    end

    it "is invalid if url is not parsearble" do
      expect(build(:feed, url: "invalid url")).not_to be_valid
    end
  end
end
