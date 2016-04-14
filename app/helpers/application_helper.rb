module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Skejələr").join(" - ")
      end
    end
  end
end
