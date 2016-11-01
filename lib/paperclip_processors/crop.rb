module Paperclip
  class Crop < Thumbnail
    def transformation_command
      model = @attachment.instance
      if model.crop?
        w, h, x, y = model.crop_w.to_i, model.crop_h.to_i, model.crop_x.to_i, model.crop_y.to_i
        cmd = super
        cmd = cmd.slice(0, cmd.find_index('-crop'))
        model.crop_w = nil # TODO!
        ['-crop', "'#{w}x#{h}+#{x}+#{y}'"] + cmd  + ['+repage']
      else
        super
      end
    end
  end
end
