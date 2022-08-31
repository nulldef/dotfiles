require 'hashdiff'
require 'factory_bot' rescue nil

include FactoryBot::Syntax::Methods if defined?(FactoryBot::Syntax::Methods)

Pry.config.history_file = "~/.pry_history"

Pry.history.load

logger = Logger.new($stdout)
DB.logger = logger if defined?(DB)
Rails.logger = logger if defined?(Rails)
HttpLog.config.logger = ->(_severity, message) { logger.debug(message) } if defined?(HttpLog)
ActiveRecord::Base.logger = logger if defined?(ActiveRecord)

def _m(instance)
  instance.methods - Object.instance_methods
end

def _hd(a, b, **opts)
  Hashdiff.diff(a, b, **opts)
end
