// jshint esversion: 6

App.Alert = class Alert extends React.Component {
  bootstrapClass (type) {
    let classes = {
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-success',
      success: 'alert-success'
    };
    return classes[type] || classes.success;
  }

  componentDidMount() {
    this.timer = setTimeout(() => {
      $(this.refs.alert).fadeTo(500, 0).slideUp(500, () => {
        this.props.onFade(this.props.message);
      });
    }, this.props.timeout);
  }

  componentWillUnmount() {
    clearTimeout(this.timer);
  }

  render() {
    return(
      React.DOM.div(null,
        React.DOM.div({className: `alert ${this.bootstrapClass(this.props.message.type)} fade in`, ref: 'alert'},
          React.DOM.button({ className: 'close', 'data-dismiss': 'alert' }, '\xD7'),
          this.props.message.text
        )
      )
    );
  }
};

App.Alert.propTypes = {
  onFade: React.PropTypes.func,
  timeout: React.PropTypes.number,
  message: React.PropTypes.object.isRequired
};

App.Alert.defaultProps = {
  timeout: 5000
};
