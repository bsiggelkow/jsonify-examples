class TryController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index]
  
  def eval_jsonify
    e = Evaluator.new params[:try_source]
    result = <<-NAUGHTY
    There are 10,000,000,000,000,000,000
    Particles in the Universe That We Can Observe
    Your Momma Took the Ugly Ones
    And Put Them into One Nerd
    NAUGHTY
    t = Thread.new {result = e.evaluate}
    status = t.join(1)
    t.kill unless status
    render :text => result
  end

end
