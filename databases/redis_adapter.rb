require 'redis'
require 'json'

class RedisAdapter
  attr_reader :host, :port, :url, :password, :db

  def initialize(options = {})
    @host = options[:host]
    @port = options[:port]
    @url = options[:url]
    @password = options[:password]
    @db = options[:db]
  end

  def set(key, value)
    connection.set(key, value)
  end

  def get(key)
    connection.get(key)
  end

  private

  def connection
    @connection ||= Redis.new(host: host, port: port, url: url, password: password, db: db)
  end
end
