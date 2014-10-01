task(:default) do
	require 'test/test.rb'
end


desc "ejecutar los tests"
task :test => :default


desc "Intalacion de gema"
task :bundle do
	sh "bundle install"
end


desc "Arrancar la aplicacion"
task :server do
  sh "ruby twitter.rb"
end

