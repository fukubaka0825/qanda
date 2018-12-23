class AnswersController < ApplicationController
  before_action :set_question_and_answer,only: [:edit,:update,:destroy]
  def create
    # 紐づいてる回答も引っ張ってきてる　二回SQL投げてる
   @question = Question.find(params[:question_id]) 
   @answer = Answer.new
   if @answer.update(answer_params)
      @question.update(updated_at: @answer[:updated_at])
      redirect_to question_path(@question), notice: '回答投稿しました'
   else
     redirect_to question_path(@question),alert: '回答投稿に失敗しました'
   end
  end
  
  def edit
      
  end
  def update
   if @answer.update(answer_params)
    @question.update(updated_at: @answer[:updated_at])
    redirect_to question_path(@question), notice: '回答を修正しました'
   else
     flash[:alert]='回答投稿に失敗しました'
     render :edit
   end
      
  end
  def destroy
    @answer.destroy
    redirect_to question_path(@question), notice: '回答を修正しました'
  end
  
  private
  def set_question_and_answer
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  end
  
  def answer_params
   params.require(:answer).permit(:content, :name, :question_id, :user_id,:picture)
  end
end
