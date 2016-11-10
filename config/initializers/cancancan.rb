# https://github.com/CanCanCommunity/cancancan/issues/342
ActiveSupport.on_load(:active_record) do
  require 'cancancan'
end
