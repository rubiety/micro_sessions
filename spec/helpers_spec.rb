require "spec_helper"

# Complex Stubbing does not do us any good here... relying on integration tests...
describe MicroSessions::Helpers do
  # before do
  #   @controller_class = Class.new(ActionController::Base)
  #   @controller_class.stub(:micro_session_options).and_return(:param => "_msid")
  #   @helpers = ActionView::Base.new
  #   @helpers.stub(:controller).and_return(@controller_class.new)
  #   @helpers.stub(:micro_session).and_return(mock(:id => "abc123"))
  # end
  # 
  # it "should respond to #micro_session_hidden_field" do
  #   @helpers.should respond_to(:micro_session_hidden_field)
  # end
  # 
  # it "should render correct micro_session_hidden_field" do
  #   @helpers.micro_session_hidden_field.should == %{<input id="_msid" name="_msid" type="hidden" value="abc123" />}
  # end
  # 
  # TODO: This is way too complex to test, requires an enormous amount of stubbing... Need a real Rails app.
  # it "should render correct link_to with :micro_sessions => true" do
  #   @helpers.url_for
  # end
end
