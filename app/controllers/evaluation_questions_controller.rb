class EvaluationQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evaluation
  before_action :authorize_professor
  
  def create
    @evaluation_question = @evaluation.evaluation_questions.new(evaluation_question_params)
    if @evaluation_question.save
      redirect_to course_evaluation_path(@evaluation.course, @evaluation), notice: "Pregunta añadida exitosamente."
    else
      render 'evaluations/show'
    end
  end
  
    private
  
  def set_evaluation
    @evaluation = Evaluation.find(params[:evaluation_id])
  end
  
  def authorize_professor
    redirect_to root_path unless current_user == @evaluation.course.professor
  end
  
  def evaluation_question_params
    params.require(:evaluation_question).permit(:content)
  end
  end
  