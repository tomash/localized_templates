ActionController::Base.class_eval do
  private
    def template_exists?(template_name = default_template_name)
      @template.send(:_pick_template, template_name, I18n.locale) ? true : false
    rescue ActionView::MissingTemplate
      false
    end
end