$ ->
  $(document).on 'change', '#limit', ->
    $('#limit_form, .limit_form').submit()


  search_initialize = (element) ->
    options =
      language: 'en-Us'
      types: [ '(cities)' ]
    input = element
    autocomplete = new (google.maps.places.Autocomplete)(input[0], options)
    google.maps.event.addListener autocomplete, 'place_changed', ->
      place = autocomplete.getPlace()
      if !place.geometry
        return
      input.val place.name


  $(document).on 'click', '#city', ->
    search_initialize $(this)
