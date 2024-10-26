# Tests de cursos

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Registro de curso sin nombre" do
    @course = courses(:course_1)
    result = @course.save
    assert_not result
  end

  test "Registro de curso sin descripcion" do
    @course = courses(:course_2)
    result = @course.save
    assert_not result
  end

  test "Registro de curso sin modalidad" do 
    @course = courses(:course_3)
    result = @course.save 
    assert_not result
  end
  
  test "Registro de curso valido" do 
    @course = courses(:course_4)
    result = @course.save
    assert result
  end

end

