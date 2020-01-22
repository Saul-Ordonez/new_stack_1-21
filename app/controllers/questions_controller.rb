class QuestionsController < ApplicationController
  before_action :authorize, only: [:secret]
  def index
    @questions = Question.all
    render :index
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    # @user = User.find(params[:user_id])
    @question = Question.new(question_params)
    # @question = @user.questions.new
    if @question.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to user_path(@question.user)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_path(@question.user)
  end

  private
  def question_params
    params.require(:question).permit(:content, :user_id)
  end

end
