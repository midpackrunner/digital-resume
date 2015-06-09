###
//= require admin/ace
###

$ ->
  window.resumeSite ||= {}

  formSelector = '#content-form'
  window.resumeSite.htmlEditor = new HtmlEditor(formSelector, 'html-editor')
  window.resumeSite.cssEditor = new CssEditor(formSelector, 'css-editor')

  $(formSelector).on 'submit', ->
    $('#content_html').val(window.resumeSite.htmlEditor.contents())
    $('#content_css').val(window.resumeSite.cssEditor.contents())