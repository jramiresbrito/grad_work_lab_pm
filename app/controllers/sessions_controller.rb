require_relative '../utils/cryptho'
require_relative '../views/session_view'

class SessionsController
  def initialize(repository)
    @usuarios = repository
    @view = SessionView.new
    @cryptho = Cryptho.new
  end

  def sign_in
    username = @view.ask_user_username
    password = @view.ask_user_password
    usuario = @usuarios.find_by_username(username)
    if usuario && @cryptho.decrypt(password, usuario.password)
      system 'clear'
      usuario
    else
      @view.invalid_credentials
      sign_in
    end
  end
end
