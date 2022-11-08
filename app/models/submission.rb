# frozen_string_literal: true

class Submission < ApplicationRecord
  validates :full_name, presence: true
  validates :item, presence: true

  has_many :reviews, dependent: :destroy

  has_one_attached :video
end
