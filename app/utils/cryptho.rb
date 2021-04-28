class Cryptho
  def encrypt(password)
    password_letters = password.scan(/\w/)
    encrypted_letters = []
    password_letters.each { |letter| encrypted_letters << letter.ord }
    encrypted_letters.join('')
  end

  def decrypt(input_password, stored_password)
    stored_password == encrypt(input_password)
  end
end
