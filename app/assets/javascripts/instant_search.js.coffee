class window.InstantSearch
  constructor: (options) ->
    @search_field = options.el
    @request_url = options.url
    @request_params = options.params || []

    @search_field.on 'input', (e) => @delay(200, => @performSearch(e))

  performSearch: (e) ->
    data = @getRequestData()
    data['search'] = @search_field.val()

    $.ajax(
      type: 'GET',
      timeout: 5000,
      url: @request_url,
      dataType: 'script',
      data: data
    ).fail( (jqXHR, textStatus, errorThrown) ->
      console.log 'instant search failed'
      console.log errorThrown
    )

  delay: (ms, func) ->
    clearTimeout @timer
    @timer = setTimeout func, ms

  getRequestData: ->
    data = {}
    @request_params.forEach (el) ->
      val = $("#" + el).val()
      data[el] = val if val
    data
