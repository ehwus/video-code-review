# frozen_string_literal: true

json.extract! submission, :id, :item, :full_name, :reflections, :created_at, :updated_at
json.url submission_url(submission, format: :json)
