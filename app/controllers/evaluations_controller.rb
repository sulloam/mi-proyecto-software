class EvaluationsController < ApplicationController
  before_action :set_course, only: [:new, :create, :take, :submit, :manage, :student_responses]
  before_action :set_evaluation, only: [:take, :submit, :edit, :update, :destroy, :student_responses]

  def new
    @evaluation = @course.evaluations.build
    3.times do
      question = @evaluation.evaluation_questions.build
      4.times { question.options.build }
    end
  end

  def create
    @evaluation = @course.evaluations.build(evaluation_params)
    if @evaluation.save
      redirect_to manage_course_evaluations_path(@course), notice: "Evaluación creada con éxito."
    else
      render :new
    end
  end

  def manage
    @evaluations = @course.evaluations
  end

  def edit
    # Acción para editar una evaluación
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to manage_course_evaluations_path(@course), notice: "Evaluación actualizada con éxito."
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to manage_course_evaluations_path(@course), notice: "Evaluación eliminada con éxito."
  end

  def take
    # Mostrar evaluación para que el alumno la realice
  end

  def submit
    correct_answers = 0
    params[:answers].each do |question_id, selected_option_id|
      question = EvaluationQuestion.find(question_id)
      selected_option = Option.find(selected_option_id)

      if question.correct_option.strip.downcase == selected_option.content.strip.downcase
        correct_answers += 1
      end
    end

    total_questions = @evaluation.evaluation_questions.count
    score = (correct_answers.to_f / total_questions * 100).round(2)

    # Guardar respuesta del estudiante
    StudentResponse.create!(
      evaluation: @evaluation,
      student: current_user,
      score: score
    )

    flash[:notice] = "Evaluación completada. Tu puntuación es: #{score}%."
    redirect_to course_evaluations_path(@course)
  end

  def student_responses
    @student_responses = @evaluation.student_responses.includes(:student)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_evaluation
    @evaluation = @course.evaluations.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(
      :title,
      evaluation_questions_attributes: [
        :content,
        :correct_option,
        options_attributes: [:content]
      ]
    )
  end
end
