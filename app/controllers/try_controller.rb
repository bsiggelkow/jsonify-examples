class TryController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index]
  
  def eval_jsonify
    e = Evaluator.new params[:try_source]
    result = 'Stop being naughty!'
    (Thread.new {result = e.evaluate}).join(1)
    render :text => result
  end

end
