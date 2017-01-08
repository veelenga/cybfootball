// jshint esversion: 6

window.App = {};
window.App.Tournament = {};
window.App.Tournament.Group = {};

// https://github.com/reactjs/react-rails/issues/607
ReactRailsUJS.handleEvent('turbolinks:before-cache', () => window.ReactRailsUJS.unmountComponents());
