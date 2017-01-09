// jshint esversion: 6

App.Tournament.Group = class Group extends React.Component {
  constructor(props) {
    super(props);

    this.state = { name: props.name, teams: props.teams };

    this.onChange = this.edit.bind(this);
    this.addTeam = this.addTeam.bind(this);
    this.removeTeam = this.removeTeam.bind(this);
  }

  edit (group) {
    $.ajax({
      method: 'PUT',
      url: `/groups/${this.props.id}`,
      dataType: 'JSON',
      data: { group: group },
      success: () => this.setState({ name: group.name }),
      error: (jqXHR) => {
        window.App.respError(jqXHR, I18n.t('views.groups.errors.unable_to_update'));
      }
    });
  }

  updateTeams (team, action) {
    let update = (team) => {
      let teams = this.state.teams;
      if (action === 'add') teams = React.addons.update(this.state.teams, { $push: [team] });
      if (action === 'delete') {
        let index = this.state.teams.indexOf(team);
        teams = React.addons.update(this.state.teams, { $splice: [[index, 1]] });
      }
      this.setState({ teams: teams });
    };

    $.ajax({
      method: 'PUT',
      url: `/groups/${this.props.id}/update_teams`,
      dataType: 'JSON',
      data: { id: this.props.id, team: { id: team.id, action: action } },
      success: () => update(team),
      error: (jqXHR) => {
        window.App.respError(jqXHR, I18n.t('views.groups.errors.unable_to_update'));
      }
    });
  }

  addTeam (team) {
    this.updateTeams(team, 'add');
  }

  removeTeam (team) {
    this.updateTeams(team, 'delete');
  }

  render () {
    return(
      React.DOM.div({ className: 'panel panel-default' },
        React.DOM.div({ className: 'panel-heading' },
          React.createElement(App.Tournament.Group.Name,
            { name: this.state.name, onChange: this.onChange }
          )
        ),
        React.DOM.div({ className: 'panel-body' },
          React.createElement(App.Tournament.Group.Teams,
            { teams: this.state.teams, removeTeam: this.removeTeam }
          )
        ),
        React.DOM.div({ className: 'panel-footer clearfix' },
          React.DOM.strong(null,
            `${I18n.t('views.groups.edit.total_teams')}: `, this.state.teams.length
          ),
          React.DOM.div({ className: 'col-sm-3 pull-right' },
            React.createElement(App.Tournament.Group.SearchTeam,
              { id: this.props.id, onFound: this.addTeam }
            )
          )
        )
      )
    );
  }
};
