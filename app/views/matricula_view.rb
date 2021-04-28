require_relative 'base_view'

class MatriculaView < BaseView
  def ask_for_id(obj)
    puts "#{obj} id?"
    print '> '
    gets.chomp.to_i
  end

  def display_matriculas(matriculas)
    if matriculas.empty?
      puts 'Não existem matrículas.'
    else
      matriculas.each do |matricula|
        message = "ID: #{matricula.id.to_s.blue} "
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
end
