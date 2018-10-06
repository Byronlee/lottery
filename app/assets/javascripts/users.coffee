# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('button').on 'click', -> 
	  phone = $('input[name=phone]').val()
	  name = $('input[name=name').val()
	  mobilRegexp = /^[1][0-9]{10}$|^([5|6|9])\d{7}$|^[0][9]\d{8}$|^[6]([8|6])\d{5}$/i

	  if (mobilRegexp.test(phone))
	  	if (name)
	  		$.post '/users', { phone: phone, name: name }, (data)->
	  			if data.error
	  				showError('.' + data.error)
	  			else 
	  				showSuccess()
	  	else 
	  		showError('.error-name')
	  else
	  	showError('.error-right-phone')

	$('input').on 'focus', -> 
	  hideError()

hideError = -> 
  $('.error').css('display', 'none')

showError = (className)->
	hideError()
	$(className).css('display', 'inline-block')

showSuccess = ->
 $('.user-form').css('display', 'none')
 $('.success').css('display', 'block')
