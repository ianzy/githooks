require (File.expand_path('../../../spec_helper', __FILE__))

describe Githooks::Helper do
  before(:all) do
    class Subject
      include Githooks::Helper
    end
    @subject = Subject.new
  end
  
  describe ".ask" do
    it "should print question" do
      @subject.stub!(:gets) {"\n"}
      @subject.stub!(:print) {""}
      question = "what's new?"
      answer = @subject.ask question
      answer.should be_true
    end
  end
end