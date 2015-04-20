class NamedLink < Obj
  attribute :related_links, :linklist


  def show_in_navigation?
    false
  end

end
