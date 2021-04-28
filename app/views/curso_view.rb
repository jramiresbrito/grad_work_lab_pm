require_relative 'base_view'

class CursoView < BaseView
  def display(cursos)
    cursos.each do |curso|
      message = "ID: #{curso.id.to_s.blue} "
      message += "Tipo: #{curso.tipo.to_s.cyan} "
      message += "R$#{curso.preco.to_s.green} "
      message += "Nº Aulas: #{curso.numero_de_aulas.to_s.red} "
      message += "Nº Provas: #{curso.numero_de_provas.to_s.red} "
      message += "Nome: #{curso.nome.yellow}"

      puts message
    end
  end
end
