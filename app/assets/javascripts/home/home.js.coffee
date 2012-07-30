(($) ->
  # Mouse Last Position
  documentHandler = ->
    $current = (if this is document then $(this) else $(this).contents())
    $current.mousemove (e) ->
      jQuery.mlp =
        x: e.pageX
        y: e.pageY

    $current.find("iframe").load documentHandler
  $.mlp =
    x: 0
    y: 0

  $ documentHandler
  $.fn.ismouseover = (overThis) ->
    result = false
    @eq(0).each ->
      $current = (if $(this).is("iframe") then $(this).contents().find("body") else $(this))
      offset = $current.offset()
      result = offset.left <= $.mlp.x and offset.left + $current.outerWidth() > $.mlp.x and offset.top <= $.mlp.y and offset.top + $current.outerHeight() > $.mlp.y

    result
) jQuery

$ ->
  $("form input[id]").each (index,element) ->
    div = $('<div class="conf_panel">R<input type="checkbox">W<input type="checkbox"></div>')
    $("body").append(div)
    div.attr("target", $(element).attr("id"))
    offset = $(element).offset() # get position of the input
    offset.left += $(element).width();
    offset.top -= 30;
    div.offset(offset)
    $(element).mouseover(->
      div.css("opacity", 1)
    ).mouseout(->
      setTimeout (->
        if ! (div.ismouseover() || $(element).ismouseover()) # low opacity if mouse is not on div
          div.css("opacity", 0.2)
      ), 1000
    )

    div.mouseover(->
      div.css("opacity", 1)
    ).mouseout(->
      setTimeout (->
        if ! (div.ismouseover() || $(element).ismouseover()) # low opacity if mouse is not on div
          div.css("opacity", 0.2)
      ), 1000
    )

  $("div.conf_panel").hide() # hide by default

  $('button#admin_mode').click(->
    $("div.conf_panel").toggle()
  )
