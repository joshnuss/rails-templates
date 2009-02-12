run "echo TODO > README"

plugin 'jrails', :svn => "http://ennerchi.googlecode.com/svn/trunk/plugins/jrails"

if yes?("Do you want to use RSPEC?")
  plugin 'rspec', :git => "git://github.com/dchelimsky/rspec.git"
  plugin 'rspec-rails', :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end

run "rm public/index.html"

git :init
file ".gitignore", <<-END
log/*.log
log/*.pid
tmp/**/*
.DS_Store
doc/api
doc/app
doc/rspec*
db/*.sqlite3
public/upload/*
public/download/*
public/system/photos/*
db/sphinx/*
*.swp
END
git :add => '.', :commit => "-m 'initial commit'"
