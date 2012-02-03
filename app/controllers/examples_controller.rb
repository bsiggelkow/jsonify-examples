class ExamplesController < ApplicationController

  respond_to :json
  
  layout false, :except => [:index]
  
end
