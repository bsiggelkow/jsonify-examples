class TryController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index]
  
  def eval_jsonify
    e = Evaluator.new params[:try_source]
    result = 'Stop being naughty!'
    t = Thread.new {result = e.evaluate}
    status = t.join(1)
    t.kill unless status
    render :text => result
  end

end
