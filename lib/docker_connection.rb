require 'concurrent/future'
require 'concurrent/timer_task'


class DockerConnection
  def self.get_connection(daemon)
    unless @connections.key? daemon.id
      build_connection daemon
    end
    @connections[daemon.id]
  end

  def self.initialize_environment
    @connections = {}
    Daemon.all.each do |daemon|
      build_connection daemon
    end
  end

  def build_connection(daemon)
    @connections[daemon.id] = Docker::Connection.new("tcp://#{daemon.address}", {})
  end
end
