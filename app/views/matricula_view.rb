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

    alumni_string = alumni.nome.green + ' ' * (29 - alumni.nome.length)
    course_string = course.nome.yellow + ' ' * (29 - course.nome.length)
    lectures_string = course.numero_de_aulas.to_s.yellow + ' ' * (23 - course.numero_de_aulas.to_s.length)
    exams_string = course.numero_de_provas.to_s.yellow + ' ' * (22 - course.numero_de_provas.to_s.length)
    puts '╔══════════════════════════════════════════╗'
    puts '║      CERTIFICADO DE CONCLUSÃO            ║'
    puts "║      ALUNO: #{alumni_string}║"
    puts "║      CURSO: #{course_string}║"
    puts "║      Nº DE AULAS: #{lectures_string}║"
    puts "║      Nº DE PROVAS: #{exams_string}║"
    puts '╚══════════════════════════════════════════╝'
  end

  def cannot_issue_certificate(alumni, course)
    puts `clear`
    message = "Certificado não pode ser emitido.\n"
    message += "Motivo: #{alumni.nome.green} não cumpriu todos os requisitos do curso #{course.nome.yellow}"

    puts message
  end
end
