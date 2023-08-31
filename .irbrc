require 'irb/completion'

include FactoryBot::Syntax::Methods if defined?(FactoryBot::Syntax::Methods)

IRB.conf[:SAVE_HISTORY] = 1000

def _set_loggers
  require 'logger'

  logger = Logger.new($stdout)

  DB.logger = logger if defined?(DB)
  Rails.logger = logger if defined?(Rails)
  HttpLog.config.logger = ->(_severity, message) { logger.debug(message) } if defined?(HttpLog)
  ActiveRecord::Base.logger = logger if defined?(ActiveRecord)
end

def _m(instance)
  instance.methods - Object.instance_methods
end

def c(instance, method)
  method = method.to_sym
  clazz = instance.is_a?(Class) ? instance : instance.class
  clazz.instance_method(method).comment.display
  clazz.instance_method(method).source.display
end
