# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

new Rule
  condition: -> $('#c_trust_funds #trust_fund_number_of_payments').length
  load: ->
    @map.replace_function ||= (event, data) ->
      number_of_payments = [1..$(this).val()]
      if $('#new_payment .form-inputs').length == 0
        $('[data-dynamic-form-event="addNestedItem"]').click() for payment in number_of_payments

    $(document).on 'change', '#trust_fund_number_of_payments', @map.replace_function
  unload: ->
    $(document).off 'change', '#trust_fund_number_of_payments', @map.replace_function
