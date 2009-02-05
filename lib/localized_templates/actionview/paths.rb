module ActionView #:nodoc:
  class PathSet < Array #:nodoc:

    def find_template(original_template_path, format = nil)
      return original_template_path if original_template_path.respond_to?(:render)
      template_path = original_template_path.sub(/^\//, '')

      each do |load_path|
        if format && (template = load_path["#{I18n.locale}/#{template_path}.#{format}"])
          return template
        elsif format && (template = load_path["#{template_path}.#{format}"])
          return template
        elsif template = load_path["#{I18n.locale}/#{template_path}"]
          return template
        elsif template = load_path[template_path]
          return template
        # Try to find html version if the format is javascript
        elsif format == :js && template = load_path["#{I18n.locale}/#{template_path}.html"]
          return template
        elsif format == :js && template = load_path["#{template_path}.html"]
          return template
        end
      end

      Template.new(original_template_path, self)
    end

  end
end
