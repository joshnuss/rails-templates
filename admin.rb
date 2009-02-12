load_template "../base.rb"

inside('vendor/plugins') do
  run "git clone git://github.com/technoweenie/restful-authentication.git restful_authentication"
end

user = ask("What do you want to call the user model?")
generate :authenticated, user, "sessions"

git :add => '.', :commit => "-m 'added authenticaton and #{user} model'"

plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git'
git :add => '.', :commit => "-m 'added will_paginate plugin'"

plugin 'make_resourceful', :svn => "svn://svn.hamptoncatlin.com/make_resourceful/trunk"
git :add => '.', :commit => "-m 'added make_resourceful plugin'"
