class ExamplesController < ApplicationController

  respond_to :json
  
  def index
  end
  
  def array_of_objects
    @foos = [Foo.new('bar'),Foo.new('baz')]
  end

end
