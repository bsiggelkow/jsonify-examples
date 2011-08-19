class ExamplesController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index, :try_jsonify]
  
  def index
  end
  
  def eval_jsonify
    e = Evaluator.new params[:try_source]
    render :text => e.evaluate
  end

end
