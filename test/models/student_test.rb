# frozen_string_literal: true
# Tests de Estudiantes 

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  test "Registre de curso valido" do
    @student = students(:student_1)
    result = @student.save 
    assert result
  end
  
end
