# frozen_string_literal: true

require "rails_helper"

RSpec.describe "submissions/new", type: :view do
  before(:each) do
    assign(:submission, Submission.new(
      item: "MyString",
      full_name: "MyString",
      reflections: "MyText"
    ))
  end

  it "renders new submission form" do
    render

    assert_select "form[action=?][method=?]", submissions_path, "post" do
      assert_select "input[name=?]", "submission[item]"

      assert_select "input[name=?]", "submission[full_name]"

      assert_select "textarea[name=?]", "submission[reflections]"
    end
  end
end
