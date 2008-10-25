# = Localized rescue
# 
# This feature extends Rails rescue handling and allows the use of localized
# rescues like <code>en-US/404.html</code> on the public dir. The plugin will
# then pick the rescue page matching the currently used locale
# (<code>I18n#locale</code>).
#
# If the localized rescue page isn't found, the plugin will render the
# <code>404.html</code> file if it exists.
# 
require 'localized_rescue/actioncontroller/rescue'