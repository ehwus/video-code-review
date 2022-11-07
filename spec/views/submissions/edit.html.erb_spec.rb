# frozen_string_literal: true

require "rails_helper"

RSpec.describe "submissions/edit", type: :view do
  let(:submission) {
    Submission.create!(
      item: "MyString",
      full_name: "MyString",
      reflections: "MyText"
    )
  }

  before(:each) do
    assign(:submission, submission)
  end

  it "renders the edit submission form" do
    render

    assert_select "form[action=?][method=?]", submission_path(submission), "post" do
      assert_select "input[name=?]", "submission[item]"

      assert_select "input[name=?]", "submission[full_name]"

      assert_select "textarea[name=?]", "submission[reflections]"
    end
  end
end
