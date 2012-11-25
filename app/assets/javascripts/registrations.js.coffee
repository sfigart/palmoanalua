# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ($) ->
  $(".phone").mask "(999) 999-9999? x99999"
  Placeholders.init();

# document.getElementsByClassName("eStore_buy_now_button")[0].onclick = ->
#   window.btn_clicked = true
# 
# window.onbeforeunload = ->
#   "You must click \"Buy Now\" to make payment and finish your order. If you leave now your order will be canceled."  unless window.btn_clicked
# 
# window.onbeforeunload = ->
#   "You have not completed your registration. Your data will be lost if you leave the page!"