require 'pg'
require 'json'

class PostgresqlAdapter
  attr_reader :host, :port, :user, :password, :dbname

  def initialize(options = {})
    @host = options[:host]
    @port = options[:port]
    @user = options[:user]
    @password = options[:password]
    @dbname = options[:dbname]
  end

  def execute_sql(query)
    result = connection.exec(query)
    JSON.generate(result.to_a)
  end

  private

  def connection
    PG.connect(host: host, port: port, user: user, password: password, dbname: dbname)
  end
end
