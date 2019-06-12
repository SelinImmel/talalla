# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning the database...'
Booking.destroy_all
Lesson.destroy_all
UserPlan.destroy_all
Order.destroy_all
Note.destroy_all
Comment.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all
Event.destroy_all
Subscription.destroy_all
Studio.destroy_all
puts 'Puh, that was a lot of cleaning!'

puts 'Creating a studio..'
s = Studio.create!(
  name: 'talalla',
  address: 'Wonderland',
  phone_number: '0163 62739023',
  email: 'studio@talalla.com',
  homepage: 'www.talalla.com'
  )

puts 'Creating an admin...'
User.create!(
  first_name: 'Selin',
  last_name: 'Immel',
  email: 'selin.immel@gmail.com',
  address: 'Schlossstrasse 99, 65719 Hofheim am Taunus',
  biography: 'Welcome to my studio.',
  is_teacher: true,
  is_admin: true,
  password: '123456',
  studio_id: s.id,
  remote_photo_url: "https://image.flaticon.com/icons/png/512/129/129728.png"
)


puts 'Creating a teacher...'
t = User.create!(
  first_name: 'Alina',
  last_name: 'Heimgartner',
  email: 'alina.heimgartner@gmail.com',
  address: 'Im Breitloo 5, 8802 Kirchberg, Zurich',
  biography: 'Dedicated teacher, looooove yoga. See you guys on the mat!',
  is_teacher: true,
  is_admin: false,
  password: '123456',
  studio_id: s.id
  )

User.create!(
  first_name: 'Hugo',
  last_name: 'Smith',
  email: 'hugo@gmail.com',
  address: 'Gang Jalak 17, Bali',
  biography: 'Dedicated teacher, mixes yoga with fitness!',
  is_teacher: true,
  is_admin: false,
  password: '123456',
  studio_id: s.id
  )

puts 'Creating students...'
u = User.create!(
  first_name: 'Nico',
  last_name: 'Klug',
  email: 'nico.klug@gmail.com',
  address: 'Hauptstrasse 10, 65182 Stuttgard',
  biography: 'Just starting out with yoga, very excited to meet everyone!',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: s.id
  )
o = User.create!(
  first_name: 'Richard',
  last_name: 'Angapin',
  email: 'richard.angapin@gmail.com',
  address: 'Rue de Fromage, 71530 Lyon',
  biography: 'Have been dedicated to yoga for 10 years and counting. Excited to join this studio.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: s.id
  )



puts 'Creating a lesson...'
l = Lesson.create!(
  name: 'Hatha',
  location: 'Room 1',
  content: 'A yoga lesson for our more advanced yogis. 60mins in total, get ready to sweat and relax!',
  slots: 20,
  start_time: "18:00",
  end_time: "19:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Hatha',
  location: 'Room 1',
  content: 'A yoga lesson for our more advanced yogis. 60mins in total, get ready to sweat and relax!',
  slots: 20,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Hatha beginner',
  location: 'Room 2',
  content: 'A yoga lesson for our beginner yogis. 60mins in total, get ready to sweat and relax!',
  slots: 10,
  start_time: "16:00",
  end_time: "17:00",
  start_date: "15.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Hatha beginner',
  location: 'Room 2',
  content: 'A yoga lesson for our beginner yogis. 60mins in total, get ready to sweat and relax!',
  slots: 10,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "15.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )


puts 'Creating a subscription..'
subs = Subscription.create!(
  name: '12 class pack',
  content: 'Yoga package for twelve yoga classes',
  package_size: 12,
  durability: 60,
  subscription_sku: '12-class-pack',
  studio_id: s.id,
  amount_cents: 200_000_00,
  payment_option: "card"
  )

sub_cash = Subscription.create!(
  name: '1 class pack',
  content: 'Yoga package for a yoga classes',
  package_size: 1,
  durability: 1,
  subscription_sku: '1-class-pack',
  studio_id: s.id,
  amount_cents: 200_000_00,
  payment_option: 'cash'
  )

puts 'Creating a order...'
p = Order.create!(
  subscription_id: subs.id,
  user_id: u.id,
  date: Date.today,
  total_amount_cents: subs.amount_cents,
  status: 'outstanding',
  payment_method: 'cash'
  )

puts 'Creating a user_plan...'
up = UserPlan.create!(
  order_id: p.id,
  left_usage: 11,
  start_date: Date.today,
  end_date: DateTime.parse("01/07/2019"),
  user_id: u.id
  )

puts 'Creating a booking...'
Booking.create!(
  user_plan_id: up.id,
  user_id: u.id,
  lesson_id: l.id,
  date: Date.today
  )

puts 'Creating a secondbooking...'
boo =Booking.new(
  user_plan_id: up.id,
  user_id: u.id,
  lesson_id: l.id,
  date: Date.today-5
  )
boo.save

puts 'Creating a third booking...'
boo =Booking.new(
  user_plan_id: up.id,
  user_id: u.id,
  lesson_id: l.id,
  date: Date.today-3
  )
boo.save


puts 'Creating an event...'
Event.create!(
  title: 'Ashtanga Yoga Workshop',
  content: 'Meet our new visiting ashtanga yoga expert and profit from her extraordinary teaching techniques directly from India.',
  date: Date.today,
  studio_id: s.id
  )

puts 'Creating a note...'
Note.create!(
  user_id: u.id,
  title: 'Its been a good day.',
  content: 'Practiced for 2 hours and had a great meditation session. Note to self: meditate every second day.',
  date: Date.today
  )

puts 'Creating a channel-category...'
c = Category.create!(
  user_id: u.id,
  title: 'Mysore',
  description: 'Exchange about mysore-techniques and a safe-space for questions',
  studio_id: s.id
  )

puts 'Creating a post...'
p = Post.create!(
  user_id: u.id,
  category_id: c.id,
  title: 'My Mysore tips and tricks',
  content: 'MYSORE STYLE is a particular way of teaching yoga within the tradition of Ashtanga Yoga as taught by Sri K. Pattabhi Jois in Mysore, India. In this class everyone practices at their own pace, with assistance and adjustment from the teacher. The support is given to each student individually but within a group of people practicing together. Each student memorizes the sequence of asana (postures) to follow and new poses are progressively added to it when a student is ready. In Mysore style one begins learning slowly, respecting the limitations of the body and focusing on the breathing. The time of the class is the time it takes you to practice. Your first practice may only be about 30-45 min, while for someone more experienced it can take up to 1 h and 45 minutes. The entry to Mysore class is flexible, people start and finish at different times.'
  )

puts 'Creating a comment...'
Comment.create!(
  user_id: u.id,
  post_id: p.id,
  content: 'Thank you so much, this really improved my flow!'
  )

puts 'Creating a second comment...'
Comment.create!(
  user_id: o.id,
  post_id: p.id,
  content: 'Wow already my second comment!'
  )

puts 'All done, YAY 🐣'
