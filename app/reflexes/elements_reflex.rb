class ElementsReflex < ApplicationReflex
  # update data with stimulus
  def sort
    elements = JSON.parse(element.dataset[:elements])
    elements.each do |element|
      element_record = Element.find(element['id'])
      element_record.update(position: element['position'])
    end
    #Note might break with future stimulus reflex
    @halted = true
  end

end