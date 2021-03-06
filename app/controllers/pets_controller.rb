class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    
    erb :'/pets/new'
  end

  post '/pets' do 
    # binding.pry
    @pet = Pet.create(params[:pet])
    
    if !params["owner"]["name"].empty?
      @owner = Owner.create(name: params["owner"]["name"])
      @owner.pets << @pet
      @pet.owner = @owner
    end
    
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end