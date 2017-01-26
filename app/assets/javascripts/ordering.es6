// jshint esversion: 6

class Ordering {
  constructor(opts) {
    this.sortable = opts.sortable;
    this.element = opts.element;
    this.request_url = opts.url;

    $(this.sortable).sortable({ update: () => this.onOrderChange() });
  }

  onOrderChange() {
    const order = $(this.element).map( (_, element) => { return element.id; });

    $.ajax({
      type: 'PUT',
      timeout: 5000,
      url: this.request_url,
      dataType: 'script',
      data: { order: order.toArray() }
    }).fail((jqXHR, textStatus, errorThrown) => {
      console.log(errorThrown);
    });
  }
}
