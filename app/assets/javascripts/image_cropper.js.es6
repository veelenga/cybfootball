// jshint esversion: 6

class ImageCropper {
  constructor (opts) {
    this.save   = opts.save;
    this.width  = opts.width;
    this.height = opts.height;
    this.avatar = opts.avatar;
    this.image  = opts.image;

    this.cropper = $('.cropper');
    this.coords = undefined;

    this.cropper
      .on('shown.bs.modal', () => this.init())
      .on('hidden.bs.modal', () => this.destroy());

    $('.finish-crop').on('click', () => this.setResults());
    $('.avatar-chooser').on('change', e => this.loadImage(e));

    this.avatar.on('click', () => this.show());
    this.registerHotkeys();
  }

  init () {
    this.image.cropper({
      viewMode: 1,
      autoCropArea: 0.95,
      checkOrientation: false,
      checkCrossOrigin: false,
      guides: false,
      scalable: false,
      aspectRatio: this.width / this.height,
      minContainerWidth: this.width,
      minContainerHeight: this.height,
      preview: this.avatar,
      crop: e => this.coords = e
    });
  }

  registerHotkeys() {
    this.cropper.keypress(e => {
      (e.charCode == 32) && this.image.cropper('rotate', 90) // space
      (e.charCode == 114) && this.image.cropper('reset')     // r
    });
  }

  destroy () {
    let preview = this.avatar.html();
    this.image.cropper('destroy');
    this.resultSaved && this.avatar.html(preview);
    this.resultSaved = false;
  }

  show () {
    $('.cropper').modal('show');
  }

  loadImage (input) {
    let files = input.currentTarget.files;
    if (files && files[0]) {
      let reader = new FileReader();
      reader.onload = e => this.image.attr('src', e.target.result);
      reader.readAsDataURL(files[0]);
      this.show();
    }
  }

  setResults () {
    this.save({
      w: parseInt(this.coords.width),
      h: parseInt(this.coords.height),
      x: parseInt(this.coords.x),
      y: parseInt(this.coords.y),
      r: this.coords.rotate
    });
    this.resultSaved = true;
  }
}
