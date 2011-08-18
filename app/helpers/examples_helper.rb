module ExamplesHelper
  def jsonify_content(name)
    File.read(File.join(ActionController::Base.view_paths.first,'examples',"#{name}.jsonify"))
  end
  
  def json(content)
    content.to_json.html_safe
  end
end
