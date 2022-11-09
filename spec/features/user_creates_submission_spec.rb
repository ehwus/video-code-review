# frozen_string_literal: true

require "rails_helper"
require "faker"

RSpec.feature "Creating new Submission", type: :feature do
  let!(:item_name) { Faker::Educator.course_name }

  def create_new_submission
    visit new_submission_path prefill_item: item_name
    fill_in "submission_full_name", with: "Partario"
    fill_in "submission_reflections", with: "It was good thanks"
    attach_file("submission_video", "test/fixtures/files/example.mp4")
    click_button "Create"
  end

  it "populates hidden item field from query params" do
    visit new_submission_path prefill_item: item_name
    expect(page).to have_field "submission_item", type: :hidden, with: item_name
  end

  it "populates hidden item as unspecified if no params given" do
    visit new_submission_path
    expect(page).to have_field "submission_item", type: :hidden, with: "unspecified"
  end

  it "allows the user to successfully create a Submission" do
    create_new_submission
    expect(Submission.all.length).to eq(1)
  end

  it "redirects user to a confirmation page with no prompt if there are no other submissions to be reviewed" do
    create_new_submission
    expect(page).to have_text("Your video has been submitted!")
    expect(page).to have_text("We will send you a notification via email and Slack once it has been reviewed.")
    expect(page).not_to have_text("Do you have time to give a review? Reviewing other's work is a great way to refine your own mentoring and feedback capabilities.")
    expect(page).not_to have_link("Review a colleague's work")
  end

  it "has a prompt to review a random submission if another exists without reviews" do
    submission = create(:submission)

    create_new_submission
    expect(page).to have_text("Your video has been submitted!")
    expect(page).to have_text("We will send you a notification via email and Slack once it has been reviewed.")
    expect(page).to have_text("Do you have time to give a review? Reviewing others' work is a great way to refine your own mentoring and feedback capabilities.")
    expect(page).to have_link("Review a colleague's work", href: submission_path(submission.id))
  end
end
