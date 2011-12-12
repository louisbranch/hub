$ showQuotes = ->
  if $('div#img_classes').length
    imgs = $("a.img_class")
    random_number = Math.floor(Math.random()*5)
    random_class = imgs[random_number]
    setQuote(random_class)
    for i in imgs
      $(i).mouseover ->
        setQuote(this)

setQuote = (e) ->
  $("a.img_active").removeClass("img_active")
  $(e).addClass("img_active")
  $("h3#quotes_title").html($(e).data("title"))
  $("blockquote#quotes").html($(e).data("quote"))
