class Evaluator
  attr_reader :json, :source, :sandbox, :blacklist

  def initialize(source=nil)
    @source = source
    @json = ::Jsonify::Builder.new(:format => :pretty)
    @sandbox = EvaluatorSandbox.new(json)
    @blacklist = %w( Process Kernel class module eval class_eval module_eval 
                     Proc lambda require script `)
  end

  def evaluate
    begin
      raise "potential malicious script" if blacklist.any?{ |word| source =~ /#{word}/i }
      result = lambda do
        $SAFE = 3
        sandbox.instance_eval source
        json.compile!
      end.call
    rescue
      puts $!
      "parse error"
    end
  end
end

class EvaluatorSandbox < BasicObject
  attr_reader :json
  
  def initialize(json)
    @json = json
  end

end  
