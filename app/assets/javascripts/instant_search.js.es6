class InstantSearch {
  constructor (opts) {
    this.search_field   = opts.el
    this.search_btn     = opts.btn
    this.request_url    = opts.url
    this.request_params = opts.with_params || []

    this.search_btn.on('click', (e) => this.performSearch(e))
    this.search_field.on('input', (e) => this.delay(200, () => this.performSearch(e)))
  }

  performSearch (e) {
    let data = this.getRequestData({ search: this.search_field.val() })

    $.ajax({
      type: 'GET',
      timeout: 5000,
      url: this.request_url,
      dataType: 'script',
      data: data
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log('instant search failed')
      console.log(errorThrown)
    })
  }

  delay (ms, func) {
    clearTimeout(this.timer)
    this.timer = setTimeout(func, ms)
  }

  getRequestData (data) {
    return this.request_params.reduce(function(acc, el) {
      let val = $(`#${el}`).val()
      if (val) acc[el] = val
      return acc
    }, data)
  }
}
