LocalizedTemplates
=================

This plugin uses Rails i18n plugin (http://rails-i18n.org/) to facilitate templates localization.
You can localize your views and rescue files using the following naming convention:

  <tt>index-pt-br.html.erb</tt>
  <tt>edit-en-us.rss.builder</tt>

If you don't want to localize a file (like a xml file), simply don't change it and it will be
rendered as default to all languages.

Installation
=================

To install the plugin, change into an existing Rails application and run

  ruby script/plugin install git://github.com/josevalim/localized-templates.git

This will download the plugin and store it in vendor/plugins/localized-templates.

Adding a new locale
=================

To add a new locale, simply create a new file in config/locales. You can make your life easier by copying an existing
locale and basing your new locale on it.

Check installed locales
=================

To display a list of all locales installed in config/locales, you can use the following rake command:

  rake locales

Changing the default locale
=================

If you want to use a default locale other than en-US, you have to tell the i18n plugin the locale you want to use by
default. Simply put the following line in an initializer in config/initializers or include it in your environment.rb:

    I18n.default_locale = 'de-AT'

Bugs and Feedback
=================

If you discover any bugs I'd appreciate if you sent me an e-mail to jose.valim@gmail.com
If you have positive feedback and want to drop me a line that's fine, too! =)


Copyright (c) 2008 José Valim <jose.valim@gmail.com>, released under the MIT license

http://www.pagestacker.com/
http://josevalim.blogspot.com/
http://github.com/josevalim/localized-templates