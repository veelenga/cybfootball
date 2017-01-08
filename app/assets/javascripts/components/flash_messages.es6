// jshint esversion: 6

App.FlashMessages = class FlashMessages extends React.Component {
  bootstrapClass (type) {
    let classes = {
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-success',
      success: 'alert-sucess'
    };
    return classes[type] || type;
  }

  componentDidMount() {
    $(".alert").delay(this.props.timeout).fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
  }

  flashMessage (message) {
    return(
      React.DOM.div({key: message.text, className: `alert ${this.bootstrapClass(message.type)} fade in`},
        React.DOM.button({ className: 'close', 'data-dismiss': 'alert' }, '\xD7'),
        message.text
      )
    );
  }

  render () {
    if (this.props.messages.length === 0) return null;
    return(
      React.DOM.div(null,
        this.props.messages.map(message => { return this.flashMessage(message); })
      )
    );
  }
};

App.FlashMessages.propTypes = {
  timeout: React.PropTypes.number
};

App.FlashMessages.defaultProps = {
  timeout: 5000
};
