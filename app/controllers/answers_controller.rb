class AnswersController < ApplicationController
  before_action :authenticate_user! 
	
  def create
  	@question = Qusetion.find(question_id)
  	answer = @question.answers.create(user_id: current_user, answer_field: params[:answer][:answer_field])
  	redirect_to question_path(@question)
  end
end
