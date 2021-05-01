require_relative 'base_view'

class MatriculaView < BaseView
  def ask_for_id(obj)
    puts "#{obj} id?"
    print '> '
    gets.chomp.to_i
  end

  def display_matriculas(matriculas, use_course_id = false)
    if matriculas.empty?
      puts 'Não existem matrículas.'
    else
      matriculas.each do |matricula|
        message = "ID: #{matricula.id.to_s.blue} " unless use_course_id
        message = "ID: #{matricula.curso.id.to_s.blue} " if use_course_id
        message += "Aluno: #{matricula.aluno.nome.yellow} "
        message += "Preço Pago R$#{matricula.preco_pago.to_s.green} "
        message += "Nº aulas curso: #{matricula.numero_aulas_curso.to_s.pink} "
        message += "Nº aulas assistidas: #{matricula.numero_aulas_assistidas.to_s.pink} "
        message += "Nº provas curso: #{matricula.numero_provas_curso.to_s.red} "
        message += "Nº provas realizadas: #{matricula.numero_provas_realizadas.to_s.red} "
        message += "Curso: #{matricula.curso.nome.blue}"

        puts message
      end
    end
  end

  def display_aluno_purchases(purchases, aluno)
    puts `clear`

    if purchases.zero?
      puts "O aluno #{aluno.nome.yellow} não realizou nenhuma compra"
    else
      puts "Total a receber do aluno #{aluno.nome.yellow} R$#{purchases.to_s.green}"
    end
  end

  def display_all_purchases(purchases)
    puts `clear`

    if purchases.zero?
      puts 'Não existem compras a receber'
    else
      puts "Total #{'geral'.yellow} a receber R$#{purchases.to_s.green}"
    end
  end

  def issue_certificate(alumni, course)
    puts `clear`
    puts '╔═══════════════════════════════════════════╗'
    puts '║      CERTIFICADO DE CONCLUSÃO             ║'
    puts "║      ALUNO: #{alumni.nome.green}                          ║"
    puts "║      CURSO: #{course.nome.yellow}        ║"
    puts "║      Nº DE AULAS: #{course.numero_de_aulas.to_s.yellow}                      ║"
    puts "║      Nº DE PROVAS: #{course.numero_de_provas.to_s.yellow}                      ║"
    puts '╚═══════════════════════════════════════════╝'
  end

  def cannot_issue_certificate(alumni, course)
    puts `clear`
    message = "Certificado não pode ser emitido.\n"
    message += "Motivo: #{alumni.nome.green} não cumpriu todos os requisitos do curso #{course.nome.yellow}"

    puts message
  end
end
