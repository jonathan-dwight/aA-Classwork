# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
Artwork.connection.execute('ALTER SEQUENCE artworks_id_seq RESTART WITH 1')
ArtworkShare.connection.execute('ALTER SEQUENCE artwork_shares_id_seq RESTART WITH 1')

user1 = User.create(username: 'alpha')
user2 = User.create(username: 'beta')
user3 = User.create(username: 'gamma')
user4 = User.create(username: 'delta')
user5 = User.create(username: 'epsilon')

artwork_1 = Artwork.create(title: 'Mona Lisa', image_url: 'google.com', artist_id: 1)
artwork_2 = Artwork.create(title: 'The Starry Night', image_url: 'yahoo.com', artist_id: 2)
artwork_3 = Artwork.create(title: 'American Gothic', image_url: 'bing.com', artist_id: 3)

artwork_share1 = ArtworkShare.create(viewer_id: 5, artwork_id: 1)
artwork_share2 = ArtworkShare.create(viewer_id: 4, artwork_id: 1)
artwork_share3 = ArtworkShare.create(viewer_id: 3, artwork_id: 2)
artwork_share4 = ArtworkShare.create(viewer_id: 3, artwork_id: 1)
artwork_share5 = ArtworkShare.create(viewer_id: 1, artwork_id: 3)
