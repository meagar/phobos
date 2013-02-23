
class window.ArticlePreviewer
  constructor: ->
    $ => @bind()
    @showdown ?= new Showdown.converter()

  bind: ->
    @$form = $("#article_form")
    @$preview = $(".preview")

    # Title
    @$titleInput = $("#article_title")
    @$titleOutput = @$preview.find("h1.title")

    @$titleInput.bind "change keyup", (event) =>
      @$titleOutput.text(@$titleInput.val())

    # Body
    @$bodyInput = $("#article_body")
    @$bodyOutput = @$preview.find(".body")
    @$format = $("#article_format")

    @$format.bind "change", (event) =>
      @$bodyInput.trigger "change"

    $(@$bodyInput, @$format).bind "change keyup", (event) =>
      format = @$format.val()

      if format == "HTML"
        @$bodyOutput.html(@$bodyInput.val())
      else if format == "Markdown"
        @$bodyOutput.html(@showdown.makeHtml(@$bodyInput.val()))
