require_relative '../views/matricula_view'
require_relative '../models/matricula'
require_relative '../services/desconto_service'

class MatriculasController
  def initialize(alunos_repo, cursos_repo, matriculas_repo)
    @aluno_repository = alunos_repo
    @curso_repository = cursos_repo
    @matricula_repository = matriculas_repo
    @view = MatriculaView.new
  end

  def index
    AlunosController.new(@aluno_repository).index
    aluno = get_resource(:aluno, @aluno_repository)
    matriculas = @matricula_repository.alumni_enrollments(aluno)
    @view.display_matriculas(matriculas)
  end

  def add
    AlunosController.new(@aluno_repository).index
    aluno = get_resource(:aluno, @aluno_repository)

    CursosController.new(@curso_repository).index
    curso = get_resource(:curso, @curso_repository)

    preco_pago = DescontoService.new(aluno: aluno,
                                     curso: curso,
                                     matriculas_repo: @matricula_repository).call

    @matricula_repository.add(Matricula.new(aluno: aluno,
                                            curso: curso,
                                            preco_pago: preco_pago,
                                            numero_aulas_curso: curso.numero_de_aulas,
                                            numero_provas_curso: curso.numero_de_provas))
  end

  def watch_lesson
    index

    matricula = get_resource(:matricula, @matricula_repository)
    matricula.watch_lesson

    @matricula_repository.elements[matricula.id - 1] = matricula
    @matricula_repository.save

    @view.display_matriculas([@matricula_repository.find(matricula.id)])
  end

  def do_exam
    index

    matricula = get_resource(:matricula, @matricula_repository)
    matricula.do_exam

    @matricula_repository.elements[matricula.id - 1] = matricula
    @matricula_repository.save

    @view.display_matriculas([@matricula_repository.find(matricula.id)])
  end

  private

  def get_resource(resource, repository)
    id_resource = @view.ask_for_id(resource)

    repository.find(id_resource)
  end
end
