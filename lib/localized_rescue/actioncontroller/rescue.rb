ActionController::Base.class_eval do

  protected
    # Attempts to render a static error page based on the <tt>status_code</tt> thrown,
    # or just return headers if no such file exists. For example, if a 500 error is 
    # being handled Rails will first attempt to render the file at the current locale
    # such as <tt>public/500-en-us.html</tt>. Then the file with no locale
    # <tt>public/500.html</tt>. If the files doesn't exist, the body of the response
    # will be left empty.
    #
    def render_optional_error_file(status_code)
      status = interpret_status(status_code)
      locale_path = "#{Rails.public_path}/#{status[0,3]}-#{I18n.locale.downcase}.html" if I18n.locale
      path = "#{Rails.public_path}/#{status[0,3]}.html"

      if locale_path && File.exist?(locale_path)
        render :file => locale_path, :status => status
      elsif File.exist?(path)
        render :file => path, :status => status
      else
        head status
      end
    end

end