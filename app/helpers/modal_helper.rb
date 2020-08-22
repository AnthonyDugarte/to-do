module ModalHelper
  def model_modal_id(resource)
    "modal-#{resource.class.name.downcase}-#{resource.id || 'new'}"
  end
end
