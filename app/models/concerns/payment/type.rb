class Payment
  module Type
    extend ActiveSupport::Concern

    module ClassMethods
      def is_estimated?(payment)
        if payment && payment.amount.exists?
          close(payment)
        else
          self.estimate_payment(payment).save!
        end
      end

      def estimate_payment(payment)
        "Estimate fancy calculations"
      end

      def close(payment)
        payment.save!
      end
    end
  end
end
