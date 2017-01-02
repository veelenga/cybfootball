// jshint esversion: 6

App.Tournament.Group.Name = class GroupName extends React.Component {
  constructor (props) {
    super(props);
    this.state = { edit: false };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleClickEdit = this.handleClickEdit.bind(this);
  }

  handleSubmit (e) {
    if (this.input.value) {
      this.setState({ edit: false });
      this.props.onChange({ name: this.input.value });
    }
    e.preventDefault();
  }

  handleClickEdit (e) {
    this.setState({ edit: true });
    e.preventDefault();
  }

  componentDidUpdate () {
    if (this.input) {
      this.input.focus();
    }
  }

  display() {
    return(
      React.DOM.div({ onClick: this.handleClickEdit, role: 'button' },
        React.DOM.b(null, this.props.name), ' ',
        React.DOM.i({ className: 'fa fa-pencil fa-fw' })
      )
    );
  }

  form () {
    return(
      React.DOM.form({ className: 'form-inline', onSubmit: this.handleSubmit },
        React.DOM.div({ className: 'input-group col-sm-3' },
          React.DOM.input({
            type: 'text',
            className: 'form-control',
            defaultValue: this.props.name,
            ref: (input) => this.input = input
          }),
          React.DOM.span({ className: 'input-group-btn' },
            React.DOM.button({ className: 'btn btn-default', onClick: this.handleSubmit },
              React.DOM.i({ className: 'fa fa-check' })
            )
          )
        )
      )
    );
  }

  render () {
    return (
      this.state.edit ? this.form() : this.display()
    );
  }
};

App.Tournament.Group.Name.propTypes = {
  name: React.PropTypes.string,
  onChange: React.PropTypes.func
};
