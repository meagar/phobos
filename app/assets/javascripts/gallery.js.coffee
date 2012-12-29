(($) ->
  $.fn.sortable_gallery = (options) ->
    $(this).sortable
      update: ->
        ids = $(this).find('li').map -> $(this).data('id')
        ids = ids.toArray()

        $.post options['url'], { "_method": "put", "order": ids }, ->

)(jQuery)

