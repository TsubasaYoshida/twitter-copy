# frozen_string_literal: true

SimpleForm.setup do |config|
  config.wrappers :default, class: 'form-group' do |b|
    b.use :html5
    b.use :placeholder
    b.use :input, class: 'input-text', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :hint, wrap_with: {tag: :small, class: :hint}
    b.use :full_error, wrap_with: {tag: :div, class: :'error-message'}
  end

  config.default_wrapper = :default
  config.browser_validations = false
  config.button_class = :button
  config.boolean_label_class = :checkbox
end
