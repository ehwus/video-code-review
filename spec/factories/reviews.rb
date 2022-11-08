# frozen_string_literal: true

require "faker"

FactoryBot.define do
  factory :review do
    association :submission, factory: :submission
    content { Faker::Lorem.paragraphs.map { |pr| "<p>#{pr}</p>" }.join }
  end
end
