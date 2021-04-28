require_relative 'base_repository'
require_relative '../models/aluno'

class AlunoRepository < BaseRepository
  private

  def deserialize(row)
    row[:id] = row[:id].to_i
    Aluno.new(row)
  end
end
