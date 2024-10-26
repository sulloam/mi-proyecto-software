# frozen_string_literal: true

require 'test_helper'

class ProfessorReviewTest < ActiveSupport::TestCase
  test 'Registro de reseña de profesor valida' do
    @professor_review = professor_reviews(:professor_review_1)
    result = @professor_review.save
    assert result
  end

  test 'Registro de reseña de profesor invalida, sin calificacion' do
    @professor_review = professor_reviews(:professor_review_2)
    result = @professor_review.save
    assert_not result
  end

  test 'Registro de reseña de profesor invalida, sin comentario' do
    @professor_review = professor_reviews(:professor_review_3)
    result = @professor_review.save
    assert_not result
  end
end
