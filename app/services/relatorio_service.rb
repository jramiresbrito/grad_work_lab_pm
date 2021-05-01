class RelatorioService
  def initialize(attrs = {})
    @matriculas_repo = attrs[:matriculas_repo]
  end

  def alumni_purchases(aluno)
    enrollments = @matriculas_repo.alumni_enrollments(aluno)

    sum_purchases(enrollments)
  end

  def all_purchases
    enrollments = @matriculas_repo.all

    sum_purchases(enrollments)
  end

  private

  def sum_purchases(enrollments)
    sum = 0

    enrollments.each do |enrollment|
      sum += enrollment.preco_pago
    end

    sum
  end
end
