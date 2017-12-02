module Common
  module LabelsHelper

    LABELS = %w(default success info danger warning primary).freeze

    LABELS.each do |name|
      define_method("label_with_#{name}_tag") do |label = nil, opts = {}, &block|
        label = capture(&block) if block
        opts = opts.merge(class: ["label-#{name}"])
        label_with_tag(label, opts)
      end
    end


    def label_with_tag(message, opts = {})
      opts[:class] = [opts[:class], 'label'].compact.join(' ')
      content_tag(:span, message, opts)
    end

  end
end
