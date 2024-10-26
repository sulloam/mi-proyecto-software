# frozen_string_literal: true

require 'test_helper'

class CourseReviewTest < ActiveSupport::TestCase
  
  test "Registro de reseña de curso valida" do 
    @course_review = course_reviews(:course_review_1)
    result = @course_review.save
    assert result
  end

  test "Registro de reseña de curso invalida, sin calificacion" do
    @course_review = course_reviews(:course_review_2)
    result = @course_review.save
    assert_not result
  end

  test "Registro de reseña de curso invalida, sin comentario" do
    @course_review = course_reviews(:course_review_3)
    result = @course_review.save
    assert_not result 
  end

end

