class PaymentsController < ApplicationController
  layout ->(controller) { controller.request.xhr? ? false : 'application' }

  def more_info
    @payment = Payment.find(params[:payment_id])

    respond_to do |format|
      format.js
    end
  end
end
