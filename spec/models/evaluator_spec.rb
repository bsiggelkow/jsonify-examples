describe Evaluator do

  describe 'security' do

    %W(Process script SCRIPT).each do |word|
      it "should raise an error if passed '#{word}'" do
        e = Evaluator.new(word)
        e.evaluate.should == "parse error"
      end
    end
  end
end