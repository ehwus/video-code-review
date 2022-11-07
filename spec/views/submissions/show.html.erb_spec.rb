# frozen_string_literal: true

require "rails_helper"

RSpec.describe "submissions/show", type: :view do
  before(:each) do
    assign(:submission, Submission.create!(
      item: "Item",
      full_name: "Full Name",
      reflections: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/MyText/)
  end
end
