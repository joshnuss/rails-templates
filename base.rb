run "echo TODO > README"

plugin 'jrails', :svn => "http://ennerchi.googlecode.com/svn/trunk/plugins/jrails"
plugin 'rspec', :git => "git://github.com/dchelimsky/rspec.git"
plugin 'rspec-rails', :git => "git://github.com/dchelimsky/rspec-rails.git"
generate :rspec

run "cp config/database.yml config/database_example.yml"
run "rm public/index.html"

git :init
file ".gitignore", <<-END
config/database.yml
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
public/system/*
*.swp
END
git :add => '.', :commit => "-m 'initial commit'"
