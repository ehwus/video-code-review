# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Creating new Review", type: :feature do
  let!(:submission) { create(:submission) }

  it "allows a user to create a review" do
    visit submission_path(submission.id)
    review_text = 'What an excellent submission! Spectacular!'
    # Lovecraftian DOM manipulation to avoid JavaScript
    find(:xpath, "//\*[@id='review_content_trix_input_review']", visible: false).set(review_text)
    click_button 'Submit'
    expect(page).to have_text(review_text)
  end
end
