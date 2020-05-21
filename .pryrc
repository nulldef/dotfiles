include FactoryBot::Syntax::Methods if defined?(FactoryBot::Syntax::Methods)

Pry.config.history_file = "~/.pry_history"

Pry.history.load

DB.logger = Logger.new(STDOUT) if defined?(DB)
