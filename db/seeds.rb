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
a = User.create!(
  first_name: 'Selin',
  last_name: 'Immel',
  email: 'selin.immel@gmail.com',
  address: 'Schlossstrasse 99, 65719 Hofheim am Taunus',
  biography: 'Welcome to my studio.',
  is_teacher: true,
  is_admin: true,
  password: '123456',
  studio_id: s.id,
  remote_photo_url: "https://avatars3.githubusercontent.com/u/48353082?s=400&v=4"
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
  studio_id: s.id,
  )

User.create!(
  first_name: 'Hugo',
  last_name: 'Smith',
  email: 'hugo@gmail.com',
  address: 'Gang Jalak 17, Bali',
  biography: 'Hugo has been practicing yoga and meditation for 9 years. He fell in love at first stretch when he was introduced to the the pranayama practice in 2010 as it combined his passions for sports, meditation and self-inquiry. As an certified Ashtanga teacher, his intention is to share the gifts of this system as they have been transmitted to him by his teachers. As a guide, his role is to inspire people to the practice and embark on the transformational journey toward themselves. When not teaching at his school in Bali, Hugo travels around the world and shares his passion for yoga with insight, humour and compassion. He also holds certifications in biology and bodywork and uses his understanding of the body-mind connections to support healing on many levels.',
  is_teacher: true,
  is_admin: false,
  password: '123456',
  studio_id: s.id
  )

