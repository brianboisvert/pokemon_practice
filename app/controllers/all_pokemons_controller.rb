class AllPokemonsController < ApplicationController
  before_action :set_all_pokemon, only: [:show, :update, :destroy]

  # GET /all_pokemons
  def index
    @all_pokemons = RestClient.get('https://pokeapi.co/api/v2/pokemon/')

    render json: @all_pokemons
  end

  # GET /all_pokemons/1
  def show
    render json: @all_pokemon
  end

  # POST /all_pokemons
  def create
    @all_pokemon = AllPokemon.new(all_pokemon_params)

    if @all_pokemon.save
      render json: @all_pokemon, status: :created, location: @all_pokemon
    else
      render json: @all_pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /all_pokemons/1
  def update
    if @all_pokemon.update(all_pokemon_params)
      render json: @all_pokemon
    else
      render json: @all_pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /all_pokemons/1
  def destroy
    @all_pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_pokemon
      url = 'https://pokeapi.co/api/v2/pokemon/' + params[:id] + '/'
      pokemon = RestClient.get(url)
      @all_pokemon = pokemon
    end

    # Only allow a trusted parameter "white list" through.
    def all_pokemon_params
      params.require(:all_pokemon).permit(:name, :url)
    end
end
