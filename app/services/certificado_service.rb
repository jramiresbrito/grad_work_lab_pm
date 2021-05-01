class CertificadoService
  def initialize(attrs = {})
    @aluno = attrs[:aluno]
    @curso = attrs[:curso]
    @matriculas_repo = attrs[:matriculas_repo]
  end

  def call
    alumni_enrollments = @matriculas_repo.alumni_enrollments(@aluno)

    can_issue_certificate?(alumni_enrollments, @aluno, @curso)
  end

  private

  def can_issue_certificate?(enrollments, alumni, course)
    enrollment = enrollments.select { |e| e.aluno == alumni && e.curso == course }.first

    enrollment && enrollment.numero_aulas_curso == enrollment.numero_aulas_assistidas &&
      enrollment.numero_provas_curso == enrollment.numero_provas_realizadas
  end
end
