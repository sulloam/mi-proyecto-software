# frozen_string_literal: true

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  
  test "Registro de prueba valida" do 
    @test = tests(:test_1)
    result = @test.save
    assert result
  end

  test "Registro de prueba invalida, sin titulo" do
    @test = tests(:test_2)
    result = @test.save
    assert_not result
  end

  test "Registro de prueba invalida, sin puntaje" do
    @test = tests(:test_3)
    result = @test.save
    assert_not result 
  end

end
