class ReponsesController < ApplicationController
    def new
      @question = Question.find(params[:question_id])
      @reponse = @question.reponses.new
      render :new
    end
    def create
        @question = Question.find(params[:question_id])
        @reponse = @question.reponses.new(reponse_params)
        if @reponse.save
          redirect_to question_path(@question)
        else
          render :new
        end
      end

      def show
        @question = Question.find(params[:question_id])
        @reponse = Reponse.find(params[:id])
        render :show
      end

      def edit
        @question = Question.find(params[:question_id])
        @reponse = Reponse.find(params[:id])
        render :edit
      end

      def update
        @reponse = Reponse.find(params[:id])
        if @reponse.update(reponse_params)
          redirect_to question_path(@reponse.question)
        else
          render :edit
        end
      end

      def destroy
        @reponse = Reponse.find(params[:id])
        @reponse.destroy
        redirect_to question_path(@reponse.question)
      end

      private
        def reponse_params
          params.require(:reponse).permit(:answer, :question_id)
        end

  end
