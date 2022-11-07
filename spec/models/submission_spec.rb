# frozen_string_literal: true

require "rails_helper"

RSpec.describe Submission, type: :model do
  describe "validations" do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:full_name) }
    it { should have_one_attached(:video) }
  end
end
