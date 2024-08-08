# vim: set syntax=ruby

Pry.config.theme = "pry-modern-256"
Pry.config.history_file = "~/.pry_history"

Pry.history.load

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

def _hd(*args)
  require 'hashdiff'

  Hashdiff.diff(*args)
end
