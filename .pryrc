include FactoryBot::Syntax::Methods if defined?(FactoryBot::Syntax::Methods)

Pry.config.history_file = "~/.pry_history"

Pry.history.load

DB.logger = Logger.new(STDOUT) if defined?(DB)
Rails.logger = Logger.new(STDOUT) if defined?(Rails)
HttpLog.config.logger = Logger.new(STDOUT) if defined?(HttpLog)
ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord)

def _m(instance)
  instance.methods - Object.instance_methods
end
