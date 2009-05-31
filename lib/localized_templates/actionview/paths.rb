module ActionView #:nodoc:
  class PathSet < Array #:nodoc:

    def find_template(original_template_path, format = nil, html_fallback = true)
      return original_template_path if original_template_path.respond_to?(:render)
      template_path = original_template_path.sub(/^\//, '')

      each do |load_path|
        if format && (template = load_path["#{I18n.locale}/#{template_path}.#{format}"])
          return template
        #try the first fallback: usually is enough
        elsif format && (template = load_path["#{I18n.fallbacks[I18n.locale][1]}/#{template_path}.#{format}"])
          return template
        elsif format && (template = load_path["#{template_path}.#{format}"])
          return template
        #try the first fallback: usually is enough
        elsif template = load_path["#{I18n.fallbacks[I18n.locale][1]}/#{template_path}"]
          return template
        elsif template = load_path["#{I18n.locale}/#{template_path}"]
          return template
        elsif template = load_path[template_path]
          return template
        # Try to find html version if the format is javascript
        elsif format == :js && html_fallback && template = load_path["#{I18n.locale}/#{template_path}.html"]
          return template
        elsif format == :js && html_fallback && template = load_path["#{template_path}.html"]
          return template
        end
      end

      return Template.new(original_template_path, original_template_path =~ /\A\// ? "" : ".") if File.file?(original_template_path)

      raise MissingTemplate.new(self, original_template_path, format)
    end

  end
end
