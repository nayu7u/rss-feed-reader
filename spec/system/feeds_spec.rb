require 'rails_helper'

RSpec.describe "Feeds", type: :system do
  before do
    driven_by(:selenium)
  end

  it "show the index" do
    visit feeds_url
    expect(page).to have_contain("Feeds")
  end
end
