organizer = User.create!(first_name: 'Zack', password:'123', last_name: 'Mance', email: 'zack@dbc.com', age: 29)

guest_1 = User.create!(password:'123',first_name: 'Jean', last_name: 'Grey', email: 'jean@example.com', age: 32)
guest_2 = User.create!(password:'123',first_name: 'Scott', last_name: 'Summers', email: 'scott@example.com', age: 29)

graduation = Event.create!(name: 'Graduation', min_age: 18, held_at: DateTime.parse('05/06/2015'), organizer_id: organizer.id)
mysteryland= Event.create!(name: 'Mysterland', min_age: 18, held_at: DateTime.parse('22/05/2015'), organizer_id: organizer.id)

resi_1 = Reservation.create!(user_id: guest_1.id, event_id: graduation.id)
resi_2 = Reservation.create!(user_id: guest_2.id, event_id: graduation.id)
resi_3 = Reservation.create!(user_id: guest_1.id, event_id: mysteryland.id)

gg = Bottle.create!(name: 'Blue Goose', price: 500.00)
gj = Bottle.create!(name: 'Gopher Juice', price: 1200.00)
pp = Bottle.create!(name: 'Pocket Punch', price: 2200.00)

oj = Mixer.create!(name: 'Orange Juice', price: 20.00)
cb = Mixer.create!(name: 'Cranberry Juice', price: 30.00)
sd = Mixer.create!(name: 'Soda', price: 15.00)

check_1 = Check.new(reservation_id: resi_1.id)
check_2 = Check.new(reservation_id: resi_2.id)
check_3 = Check.new(reservation_id: resi_3.id)

check_1.items << gg
check_1.items << gj
check_1.items << pp
check_1.items << oj
check_1.items << oj
check_1.items << cb

check_2.items << pp
check_2.items << sd

check_3.items << gg
check_3.items << gj
check_3.items << cb

check_1.save!
check_2.save!
check_3.save!
