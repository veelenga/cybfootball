// jshint esversion: 6

class Autocomplete {
  constructor (opts) {
    this.input = opts.el;
    this.output = opts.out;
    this.display = opts.display;
    this.suggestion = opts.suggestion;

    var bloodhound = this.bloodhound(opts.url);
    bloodhound.initialize();

    this.input.ready(() => this.initTypeahead(bloodhound.ttAdapter()));
  }

  bloodhound (url) {
    return new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.whitespace,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: `${url}?q=%QUERY`,
        wildcard: '%QUERY'
      }
    });
  }

  initTypeahead (source) {
    this.input.typeahead(null, {
      display: this.display,
      source: source,
      templates: {
        empty: "<p class='text-center'>Nothing found</p>",
        suggestion: this.suggestion
      }
    }
    ).bind('typeahead:select', (ev, suggestion) =>
      this.saveSelected(suggestion.id)
    ).bind('typeahead:autocomplete', (ev, suggestion) =>
      this.saveSelected(suggestion.id)
    );
  }

  destroy () {
    this.input.typeahead('destroy');
  }

  saveSelected (id) {
    this.output.val(id);
  }
}
