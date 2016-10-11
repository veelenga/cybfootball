class window.InstantSearch
  constructor: (options) ->
    @search_field = options.el
    @request_url = options.url

    @search_field.on 'input', (e) => @search(e)

  search: (e) ->
    str = $('#player_search_by_fio').val()

    $.ajax(
      type: 'GET',
      url: @request_url,
      data_type: 'script',
      data: player: { fio: str }
    ).done( ->
      console.log 'instant search done'
    ).fail( (jqXHR, textStatus, errorThrown) ->
      console.log 'instant search failed'
      console.log errorThrown
    )
