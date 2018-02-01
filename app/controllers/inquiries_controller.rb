class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    inquiry = Inquiry.new(inquiry_params)
    inquiry.save
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:inquirer, :email, :body)
  end
end
