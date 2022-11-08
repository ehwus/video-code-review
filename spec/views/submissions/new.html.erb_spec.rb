# frozen_string_literal: true

require "rails_helper"
require "faker"

RSpec.describe "submissions/new", type: :view do
  let!(:item_name) { Faker::Educator.course_name }

  it "populates hidden item field from query params" do
    visit new_submission_path prefill_item: item_name

    expect(page).to have_field "submission_item", type: :hidden, with: item_name
  end
end
