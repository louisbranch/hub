textTooltip = (e, text) ->
  $(e).qtip
    content:
      text: text
    style:
      classes: 'ui-tooltip-dark ui-tooltip-shadow'
    position:
      viewport: $(window)
      my: 'top center'
      at: 'bottom center'
      target: e
      effect: false

urlTooltip = (e, url) ->
  $(e).qtip
    content:
      text: 'loading...'
      ajax:
        url: url
        type: 'GET'
    style:
      classes: 'ui-tooltip-dark ui-tooltip-shadow'
    position:
      viewport: $(window)
      my: 'bottom center'
      at: 'top center'
      target: e
      effect: false

$ toolTip = ->
  if $('[data-tooltip=true]').length
    alert 'hi'
    elements = $('[data-tooltip=true]')
    for i in elements
      if $(i).data('tooltip-text')
        text = $(i).data('tooltip-text')
        textTooltip(i,text)
      else if $(i).data('tooltip-url')
        url = $(i).data('tooltip-url')
        urlTooltip(i,url)
