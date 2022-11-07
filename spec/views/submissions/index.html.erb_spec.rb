# frozen_string_literal: true

require "rails_helper"

RSpec.describe "submissions/index", type: :view do
  before(:each) do
    assign(:submissions, [
      Submission.create!(
        item: "Item",
        full_name: "Full Name",
        reflections: "MyText"
      ),
      Submission.create!(
        item: "Item",
        full_name: "Full Name",
        reflections: "MyText"
      )
    ])
  end

  it "renders a list of submissions" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Item".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Full Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
