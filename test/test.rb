ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'

include Rack::Test::Methods

def app
	Sinatra::Appliccation
end

describe "Pruebas twitter" do

	before :each do
		@name = mery_reds
		@number = 5
	end

	describe "entrada" do

		it "campo nombre" do
			@name.must_equal "mery_reds"
		end

		it "campo numero" do
			@number.must_equal 5
		end

	end

	it "lista correcta" do
		get '/'
			client = my_twitter_client() 
			ultimos_t = client.friends(@name, {}).take(@number)
			lista = ultimos_t.map{ |i| [i.name ,i.followers_count]}
			lista = lista.take(@number)
			lista.length.must_equal @number
	end	
	
end

describe "Pruebas web" do

	it "la pagina carga correctamente" do
		get '/'
		assert last_reponse.ok?
	end
end
