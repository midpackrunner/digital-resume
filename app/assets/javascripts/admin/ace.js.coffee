###
//= require ace/ace
//= require ace/theme-monokai
//= require ace/mode-html
//= require ace/mode-scss
###

$ ->
  ace.require('ace/ext/language_tools')

  class CodeEditor
    constructor: (@formSelector, @editorSelector) ->
      @editor = ace.edit(@editorSelector)
      @initialize()

    initialize: (mode=null) ->
      @editor.setTheme('ace/theme/monokai')
      @editor.getSession().setMode(mode)
      @editor.commands.addCommand(@saveCommand())
      @editor.setOptions(@editorOptions())

    saveCommand: ->
      name: 'Save'
      bindKey: {win: 'Ctrl-S', mac: 'Command-S'}
      exec: ->
        $(@formSelector).submit()

    editorOptions: ->
      maxLines: Infinity
      enableBasicAutocompletion: true

    contents: ->
      @editor.getSession().getValue()

  class HtmlEditor extends CodeEditor
    initialize: ->
      super 'ace/mode/html'

  class CssEditor extends CodeEditor
    initialize: ->
      super 'act/mode/scss'
