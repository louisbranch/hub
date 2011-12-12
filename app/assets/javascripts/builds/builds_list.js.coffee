$ buildClassFilter = ->
  if $('ul#build_filter').length
    builds = $('tr.builds')
    $('select#filter_class').change ->
      class_id = $('select#filter_class').val()
      for i in builds
        if class_id
          if $(i).attr('data-class-id') == class_id
            $(i).show()
          else
            $(i).hide()
        else
          $(i).show()
      

