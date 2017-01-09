// jshint esversion: 6

App.Tournament.Group.Teams = class Teams extends React.Component {
  constructor(props) {
    super(props);

    this.handleRemoveTeam = (team) => { this.props.removeTeam(team); };
  }

  removeTeam (team) {
    if (confirm(I18n.t('views.groups.edit.remove_team_confirm'))) {
      this.handleRemoveTeam(team);
    }
  }

  showTeam (team) {
    return (
      React.DOM.tr({ key: team.id },
        React.DOM.td(null,
          React.DOM.a({ href: `/teams/${team.id}`, className: 'no-underline' },
            React.DOM.img({ src: team.avatar, className: 'img-rounded', height:'48px' }),
            ' ', React.DOM.b(null, team.name)
          )
        ),
        React.DOM.td({ className: 'vert-align' },
          React.DOM.div({ onClick: this.removeTeam.bind(this, team), role: 'button' },
            React.DOM.i({ className: 'fa fa-trash' })
          )
        )
      )
    );
  }

  render () {
    return(
      React.DOM.table({ className: 'table table-hover table-responsive' },
        React.DOM.tbody(null,
          this.props.teams.map(team => { return this.showTeam(team); })
        )
      )
    );
  }
};

App.Tournament.Group.Teams.propTypes = {
  teams: React.PropTypes.array.isRequired,
  removeTeam: React.PropTypes.func
};
