// jshint esversion: 6

App.Suggestion = class Suggestion extends React.Component {
  constructor(props) {
    super(props);

    this.suggestion = null;
    this.valueSubmitted = false;
    this.handleBlur = this.handleBlur.bind(this);
    this.handleKeyPressed = this.handleKeyPressed.bind(this);
  }

  clearValue () {
    $(this.refs.suggestion).typeahead('val', '');
  }

  handleBlur() {
    if (this.valueSubmitted) {
      this.clearValue();
    }
  }

  handleKeyPressed(e) {
    this.valueSubmitted = false;
    if (e.key === 'Enter' && this.suggestion) {
      this.props.onSelected(this.suggestion);
      this.suggestion = null;
      this.valueSubmitted = true;
      this.clearValue();
    }
  }

  componentDidMount() {
    $(this.refs.suggestion).typeahead(null, {
      display: this.props.display,
      source: this.props.suggests,
      templates: this.props.templates
    }).bind('typeahead:select', (ev, suggestion) => {
      this.suggestion = suggestion;
    }).bind('typeahead:autocomplete', (ev, suggestion) => {
      this.suggestion = suggestion;
    });

    if (this.props.autofocus) {
      this.refs.suggestion.focus();
    }
  }

  render() {
    return(
      React.DOM.input(
        _.extend({
          type: 'text',
          ref: 'suggestion',
          className: 'form-control',
          onBlur: this.handleBlur,
          onKeyPress: this.handleKeyPressed
        }, this.props.input_props)
      )
    );
  }
};

App.Suggestion.propTypes = {
  display: React.PropTypes.string.isRequired,
  suggests: React.PropTypes.func.isRequired,
  templates: React.PropTypes.object.isRequired,
  input_props: React.PropTypes.object,
  onSelected: React.PropTypes.func
};
