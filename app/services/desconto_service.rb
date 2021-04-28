class DescontoService
  def initialize(attrs = {})
    @aluno = attrs[:aluno]
    @curso = attrs[:curso]
    @matriculas_repo = attrs[:matriculas_repo]
  end

  def call
    discount = calculate_discount

    @curso.preco - (@curso.preco * discount)
  end

  private

  def calculate_discount
    number_of_enrollments = @matriculas_repo.alumni_enrollments(@aluno).count

    return 1.00 if number_of_enrollments.positive? && (number_of_enrollments % 5).zero?

    return 0.15 if number_of_enrollments >= 3

    0
  end
end
