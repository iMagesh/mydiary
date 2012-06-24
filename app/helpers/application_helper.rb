module ApplicationHelper

  def markdown_html(content)
    Maruku.new(content).to_html    
  end
  
end
