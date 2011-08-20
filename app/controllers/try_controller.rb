class TryController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index]
  
  def eval_jsonify
    e = Evaluator.new params[:try_source]
    render :text => e.evaluate
  end

end
