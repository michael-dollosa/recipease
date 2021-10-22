class NewslettersController < ApplicationController
  def create
    @email = Newsletter.new(newsletter_params)
    @email.save

    if @email.save
      redirect_back fallback_location: root_path, success: 'Thank you for subscribing to our newsletter'
    else
      redirect_back fallback_location: root_path, danger: 'Kindly provide a valid email'
    end
  end

  def destroy
    @email = Newsletter.find(params[:id])
    @email.destroy

    if @email.destroy
      redirect_to root_path, success: 'You have unscribed to our newsletter.'
    else
      redirect_to root_path, danger: 'Something went wrong. Please try again'
    end
  end

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
