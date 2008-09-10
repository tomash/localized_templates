ActionController::Base.class_eval do
  private
    def template_exists?(template_name = default_template_name)
      @template.send(:_pick_template, template_name, I18n.locale) ? true : false
    rescue ActionView::MissingTemplate
      false
    end

    def layout_directory?(layout_name)
      @template.__send__(:_pick_template, "#{File.join('layouts', layout_name)}.#{@template.template_format}", I18n.locale) ? true : false
    rescue ActionView::MissingTemplate
      false
    end
end