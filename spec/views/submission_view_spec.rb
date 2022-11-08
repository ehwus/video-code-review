# frozen_string_literal: true

require "rails_helper"

RSpec.describe Submission, type: :view do
  let!(:submission) { create(:submission) }
  describe "submissions/show.html.erb" do
    it 'displays the item, name, reflections & video' do
      visit submission_path(submission.id)

      expect(page).to have_text(submission.item)
      expect(page).to have_text(submission.full_name)
      expect(page).to have_text(submission.reflections)
      expect(page).to have_css("video[src=\"#{url_for(submission.video)}\"]")
    end
  end
end