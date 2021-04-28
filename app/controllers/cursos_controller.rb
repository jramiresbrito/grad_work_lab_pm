require_relative '../models/curso'
require_relative '../views/curso_view'

class CursosController
  def initialize(repository)
    @cursos = repository
    @view = CursoView.new
  end

  def index
    display_cursos
  end

  def add
    name = @view.ask_user_for('Qual é o nome do curso?')
    type = @view.ask_user_for('Qual é tipo do curso?')
    number_of_lectures = @view.ask_user_for('Qual é a quantidade de aulas?')
    number_of_exams = @view.ask_user_for('Qual é a quantidade de provas?')
    curso = Curso.new(nome: name,
                      tipo: type,
                      numero_de_aulas: number_of_lectures,
                      numero_de_provas: number_of_exams)
    @cursos.add(curso)

    display_cursos
  end

  private

  def display_cursos
    cursos = @cursos.all
    @view.display(cursos)
  end
end
