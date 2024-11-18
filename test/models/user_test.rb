# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'debería guardar un usuario válido' do
    user = User.new(
      email: 'test@example.com',
      encrypted_password: Devise::Encryptor.digest(User, 'password123'),
      rol: 'estudiante',
      phone_number: '+12345678901',
      first_name: 'Test',
      last_name: 'User',
      description: 'Usuario válido para prueba'
    )
    
    assert user.save, 'El usuario no se guardó correctamente'
  end
end
