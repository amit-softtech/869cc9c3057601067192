class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy, :follow_user, :follow_topic]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.joins(:topic, :user).where("")
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = @question.answers.build
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow_user
    respond_to do |format|
      if current_user.followers.pluck(:id).include?(@question.user.id)
        current_user.followers << @question.user
        format.html { redirect_to @question, notice: 'User was successfully followed.' }
      else
        flash[:errors] = "Already Followed"
        format.html { redirect_to @question}
      end
    end
  end

  def follow_topic
    respond_to do |format|
      if @question.topic.users.empty?
        @question.topic.users << current_user
        format.html { redirect_to @question, notice: 'Topic was successfully followed.' }
      else
        flash[:errors] = "Already Followed"
        format.html { redirect_to @question}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :q_type, :topic_id, :user_id)
    end
end
