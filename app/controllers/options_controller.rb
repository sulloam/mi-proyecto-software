class OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evaluation_question
  before_action :authorize_professor
  
  def create
    @option = @evaluation_question.options.new(option_params)
    if @option.save
      redirect_to course_evaluation_path(@evaluation_question.evaluation.course, @evaluation_question.evaluation), notice: "Opción añadida exitosamente."
    else
      render 'evaluations/show'
    end
  end
  
    private
  
  def set_evaluation_question
    @evaluation_question = EvaluationQuestion.find(params[:evaluation_question_id])
  end
  
  def authorize_professor
    redirect_to root_path unless current_user == @evaluation_question.evaluation.course.professor
  end
  
  def option_params
    params.require(:option).permit(:content)
  end
  end
  