class CreateAllPokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :all_pokemons do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
