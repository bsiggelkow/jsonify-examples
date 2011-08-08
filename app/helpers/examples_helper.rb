module ExamplesHelper
  def jsonify_content(name)
    content_tag("pre") do
      File.readlines(File.join(ActionController::Base.view_paths.first,'examples',"#{name}.jsonify")).join("\n")
    end
  end
end
