class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reviewable, only: [:new, :create, :index, :edit, :update]
  before_action :set_review, only: [:edit, :update]
  
  def new
    @review = @reviewable.reviews.build
  end
  
  def create
    @review = @reviewable.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:notice] = "Tu reseña se ha enviado correctamente."
      redirect_to @reviewable
    else
      flash.now[:alert] = "Hubo un problema al enviar tu reseña. Por favor corrige los errores."
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @reviews = @reviewable.reviews
  end
  
  def edit
    unless @review.user == current_user
      flash[:alert] = "No puedes editar una reseña que no es tuya."
      redirect_to @reviewable
    end
  end
  
  def update
    if @review.update(review_params)
      flash[:notice] = "Tu reseña se ha actualizado correctamente."
      redirect_to @reviewable
    else
      flash.now[:alert] = "Hubo un problema al actualizar tu reseña. Por favor corrige los errores."
      render :edit, status: :unprocessable_entity
    end
  end
  
    private
  
  def set_reviewable
    if params[:course_id]
      @reviewable = Course.find_by(id: params[:course_id])
      unless @reviewable
        flash[:alert] = "Curso no encontrado."
        redirect_to root_path and return
      end
    elsif params[:professor_id]
      @reviewable = User.find_by(id: params[:professor_id])
      unless @reviewable
        flash[:alert] = "Profesor no encontrado."
        redirect_to root_path and return
      end
    else
      flash[:alert] = "No se encontró el objeto para reseñar."
      redirect_to root_path
    end
  end
  
  def set_review
    @review = @reviewable.reviews.find(params[:id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
  end
  