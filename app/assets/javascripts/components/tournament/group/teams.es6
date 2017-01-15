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

  showTeam (team, i) {
    return (
      React.DOM.tr({ key: team.id },
        React.DOM.td({ className: 'col-md-1' }, i),
        React.DOM.td({ className: 'col-md-2' },
          React.DOM.a({ href: `/teams/${team.id}`, className: 'no-underline' },
            React.DOM.img({ src: team.avatar, className: 'img-rounded', height:'48px' }),
            React.DOM.b(null, team.name)
          )
        ),
        this.props.editable &&
          React.DOM.td(null,
            React.DOM.div({ onClick: this.removeTeam.bind(this, team), role: 'button' },
              React.DOM.i({ className: 'fa fa-trash' })
            )
          )
      )
    );
  }

  render () {
    return(
      React.DOM.table({ className: 'table table-hover table-responsive text-center' },
        React.DOM.thead(null,
          React.DOM.tr(null,
            React.DOM.th({ className: 'text-center' }, I18n.t('gen.number')),
            React.DOM.th({ className: 'text-center' }, I18n.t('views.groups.show.teams')),
            this.props.editable &&
              React.DOM.th({ className: 'text-center' }, I18n.t('helpers.actions'))
          )
        ),
        React.DOM.tbody(null,
          this.props.teams.map((team, i) => { return this.showTeam(team, i + 1); })
        )
      )
    );
  }
};

App.Tournament.Group.Teams.propTypes = {
  teams: React.PropTypes.array.isRequired,
  editable: React.PropTypes.bool,
  removeTeam: React.PropTypes.func
};

App.Tournament.Group.Teams.defaultProps = {
  editable: true
};
