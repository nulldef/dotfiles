require 'irb/completion'

include FactoryBot::Syntax::Methods if defined?(FactoryBot::Syntax::Methods)

IRB.conf[:SAVE_HISTORY] = 1000

DB.logger = Logger.new(STDOUT) if defined?(DB)
Rails.logger = Logger.new(STDOUT) if defined?(Rails)
HttpLog.config.logger = Logger.new(STDOUT) if defined?(HttpLog)

def _m(instance)
  instance.methods - Object.instance_methods
end

def c(instance, method)
  method = method.to_sym
  clazz = instance.is_a?(Class) ? instance : instance.class
  clazz.instance_method(method).comment.display
  clazz.instance_method(method).source.display
end
