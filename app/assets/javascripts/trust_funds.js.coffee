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

new Rule
  condition: -> $('#c_trust_funds a.popoverized').length
  load: ->
    @map.replace_function = (event, data) ->
      if $(this).data('popover') instanceof $.fn.popover.Constructor
        event.stopPropagation()
        event.preventDefault()
        $(this).popover('destroy')
        $(this).attr('data-remote', true)

    $(document).on 'click', 'a.popoverized', @map.replace_function
  unload: ->
    $(document).off 'click', 'a.popoverized', @map.replace_function
 
