// jshint esversion: 6

class Pag {
  constructor (opts) {
    $(document).keydown((e) => {
      if (e.keyCode === 37) this.prev(e);
      if (e.keyCode === 39) this.next(e);
    });
  }

  prev(e) {
    this.clickElement(e, $("li a[rel='prev']"));
  }

  next(e) {
    this.clickElement(e, $("li a[rel='next']"));
  }

  clickElement(event, el) {
    if (el.length) {
      event.preventDefault();
      el.click();
    }
  }
}

window.Pag = new Pag();
