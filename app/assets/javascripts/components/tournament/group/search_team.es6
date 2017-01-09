// jshint esversion: 6

App.Tournament.Group.SearchTeam = class SearchTeam extends React.Component {
  constructor(props) {
    super(props);

    this.handleOnFound = (team) => { this.props.onFound(team); };
  }

  render () {
    return (
      React.createElement(App.Suggestion, {
        display: 'name',
        autofocus: true,
        input_props: { placeholder: I18n.t('views.groups.edit.add_team') },
        onSelected: this.handleOnFound,
        suggests:
          new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            remote: {
              url: `/groups/${this.props.id}/search_teams?q=%QUERY`,
              wildcard: '%QUERY',
              cache: false
            }
          }).ttAdapter(),
        templates: {
          empty: `<p class='text-center'>${I18n.t('views.groups.edit.team_not_found')}</p>`,
          suggestion: Handlebars.compile(`
              <div>
                <img src={{avatar}} class='img-rounded' height='32px'/>
                <strong>{{name}}</strong>
              </div>
            `)
        }
      })
    );
  }
};

App.Tournament.Group.SearchTeam.propTypes = {
  id: React.PropTypes.number.isRequired,
  addTeam: React.PropTypes.func
};
