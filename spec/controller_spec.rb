require "spec_helper"

describe MicroSessions::Controller do
  context "with a controller" do
    before do
      @controller_class = class SampleController < ActionController::Base
        micro_sessions
        self
      end
    end

    it "should default param to _msid" do
      @controller_class.micro_session_options[:param].should == "_msid"
    end

    it "should default key to _micro_sessions" do
      @controller_class.micro_session_options[:key].should == "_micro_sessions"
    end

    it "should default length to 10" do
      @controller_class.micro_session_options[:length].should == 10
    end

    it "should default counter to 1" do
      @controller_class.micro_session_options[:counter].should == 1
    end

    context "an instance of the controller" do
      before do
        @controller = @controller_class.new
        @controller.stub(:params).and_return({})
      end

      it "should expose #micro_session as a method" do
        @controller.micro_session.should be_an_instance_of(MicroSessions::MicroSession)
      end

      it "should generate a 10-character hash id" do
        @controller.micro_session.id.should be_a(String)
        @controller.micro_session.id.size.should == 10
      end

      context "with micro session data and another controller" do
        before do
          @micro_session_data = {
            :integer => 1,
            :string => "String"
          }

          @another_controller = @controller_class.new
          @another_controller.stub(:params).and_return({})
          @another_controller.stub(:session).and_return({
            "_micro_sessions" => {@controller.micro_session.id => @micro_session_data}
          })
        end

        context "without passing id" do
          subject do
            @another_controller.micro_session
          end

          it "should not have data" do
            subject.data.should == {}
          end
        end

        context "when passing id" do
          subject do
            @another_controller.stub(:params).and_return({"_msid" => @controller.micro_session.id})
            @another_controller.micro_session
          end

          it "should have data" do
            subject.data.should == @micro_session_data
          end
        end
      end
    end
  end
end
