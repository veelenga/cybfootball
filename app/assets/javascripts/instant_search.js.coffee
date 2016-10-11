window.InstantSearch = ->
  init: (options) ->
    $('input#player_search_by_fio').on 'input', (e) => @search(e)

  search: (e) ->
    str = $('#player_search_by_fio').val()

    $.ajax(
      type: 'GET',
      url: '/players/search',
      data_type: 'script',
      data: player: { fio: str }
    ).done( ->
      console.log 'instant search done'
    ).fail( (jqXHR, textStatus, errorThrown) ->
      console.log 'instant search failed'
      console.log errorThrown
    )
