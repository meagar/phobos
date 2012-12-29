
$ ->
  $('.alert').on 'click', (event) ->
    $(this).slideUp('slow')
    event.preventDefault()
