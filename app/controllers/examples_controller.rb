class ExamplesController < ApplicationController

  respond_to :json
  
  layout 'application', :only => [:index]
  
end
