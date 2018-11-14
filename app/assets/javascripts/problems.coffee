# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  loadMathJax()
  $(document).on 'turbolinks:load', loadMathJax

loadMathJax = ->
  window.MathJax = null
  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML", ->
    MathJax.Hub.Config
      showMathMenu: false
      tex2jax:
          inlineMath: [[ '$', '$']]

