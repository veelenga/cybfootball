// jshint esversion: 6

$(document).delegate('*[data-toggle="lightbox"]', 'click', (event) => {
  event.preventDefault();
  $(event.currentTarget).ekkoLightbox();
  return;
});

