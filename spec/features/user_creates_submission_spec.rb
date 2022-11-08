# frozen_string_literal: true

require "rails_helper"
require "faker"

RSpec.feature "Creating new Submission", type: :feature do
  let!(:item_name) { Faker::Educator.course_name }

  it "populates hidden item field from query params" do
    visit new_submission_path prefill_item: item_name
    expect(page).to have_field "submission_item", type: :hidden, with: item_name
  end

  it "populates hidden item as unspecified if no params given" do
    visit new_submission_path
    expect(page).to have_field "submission_item", type: :hidden, with: "unspecified"
  end

  it "allows the user to successfully create a Submission" do
    visit new_submission_path prefill_item: item_name
    fill_in 'submission_full_name', with: "Partario"
    fill_in 'submission_reflections', with: "It was good thanks"
    attach_file('submission_video', 'test/fixtures/files/example.mp4')
    click_button 'Create'

    expect(Submission.all.length).to eq(1)
  end
end
