class ExamplesController < ApplicationController

  respond_to :json
  
  layout 'application', :only => :index
  
  def index
  end
  
  def array_of_objects
  end

end
