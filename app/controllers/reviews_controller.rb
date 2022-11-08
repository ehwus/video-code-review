# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_submission

  def create
    @review = @submission.reviews.create(review_params)
    redirect_to submission_path(@submission)
  end

  def destroy
    @review = @submission.reviews.find(params[:review_id])
    @review.destroy
    redirect_to submission_path(@submission)
  end

  private
    def set_submission
      @submission = Submission.find(params[:submission_id])

      redirect_to submissions_path, notice: "Submission not found" unless @submission
    end

    def review_params
      params.require(:review).permit(:content, :submission)
    end
end
