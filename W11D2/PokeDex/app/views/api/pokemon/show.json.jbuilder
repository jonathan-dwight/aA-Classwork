json.pokemon do 
    # json.id @pokemon.id
    # json.name @pokemon.name
    # json.attack @pokemon.attack
    # json.defense @pokemon.defense
    # json.moves @pokemon.moves
    # json.poke_type @pokemon.poke_type 
    # json.item_ids (@pokemon.items).map {|item| item.id}
    
    json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
    json.image_url asset_path ("pokemon_snaps/#{@pokemon.image_url}")
end


json.items do
    @pokemon.items.each do |item|
        json.set! item.id do
            # json.id item.id
            # json.name item.name
            # json.pokemon_id item.pokemon_id
            # json.price item.price
            # json.happiness item.happiness

            json.extract! item, :id, :name, :pokemon_id, :price, :happiness
            json.image_url asset_path ("#{item.image_url}") 
        end
    end
end



#   create_table "pokemons", force: :cascade do |t|
#     t.string "name", null: false
#     t.integer "attack", null: false
#     t.integer "defense", null: false
#     t.string "poke_type", null: false
#     t.string "moves", default: [], null: false, array: true
#     t.string "image_url", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   #has many items:


#     create_table "items", force: :cascade do |t|
#     t.integer "pokemon_id", null: false
#     t.string "name", null: false
#     t.integer "price", null: false
#     t.integer "happiness", null: false
#     t.string "image_url", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["pokemon_id"], name: "index_items_on_pokemon_id"
#   end