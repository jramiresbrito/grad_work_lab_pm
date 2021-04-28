require_relative '../models/usuario'
require_relative 'base_repository'

class UsuarioRepository < BaseRepository
  def find_by_username(username)
    @elements.find { |usuario| usuario.username == username }
  end

  undef_method :add

  private

  def deserialize(row)
    row[:id] = row[:id].to_i
    Usuario.new(row)
  end
end
