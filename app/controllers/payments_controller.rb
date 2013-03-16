class PaymentsController < ApplicationController
  before_filter :parameters

  layout ->(controller) { controller.request.xhr? ? false : 'application' }

  def more_info
    @payment = Payment.find(params[:payment_id])

    respond_to do |format|
      format.js
    end
  end

  private

  def parameters
    params.permit!
  end
end
