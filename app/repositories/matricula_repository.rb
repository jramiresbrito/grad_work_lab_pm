require_relative 'base_repository'
require_relative '../models/matricula'

class MatriculaRepository < BaseRepository
  def initialize(csv_file, aluno, curso)
    @aluno_repository = aluno
    @curso_repository = curso

    super(csv_file)
  end

  def alumni_enrollments(aluno)
    @elements.select { |matricula| matricula.aluno.id == aluno.id }
  end

  def save
    save_to_csv
  end

  private

  def deserialize(row)
    aluno = @aluno_repository.find(row[:id_aluno].to_i)
    curso = @curso_repository.find(row[:id_curso].to_i)

    Matricula.new(
      id: row[:id].to_i,
      aluno: aluno,
      curso: curso,
      preco_pago: row[:preco_pago].to_f,
      numero_aulas_curso: row[:numero_aulas_curso].to_i,
      numero_aulas_assistidas: row[:numero_aulas_assistidas].to_i,
      numero_provas_curso: row[:numero_provas_curso].to_i,
      numero_provas_realizadas: row[:numero_provas_realizadas].to_i
    )
  end
end
