// jshint esversion: 6

App.Messages = class Messages extends React.Component {
  constructor(props) {
    super(props);

    this.state = { messages: props.messages };

    window.FlashMessages = this;
  }

  addMessage(message) {
    let messages = React.addons.update(this.state.messages, { $push: [message] });
    this.setState({ messages: messages });
  }

  removeMessage(message) {
    let index = this.state.messages.indexOf(message);
    let messages = React.addons.update(this.state.messages, { $splice: [[index, 1]] });
    this.setState({ messages: messages });
  }

  render () {
    return(
      React.DOM.div(null,
        this.state.messages.map(message => {
          return React.createElement(App.Alert, {
            key: message.id,
            message: message,
            onFade: (message) => { this.removeMessage(message); }
          });
        })
      )
    );
  }
};

App.Messages.propTypes = {
  messages: React.PropTypes.array.isRequired
};
