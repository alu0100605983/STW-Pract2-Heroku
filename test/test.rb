ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require './twitter.rb'
require './configure.rb'

include Rack::Test::Methods

def app
	Sinatra::Application
end

describe "Pruebas twitter" do

	before :each do
		@amigos_usuario = CuantosAmigos.new
		@client = my_twitter_client()
		@name = "mery_reds"
		@name2 = "troloroooooooo"
	end

	it "cargar index en el servidor" do
		get '/'
		assert last_response.ok?
	end

	it "titulo de la pagina igual a Amigos de usuario" do
		get '/'
		assert last_response.body.include?("<title> Amigos de usuario</title>"), "El titulo debe ser Amigos de usuario"
	end

	it "el usuario existe" do
		assert @amigos_usuario.test_usuario(@client, @name)
	end

	it "hay un formulario donde preguntar?" do
		get '/'
		assert last_response.body.include?("Introduzca su nombre en Twitter:"), "El body debe contener nombre de usuario"
		assert last_response.body.include?("¿Cuántos amigos desea ver?"), "El body debe contener el numero de amigos"
	end

	it "el usuario no debe existir" do
		refute @amigos_usuario.test_usuario(@client, @name2)
	end

	it "numero de amigos coincide" do
		assert_equal 133 #Sustituir por numero de amigos cuenta
	end

	it "numero de amigos erroneos" do
		refute_equal 5, @amigos_usuario.test_amigos(@client, @name)
	end	
end
