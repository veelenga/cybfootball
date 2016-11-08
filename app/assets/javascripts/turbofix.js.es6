class Turbofix {
  constructor (opts) {
    this.onvisit = opts.onvisit

    var visitListener = e => {
      document.removeEventListener(e.type, visitListener)
      this.onvisit()
    }

    if (this.onvisit) document.addEventListener('turbolinks:visit', visitListener)
  }
}
