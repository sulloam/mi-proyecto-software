# Tests de Usuarios.
# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Registro de usuarios validos" do
    @user = users(:usuario_3)
    result = @user.save
    assert result
  end

  test "Registro usuarios sin mail" do
    @user = users(:usuario_1)
    result = @user.save
    assert_not result
  end
  
  test "Registro usuarios sin clave" do
    @user = users(:usuario_2)
    result = @user.save
    assert_not result
  end

end