class ImageCropper {
  constructor (opts) {
    this.save = opts.save
    this.width = opts.width
    this.height = opts.height
    this.avatar = opts.avatar
    this.image = opts.image

    this.coords = undefined

    $('.cropper')
      .on('shown.bs.modal', () => this.init())
      .on('hidden.bs.modal', () => this.destroy())

    $('.finish-crop').on('click', () => this.setResults())
    $('.avatar-chooser').on('change', (e) => this.loadImage(e))

    this.avatar.on('click', () => this.show())
  }

  init () {
    this.image.cropper({
      viewMode: 1,
      autoCropArea: 0.95,
      checkOrientation: false,
      checkCrossOrigin: false,
      guides: false,
      rotatable: false,
      scalable: false,
      aspectRatio: this.width / this.height,
      minContainerWidth: this.width,
      minContainerHeight: this.height,
      crop: e => this.coords = e
    })
  }

  destroy () {
    this.image.cropper('destroy')
  }

  show () {
    $('.cropper').modal('show')
  }

  loadImage (input) {
    let files = input.currentTarget.files
    if (files && files[0]) {
      let reader = new FileReader();
      reader.onload = e => this.image.attr('src', e.target.result)
      reader.readAsDataURL(files[0])
      this.show()
    }
  }

  setResults () {
    let rx = this.width / this.coords.width
    let ry = this.height / this.coords.height

    let width  = parseInt(this.image.get(0).naturalWidth * rx)
    let height = parseInt(this.image.get(0).naturalHeight * ry)
    let left   = parseInt(this.coords.x * rx)
    let top    = parseInt(this.coords.y * ry)

    this.avatar.attr('src', this.image.attr('src'))
    this.avatar.css({
      width:      `${width}px`,
      height:     `${height}px`,
      marginLeft: `-${left}px`,
      marginTop:  `-${top}px`
    })

    this.save({
      w: parseInt(this.coords.width),
      h: parseInt(this.coords.height),
      x: parseInt(this.coords.x),
      y: parseInt(this.coords.y)
    })
  }
}
