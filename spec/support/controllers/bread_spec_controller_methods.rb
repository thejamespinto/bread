module BreadSpecControllerMethods

  def bread_titles
    controller.bread.map(&:title)
  end

  def bread_paths
    controller.bread.map(&:path)
  end

end
