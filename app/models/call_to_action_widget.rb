class CallToActionWidget < Widget
  attribute :action, :reference
  attribute :text_on_button, :string, default: 'Click here'
  attribute :color, :enum, values: ['default','primary','success','info','warning','danger','link'], default: 'default'
  attribute :size, :enum, values: ['lg','default','sm','xs'], default: 'default'
  attribute :as_block, :enum, values: ['Yes','No'], default: 'No'
  attribute :is_disabled, :enum, values: ['Yes','No'], default: 'No'
end
