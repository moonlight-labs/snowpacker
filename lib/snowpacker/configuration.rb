module Snowpacker
  class Configuration
    attr_accessor :config_dir
    attr_accessor :config_file
    attr_accessor :babel_config_file
    attr_accessor :postcss_config_file
    attr_accessor :build_dir
    attr_accessor :mount_dir
    attr_accessor :output_path
    attr_accessor :port, :hostname


    def self.add_attr(attr, value)
      instance_attr = "@#{attr}".to_sym

      define_singleton_method(attr.to_sym) { instance_variable_get(instance_attr) }
      define_singleton_method("#{attr}=".to_sym) do |new_value|
        instance_variable_set(instance_attr, new_value)
      end

      self.instance_variable_set("@#{attr}".to_sym, value)
    end

    # Allows for an instance version as well
    # https://6ftdan.com/allyourdev/2015/02/24/writing-methods-for-both-class-and-instance-levels/
    def add_attr(attr, value)
      self.class.add_attr(attr, value)
    end
  end
end
