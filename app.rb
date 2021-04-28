require_relative 'app/repositories/usuario_repository'
require_relative 'app/repositories/aluno_repository'
require_relative 'app/repositories/curso_repository'
require_relative 'app/repositories/matricula_repository'
require_relative 'app/router'

csv_file = 'data/matriculas.csv'

usuarios = UsuarioRepository.new('data/usuarios.csv')
alunos = AlunoRepository.new('data/alunos.csv')
cursos = CursoRepository.new('data/cursos.csv')
matriculas = MatriculaRepository.new(
  csv_file,
  alunos,
  cursos
)

router = Router.new(usuarios, alunos, cursos, matriculas)
router.run
