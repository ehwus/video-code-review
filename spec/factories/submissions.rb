# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :submission do
    item { Faker::Educator.course_name }
    full_name { Faker::Books::Dune.character }
    reflections { Faker::Books::Dune.saying }

    after(:build) do |submission|
      submission.video.attach(
        io: File.open(Rails.root.join("test", "fixture_files", "example.mp4")),
        filename: "example.mp4",
        content_type: "video/mp4"
      )
    end
  end
end
