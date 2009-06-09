# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class LanguageTransliterateLocalExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/language_transliterate_local"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :language_transliterate_local
  #   end
  # end
  
  def activate
     admin.page.edit.add(:form, "language_transliterate", :after => 'edit_extended_metadata') 
    # admin.tabs.add "Language Transliterate Local", "/admin/language_transliterate_local", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Language Transliterate Local"
  end
  
end
