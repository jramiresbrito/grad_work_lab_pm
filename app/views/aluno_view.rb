require_relative 'base_view'

class AlunoView < BaseView
  def display(alunos)
    alunos.each do |aluno|
      puts "ID:#{aluno.id.to_s.blue} Nome: #{aluno.nome.yellow}"
    end
  end
end
