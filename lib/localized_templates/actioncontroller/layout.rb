ActionController::Base.class_eval do
  private
    def layout_directory?(layout_name)
      @template.send(:_pick_template, "#{File.join('layouts', layout_name)}.#{@template.template_format}", I18n.locale) ? true : false
    rescue ActionView::MissingTemplate
      false
    end
end