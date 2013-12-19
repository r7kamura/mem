require "mem/version"

module Mem
  def memoize(method_name)
    define_method("#{method_name}_with_memoize") do |*args, &block|
      if instance_variable_defined?("@#{method_name}")
        instance_variable_get("@#{method_name}")
      else
        instance_variable_set("@#{method_name}", send("#{method_name}_without_memoize", *args, &block))
      end
    end
    alias_method "#{method_name}_without_memoize", method_name
    alias_method method_name, "#{method_name}_with_memoize"
  end
end
