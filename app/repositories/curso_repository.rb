require_relative 'base_repository'
require_relative '../models/curso'

class CursoRepository < BaseRepository
  private

  def deserialize(row)
    row[:id] = row[:id].to_i
    row[:tipo] = row[:tipo].to_i
    row[:preco] = row[:preco].to_f
    row[:numero_de_aulas] = row[:numero_de_aulas].to_i
    row[:numero_de_provas] = row[:numero_de_provas].to_i
    Curso.new(row)
  end
end