User.create!(
  first_name: 'Johnny',
  last_name: 'Chan',
  email: 'jc@hotmail.com',
  address: 'Gang Jalak 17, Bali',
  biography: 'Hugo has been practicing yoga and meditation for 9 years. He fell in love at first stretch when he was introduced to the the pranayama practice in 2010 as it combined his passions for sports, meditation and self-inquiry. As an certified Ashtanga teacher, his intention is to share the gifts of this system as they have been transmitted to him by his teachers. As a guide, his role is to inspire people to the practice and embark on the transformational journey toward themselves. When not teaching at his school in Bali, Hugo travels around the world and shares his passion for yoga with insight, humour and compassion. He also holds certifications in biology and bodywork and uses his understanding of the body-mind connections to support healing on many levels.',
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
  content: 'Hatha is a general category that includes most yoga styles. It is an old system that includes the practice of asanas (yoga postures) and pranayama (breathing exercises), which help bring peace to the mind and body, preparing the body for deeper spiritual practices such as meditation.',
  slots: 20,
  start_time: "18:00",
  end_time: "19:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Hatha beginner',
  location: 'Room 2',
  content: 'A softer approach to explore your inner landscape through yoga poses (Asanas), breathing exercises (Pranayama) and meditation.',
  slots: 10,
  start_time: "16:00",
  end_time: "17:00",
  start_date: "14.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Hatha advanced',
  location: 'Room 3',
  content: 'These classes are designed for students looking to take their practice and understanding of Yoga to the next level. Hatha Yoga utilizes the ancient technologies of Asana, Pranayama, Bandha, Mudra and Meditation to deepen the connection to Mind (MOON) and Power or Prana (SUN) and ultimately towards the experience of ‘yoking’ these subtle forces within the navel and enlivening the dormant potential at the base of the spine know as Kundalini (FIRE).',
  slots: 10,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "15.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Vinyasa',
  location: 'Room 1',
  content: 'Vinyasa yoga style is a dynamic yoga practice flowing from pose to pose by synchronising body movements with breath movements. Explore new yoga poses into a gradual progression from easier to more advanced asanas. Get ready to move, breathe, sweat and challenge yourself!',
  slots: 10,
  start_time: "10:00",
  end_time: "11:00",
  start_date: "14.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Pranayama',
  location: 'Room 2',
  content: 'Practices of Pranayama include Teaching basic breath awareness, Natural breathing Abdomino-diaphragmatic breathing Thoracic-diaphragmatic breathing Clavicular- diaphragmatic breathing Yogic Breathing Kapalbhati Pranayama (frontal brain cleansing breath or cultivating light) Bhastrika Pranayama (bellows breath) Ujjayi Pranayama (the psychic breath) Sheetali Pranayama (cooling breath) Sheetkari Pranayama (hissing breath) Suryabheda: Stimulating Vitality Chandrabheda: Calming Energy Nadi Shodhana: Alternate Nostril Breathing Bhramari Pranayama (humming bee breath).',
  slots: 10,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "14.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Meditation',
  location: 'Room 3',
  content: 'This class has something to offer all levels of practitioners, wether you‘re new to meditation and wondering where to start or you have an established practice and would like to discover some new techniques and benefit from the collective energy of the sangha.
  Use your mind to shape your brain for greater happiness, love, and wisdom and connect with the infinite and luminous landscape of your true nature',
  slots: 10,
  start_time: "06:00",
  end_time: "07:00",
  start_date: "16.06.2019",
  occurrence: 5,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Kundalini',
  location: 'Room 1',
  content: 'Kundalini incorporates repeated movements or exercises, dynamic breathing techniques, chanting, meditation and mantras. Each specific kundalini exercise, referred to as a kriya, is a movement that is often repeated and is synchronized with the breath. The practice is designed to awaken the energy at the base of the spine in order to draw it upward through each of the seven chakras.Brought to the west by Yogi Bhajan, this form of yoga looks and feels quite different than any other, due to its focus on repetitive, enhanced breathing and the movement of energy through the body.',
  slots: 20,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Bikram',
  location: 'Room 1',
  content: 'Bikram Yoga is a series of 26 postures to work every inch of your body, every internal organ, muscle, tendon, ligament and joint.You’ll develop strength and flexibility.',
  slots: 20,
  start_time: "18:00",
  end_time: "19:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Power',
  location: 'Room 1',
  content: 'Power yoga is used to describe a vigorous, vinyasa-style yoga. It originally closely resembled ashtanga and was an attempt to make ashtanga more accessible to Western students. It differs, however, in that it is not a set series of poses, but rather allows the instructor freedom to teach what they want.',
  slots: 20,
  start_time: "15:00",
  end_time: "16:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Iyengar',
  location: 'Room 2',
  content: 'In a typical iyengar class, poses are held much longer than in other schools of yoga, in an effort to pay closer attention to the precise musculoskeletal alignment within each asana. Another trademark of iyengar is the use of props, such as blocks, belts, bolsters, chairs and blankets, which are used to accommodate injuries, tightness or structural imbalances, as well as teach the student how to move into a posture properly.',
  slots: 20,
  start_time: "18:00",
  end_time: "19:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Anusara',
  location: 'Room 2',
  content: 'The anusara style is a new system of hatha that teaches a set of Universal Principles of Alignment that underlie all yoga postures, while encouraging flowing with grace and following your heart.',
  slots: 20,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Sivananda',
  location: 'Room 2',
  content: 'A class typically begins with Savasana (relaxation pose), kapalabhati and anuloma viloma, followed by a few rounds of surya namaskara. Chanting and meditation can also be a part of a full-length class.',
  slots: 20,
  start_time: "11:00",
  end_time: "12:00",
  start_date: "15.06.2019",
  occurrence: 10,
  user_id: t.id,
  studio_id: s.id
  )

Lesson.create!(
  name: 'Restorative',
  location: 'Room 2',
  content: 'Restorative is a gentle, relaxing, passive style that allows students to relax and release the body into a gentle stretch that is held for as long as 10 minutes. This style makes use of a wide range of props, including bolsters, blocks, straps and blankets. The intention is to provide support within each pose, making it easier to completely leg go.',
  slots: 20,
  start_time: "15:00",
  end_time: "16:00",
  start_date: "15.06.2019",
  occurrence: 10,
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
  payment_option: "cash"
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

puts 'Creating the default studio-announcements-channel'
ya = Category.create!(
  user_id: u.id,
  title: 'Studio News',
  description: 'All general studio announcements will be made via this channel so make sure to log in regularly 🧘🏻‍♀️🧘🏽‍♂️',
  studio_id: s.id
  )

puts 'Creating a second channel-category...'
c = Category.create!(
  user_id: a.id,
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

puts 'Creating a studio announcement'
Post.create!(
  user_id: a.id,
  category_id: ya.id,
  title: 'Hatha class 30mins later on Monday, 17.06.',
  content: 'Please remember that next weeks Hatha class will start 30 minutes later due to the extended meditation session. If you are able to come by the studio at 4pm already you are more than welcome to join the meditation lesson plus the regular Hatha class.
  In case of any questions, please comment 😊'
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
