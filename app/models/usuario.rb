class Usuario
  attr_reader :username, :password
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password_digest]
  end

  def to_csv_row
    [@id, @username, @password]
  end

  def self.headers
    %w[id username password_digest]
  end
end
