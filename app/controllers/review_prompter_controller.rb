# frozen_string_literal: true

class ReviewPrompterController < ApplicationController
  def index
    @submission_to_review = get_submission_to_review(params[:owned_id])
  end

  private
    def get_submission_to_review(owned_review_id)
      return if Submission.all.empty?

      Submission.where.not(id: owned_review_id).sample
    end
end
