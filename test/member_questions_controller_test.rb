require File.join(File.dirname(__FILE__), 'test_helper')

class Member::Oracle::QuestionsControllerTest < ActionController::TestCase
  context "A Question" do
    setup do
      @controller = Member::Oracle::QuestionsController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
      
      @user = create_user_without_validation
      @controller.stubs(:current_user).returns(@user)
    end
    
    context "new" do
      setup do
        get :new
      end
      should_respond_with :success
    end
    
    context "creation" do
      setup do
        post :create, :question => Factory.attributes_for(:question)
      end
      should_set_the_flash_to "Question created."
      should_redirect_to("the list of the user's questions") { member_oracle_questions_path }
    end

    context "failing creation" do
      setup do
        post :create, :question => { :title => "" }
      end
      should_set_the_flash_to "Error during question creation."
      should_render_template :new
    end
    
    context "list" do
      setup do
        get :index
      end
      should_respond_with :success
      # should_assign_to(:questions) { "current_user.questions" }
    end
    
    context "editing" do
      setup do
        @question = Factory(:question)
        get :edit, :id => @question
      end
      should_respond_with :success
    end
    
    context "updating" do
      setup do
        @question = Factory(:question)
        put :update, :id => @question, :question => Factory.attributes_for(:question)
      end
      should_redirect_to("the list of answers to that question") { oracle_question_answers_path(@question) }
      should_set_the_flash_to "Question updated."
    end
  end
end