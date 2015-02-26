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
      expect(@controller_class.micro_session_options[:param]).to eq("_msid")
    end

    it "should default key to _micro_sessions" do
      expect(@controller_class.micro_session_options[:key]).to eq("_micro_sessions")
    end

    it "should default length to 10" do
      expect(@controller_class.micro_session_options[:length]).to eq(10)
    end

    it "should default counter to 1" do
      expect(@controller_class.micro_session_options[:counter]).to eq(1)
    end

    context "an instance of the controller" do
      before do
        @controller = @controller_class.new

        allow(@controller).to receive(:params).and_return({})
      end

      it "should expose #micro_session as a method" do
        expect(@controller.micro_session).to be_kind_of(MicroSessions::MicroSession)
      end

      it "should generate a 10-character hash id" do
        expect(@controller.micro_session.id).to be_a(String)
        expect(@controller.micro_session.id.size).to eq(10)
      end

      context "with micro session data and another controller" do
        before do
          @micro_session_data = { integer: 1, string: "String" }

          @another_controller = @controller_class.new

          allow(@another_controller).to receive(:params).and_return({})
          allow(@another_controller).to receive(:session).and_return({
            "_micro_sessions" => {@controller.micro_session.id => @micro_session_data}
          })
        end

        context "without passing id" do
          subject do
            @another_controller.micro_session
          end

          it "should not have data" do
            expect(subject.data).to be_empty
          end
        end

        context "when passing id" do
          subject do
            allow(@another_controller).to receive(:params).and_return({"_msid" => @controller.micro_session.id})

            @another_controller.micro_session
          end

          it "should have data" do
            expect(subject.data).to eq(@micro_session_data)
          end
        end
      end
    end
  end
end
