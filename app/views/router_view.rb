require_relative '../utils/colorize'

class RouterView
  def print_user_menu(name)
    puts ''
    puts "Olá, #{name} por favor escolha uma opção".green

    user_options
  end

  private

  def user_options
    puts '╔══════════════════════════════════════════╗'
    puts "║      #{'11  - Cadastrar um aluno'.yellow}            ║"
    puts "║      #{'12  - Listar os alunos'.yellow}              ║"
    puts "║      #{'21  - Cadastrar um curso'.red}            ║"
    puts "║      #{'22  - Listar os cursos'.red}              ║"
    puts "║      #{'31  - Realizar uma matrícula'.green}        ║"
    puts "║      #{'32  - Listar as matrículas'.green}          ║"
    puts "║      #{'33  - Assistir aula'.blue}                 ║"
    puts "║      #{'34  - Fazer prova'.blue}                   ║"
    puts "║      #{'35  - Total de compras do aluno'.blue}     ║"
    puts "║      #{'36  - Total de compras geral'.blue}        ║"
    puts "║      #{'37  - Emitir certificado'.blue}            ║"
    puts "║      #{'9   - Limpar a tela'.cyan}                 ║"
    puts "║      #{'99  - Deslogar'.cyan}                      ║"
    puts "║      #{'0   - Terminar o programa'.pink}           ║"
    puts '╚══════════════════════════════════════════╝'
  end
end
