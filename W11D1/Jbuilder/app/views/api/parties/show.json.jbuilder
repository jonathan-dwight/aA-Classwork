json.id @party.id
json.name @party.name
json.location @party.location

json.guests @party.guests.each do |guest|
    json.name guest.name
    json.gifts guest.gifts, :title
    # json.array! @party.guests, :id, :name, :age, :favorite_color
    # @party.guests.map {|gifts| gifts}
end
