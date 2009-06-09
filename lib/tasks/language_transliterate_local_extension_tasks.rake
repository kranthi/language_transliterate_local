namespace :radiant do
  namespace :extensions do
    namespace :language_transliterate_local do
      
      desc "Runs the migration of the Language Transliterate Local extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          LanguageTransliterateLocalExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          LanguageTransliterateLocalExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Language Transliterate Local to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from LanguageTransliterateLocalExtension"
        Dir[LanguageTransliterateLocalExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(LanguageTransliterateLocalExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
