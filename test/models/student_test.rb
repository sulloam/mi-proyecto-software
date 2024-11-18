require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'Registre de curso válido' do
    user = users(:valid_user) # Asegúrate de que esta fixture exista
    course = courses(:valid_course) # Asegúrate de que esta fixture exista

    student = Student.new(user: user, course: course, finished: false)

    assert student.valid?, "Student debería ser válido con user_id y course_id correctos"
    assert student.save, "Student debería guardarse exitosamente"
  end
end
