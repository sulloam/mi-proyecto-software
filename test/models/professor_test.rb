# frozen_string_literal: true

require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  
  test "Registro de profesor valido" do
    @professor = professors(:professor_1)
    result = @professor.save
    assert result
  end
  
  #test "Registro de profesor invalido" do
  #  @professor = professors(:professor_2)
  #  result = @professor.save
  #  assert_not result
  #end

end

