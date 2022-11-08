# frozen_string_literal: true

require "rails_helper"

RSpec.describe Submission, type: :view do
  let(:create_submission) { create(:submission) }
  describe "submissions/show.html.erb" do
    it "displays the item, name, reflections & video" do
      submission = create_submission
      visit submission_path(submission.id)

      expect(page).to have_text(submission.item)
      expect(page).to have_text(submission.full_name)
      expect(page).to have_text(submission.reflections)
      expect(page).to have_css("video[src=\"#{url_for(submission.video)}\"]")
    end
  end

  describe "submissions/index.html.erb" do
    it "displays the item and name with a link of multiple submissions" do
      submissions = Array.new(5, create_submission)
      visit submissions_path

      submissions.each do |submission|
        expect(page).to have_text(submission.item)
        expect(page).to have_text(submission.full_name)
        expect(page).to have_link("View", href: submission_path(submission.id))
      end
    end
  end
end
