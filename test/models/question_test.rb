# frozen_string_literal: true

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "Registro de pregunta valida" do 
    @question = questions(:question_1)
    result = @question.save
    assert result
  end

  test "Registro de pregunta invalida, sin enunciado" do
    @question = questions(:question_2)
    result = @question.save
    assert_not result
  end

  test "Registro de pregunta invalida, sin descripcion" do
    @question = questions(:question_3)
    result = @question.save
    assert_not result 
  end


end
