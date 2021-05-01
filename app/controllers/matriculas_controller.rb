require_relative '../views/matricula_view'
require_relative '../models/matricula'
require_relative '../services/desconto_service'
require_relative '../services/relatorio_service'
require_relative '../services/certificado_service'

class MatriculasController
  def initialize(alunos_repo, cursos_repo, matriculas_repo)
    @aluno_repository = alunos_repo
    @curso_repository = cursos_repo
    @matricula_repository = matriculas_repo
    @relatorio_service = RelatorioService.new(matriculas_repo: matriculas_repo)
    @view = MatriculaView.new
  end

  def index
    alumni = get_alumni
    enrollments = @matricula_repository.alumni_enrollments(alumni)
    @view.display_matriculas(enrollments)
  end

  def add
    alumni = get_alumni
    course = get_course

    preco_pago = DescontoService.new(aluno: alumni,
                                     curso: course,
                                     matriculas_repo: @matricula_repository).call

    @matricula_repository.add(Matricula.new(aluno: alumni,
                                            curso: course,
                                            preco_pago: preco_pago,
                                            numero_aulas_curso: course.numero_de_aulas,
                                            numero_provas_curso: course.numero_de_provas))
  end

  def watch_lesson
    index

    enrollment = get_resource(:matricula, @matricula_repository)
    enrollment.watch_lesson

    @matricula_repository.elements[enrollment.id - 1] = enrollment
    @matricula_repository.save

    @view.display_matriculas([@matricula_repository.find(enrollment.id)])
  end

  def do_exam
    index

    enrollment = get_resource(:matricula, @matricula_repository)
    enrollment.do_exam

    @matricula_repository.elements[enrollment.id - 1] = enrollment
    @matricula_repository.save

    @view.display_matriculas([@matricula_repository.find(enrollment.id)])
  end

  def alumni_purchases
    alumni = get_alumni

    purchases = @relatorio_service.alumni_purchases(alumni)

    @view.display_aluno_purchases(purchases, alumni)
  end

  def all_purchases
    purchases = @relatorio_service.all_purchases

    @view.display_all_purchases(purchases)
  end

  def issue_certificate
    alumni = get_alumni
    enrollments = @matricula_repository.alumni_enrollments(alumni)
    @view.display_matriculas(enrollments, true)

    course = get_resource(:curso, @curso_repository)

    service = CertificadoService.new(aluno: alumni, curso: course,
                                     matriculas_repo: @matricula_repository)

    if service.call
      @view.issue_certificate(alumni, course)
    else
      @view.cannot_issue_certificate(alumni, course)
    end
  end

  private

  def get_alumni
    AlunosController.new(@aluno_repository).index
    get_resource(:aluno, @aluno_repository)
  end

  def get_course
    CursosController.new(@curso_repository).index
    get_resource(:curso, @curso_repository)
  end

  def get_resource(resource, repository)
    id_resource = @view.ask_for_id(resource)

    repository.find(id_resource)
  end
end
