$ skillFilter = ->
  if $('ul#skill_filters').length
    filters = $('ul#skill_filters a')
    for i in filters
      $(i).click ->
        $('a.filter_active').removeClass('filter_active')
        $(this).addClass('filter_active')
        filterSkillByType(this)
        false


filterSkillByType = (e) ->
  filter = $(e).data('filter')
  skills = $('article.skill_block')
  for i in skills
    if filter == 'all'
      $(i).show()
    else if $(i).hasClass(filter)
      $(i).show()
    else
      $(i).hide()
