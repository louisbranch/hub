$ likeBuild = ->
  if $('#like_form').length
    radios = $('#like_form input:radio')
    for i in radios
      $(i).click ->
        $('#like_form form').submit()
        
