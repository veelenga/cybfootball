require 'paperclip/cropper'

module ModelExtensions::Avatar
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def has_avatar(opts)
      [:avatar, :crop_x, :crop_y, :crop_w, :crop_h].each do |attr|
        attr_accessor :"#{attr}"
      end

      after_save do
        if cropping?
          avatar.assign(avatar)
          avatar.save
        end
      end

      after_validation do
        restore_avatar_file_name! if new_record? && errors.present?
      end

      define_method :styles do
        opts[:styles]
      end

      opts[:processors] ||= [:cropper]
      has_attached_file :avatar, opts
      validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    end
  end

  module InstanceMethods
    def geometry(style)
      Paperclip::Geometry.parse styles[style]
    end

    def cropping?
      !avatar.blank? && !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
    end
  end
end
