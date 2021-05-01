require_relative 'utils/colorize'
require_relative 'views/router_view'
require_relative 'controllers/alunos_controller'
require_relative 'controllers/cursos_controller'
require_relative 'controllers/matriculas_controller'
require_relative 'controllers/sessions_controller'

class Router
  attr_accessor :name

  def initialize(usuarios, alunos, cursos, matriculas)
    @aluno_controller = AlunosController.new(alunos)
    @curso_controller = CursosController.new(cursos)
    @session_controller = SessionsController.new(usuarios)
    @matricula_controller = MatriculasController.new(alunos, cursos, matriculas)
    @view = RouterView.new
    @usuario = nil
  end

  def run
    @usuario = @session_controller.sign_in until @usuario
    @name = @usuario.username.capitalize
    user_loop
  end

  private

  def user_menu(choice)
    case choice
    when 11 then @aluno_controller.add
    when 12 then @aluno_controller.index
    when 21 then @curso_controller.add
    when 22 then @curso_controller.index
    when 31 then @matricula_controller.add
    when 32 then @matricula_controller.index
    when 33 then @matricula_controller.watch_lesson
    when 34 then @matricula_controller.do_exam
    when 35 then @matricula_controller.alumni_purchases
    when 36 then @matricula_controller.all_purchases
    when 37 then @matricula_controller.issue_certificate
    when 99 then sign_out
    when 9 then system 'clear'
    when 0 then exit
    else
      puts 'Opção inválida.'.red
    end
  end

  def user_loop
    loop do
      @view.print_user_menu(@name)
      choice = gets.chomp.to_i
      system 'clear'
      user_menu(choice)
    end
  end

  def sign_out
    system 'clear'
    puts 'Deslogando...'.green
    sleep 1
    system 'clear'
    @usuario = nil

    run
  end
end
