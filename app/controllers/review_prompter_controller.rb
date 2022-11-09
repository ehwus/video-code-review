# frozen_string_literal: true

class ReviewPrompterController < ApplicationController
  def index
    @submission_to_review = get_submission_to_review(params[:owned_id])
  end

  private
    def get_submission_to_review(owned_submission_id)
      item_name = Submission.find(owned_submission_id).item
      relevant_submissions = Submission.where(item: item_name).where.not(id: owned_submission_id)

      return relevant_submissions.sample unless relevant_submissions.empty?
    end
end
