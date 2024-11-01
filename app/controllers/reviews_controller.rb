class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal

  def new
    @review = @animal.reviews.build
  end

  def create
    @review = @animal.reviews.build(review_params)
    @review.user = current_user # Assuming you have user authentication

    if @review.save
      redirect_to animal_path(@animal), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @review = @animal.reviews.find(params[:id])
    @review.destroy
    redirect_to animal_path(@animal), notice: 'Review was successfully deleted.'
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
