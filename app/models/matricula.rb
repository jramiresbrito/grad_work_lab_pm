class Matricula
  attr_reader :aluno, :curso, :preco_pago, :numero_aulas_curso,
              :numero_aulas_assistidas, :numero_provas_curso, :numero_provas_realizadas
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @aluno = attributes[:aluno]
    @curso = attributes[:curso]
    @preco_pago = attributes[:preco_pago]
    @numero_aulas_curso = attributes[:numero_aulas_curso]
    @numero_aulas_assistidas = attributes[:numero_aulas_assistidas] || 0
    @numero_provas_curso = attributes[:numero_provas_curso]
    @numero_provas_realizadas = attributes[:numero_provas_realizadas] || 0
  end

  def to_csv_row
    [@id,
     @aluno.id,
     @curso.id,
     @preco_pago,
     @numero_aulas_curso,
     @numero_aulas_assistidas,
     @numero_provas_curso,
     @numero_provas_realizadas]
  end

  def self.headers
    %w[id
       id_aluno
       id_curso
       preco_pago
       numero_aulas_curso
       numero_aulas_assistidas
       numero_provas_curso
       numero_provas_realizadas]
  end

  def watch_lesson
    @numero_aulas_assistidas += 1 if @numero_aulas_assistidas < @numero_aulas_curso
  end

  def do_exam
    @numero_provas_realizadas += 1 if @numero_provas_realizadas < @numero_provas_curso
  end
end
