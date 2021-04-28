require_relative '../utils/colorize'

class RouterView
  def print_user_menu(name)
    puts ''
    puts "Olá, #{name} por favor escolha uma opção".green

    user_options
  end

  private

  def user_options
    puts '╔════════════════════════════════════════╗'
    puts "║      #{'1  - Cadastrar um aluno'.yellow}           ║"
    puts "║      #{'2  - Listar os alunos'.yellow}             ║"
    puts "║      #{'3  - Cadastrar um curso'.red}           ║"
    puts "║      #{'4  - Listar os cursos'.red}             ║"
    puts "║      #{'5  - Realizar uma matrícula'.green}       ║"
    puts "║      #{'6  - Listar as matrículas'.green}         ║"
    puts "║      #{'7  - Assistir aula'.blue}                ║"
    puts "║      #{'8  - Fazer prova'.blue}                  ║"
    puts "║      #{'9  - Limpar a tela'.cyan}                ║"
    puts "║      #{'20 - Deslogar'.cyan}                     ║"
    puts "║      #{'0  - Terminar o programa'.pink}          ║"
    puts '╚════════════════════════════════════════╝'
  end
end
