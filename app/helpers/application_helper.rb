module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Frest"      
    end
  end
end
