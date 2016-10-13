class window.InstantSearch
  constructor: (options) ->
    @search_field = options.el
    @request_url = options.url

    @search_field.on 'input', (e) => @delay(200, => @performSearch(e))

  performSearch: (e) ->
    str = @search_field.val()

    $.ajax(
      type: 'GET',
      timeout: 5000,
      url: @request_url,
      data_type: 'script',
      data: player: { fio: str }
    ).fail( (jqXHR, textStatus, errorThrown) ->
      console.log 'instant search failed'
      console.log errorThrown
    )

  delay: (ms, func) ->
    clearTimeout @timer
    @timer = setTimeout func, ms
