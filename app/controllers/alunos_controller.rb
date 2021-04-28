require_relative '../models/aluno'
require_relative '../views/aluno_view'

class AlunosController
  def initialize(repository)
    @alunos = repository
    @view = AlunoView.new
  end

  def index
    display_alunos
  end

  def add
    name = @view.ask_user_for('Qual o nome do aluno?')
    aluno = Aluno.new(nome: name)
    @alunos.add(aluno)
    display_alunos
  end

  private

  def display_alunos
    alunos = @alunos.all
    @view.display(alunos)
  end
end
