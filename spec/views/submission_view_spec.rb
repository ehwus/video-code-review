# frozen_string_literal: true

require "rails_helper"

RSpec.describe Submission, type: :view do
  let(:create_submission) { create(:submission) }

  describe "submissions/show.html.erb" do
    let!(:submission) { create_submission }
    let(:submission_with_review) { create(:submission, reviews: [create(:review)]) }

    before(:each) { visit submission_path(submission.id) }

    it "displays the item, name, reflections & video" do
      expect(page).to have_text(submission.item)
      expect(page).to have_text(submission.full_name)
      expect(page).to have_text(submission.reflections)
      expect(page).to have_css("video[src=\"#{url_for(submission.video)}\"]")
    end

    it "informs user if there are no reviews associated with the submission" do
      expect(page).to have_text("This submission doesn't have any reviews yet!")
    end

    it "renders reviews" do
      visit submission_path(submission_with_review.id)
      expect(page).not_to have_text("This submission doesn't have any reviews yet!")

      original_words = submission_with_review.reviews.first.content.to_plain_text.split(" ")
      original_words.each { |word| expect(page).to have_text(word) }
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
