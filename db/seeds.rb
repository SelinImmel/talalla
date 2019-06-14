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
studio = Studio.create!(
  name: 'Mysore Zurich',
  address: 'Gartenhofstrasse 24, 8004 Zurich',
  phone_number: '0163 62739023',
  email: 'mysore@gmail.com',
  homepage: 'www.mysore.com'
  )

puts 'Creating an admin...'
selin = User.create!(
  first_name: 'Selin',
  last_name: 'Immel',
  email: 'selin.immel@gmail.com',
  address: 'Schlossstrasse 99, 65719 Hofheim am Taunus',
  biography: 'Selin began her yoga journey in 2003 through the help of a back injury. Her desired outcome is to support first-time yogis kick-off their yoga journeys through cultivating clarity, fascination, and confidence.
Estee’s classes, privates, and workshops are dedicated to yoga beginners, encompassing Hatha and Yin practices as a means to converse with the Chakra System and awaken to the Inner Teacher.',
  is_teacher: true,
  is_admin: true,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://www.theyogabarn.com/images/bali-yoga-trachers/murni-made.jpg"
)


puts 'Creating a second admin...'
anik = User.create!(
  first_name: 'Anik',
  last_name: 'Hauser',
  email: 'anik.hauser@gmail.com',
  address: 'Im Breitloo 5, 8802 Kirchberg, Zurich',
  biography: 'With a background in Development studies, journalism and social work, Aniks approach to yoga is one that honors the need for individual self study with the aim of improving interpersonal relations and common-unity. Bex has studied yoga since 2001, inspired by teachers such as Seane Corne, Simon Park, Govinda Jai, John Scott and Dharma Mittra',
  is_teacher: true,
  is_admin: true,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://www.theyogabarn.com/images/bali-yoga-trachers/bex-tyrer.jpg"
  )

puts 'Creating teachers...'
carlos = User.create!(
  first_name: 'Carlos',
  last_name: 'Devine',
  email: 'carlos.devine@gmail.com',
  address: 'Im Breitloo 5, 8802 Kirchberg, Zurich',
  biography: 'Carlos is a Surfyogis devoted Yoga teacher, who has been immersed in the journey of self-exploration through Yoga for over the last 15 years.

After finishing his first Yoga Teacher Training in Sivananda Divine Life Society School (2002) he has continued to deepen his Yoga practice and expand the scope of his studies in Ashtanga, Vinyasa, Jivamukti, Dharma Mittra Yoga, Anusara, Yin and Embodied Flow. In 2005, he became a Thai Yoga Massage therapist and continued his exploration and studies into other forms of movement & healing. He discovered AcroYoga in 2010, and has since dedicated to share this practice to explore connection and confidence for all those who feel the beauty of combining yoga, acrobatics & healing arts.',
  is_teacher: true,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://www.theyogabarn.com/images/bali-yoga-trachers/carlos-romero-1.jpg"
  )

daniela = User.create!(
  first_name: 'Daniela',
  last_name: 'Beno',
  email: 'Daniela.beno@gmail.com',
  address: 'Im Breitloo 5, 8802 Kirchberg, Zurich',
  biography: 'We pulse as one. We gravitate to unify the global family, celebrate interconnectedness, and offer full devotion to divine Self."Originally based in Mexico, World Traveler, Daniela has been immersed in bodywork and spiritual practice for more than 17 years.  She is the founder of the School of Healing Arts, and SOHA Yoga Teacher Trainings, and Co-Founder and Spiritual Director of Sutra Yoga Studio, based in Monterrey, Mexico.',
  is_teacher: true,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://www.theyogabarn.com/images/bali-yoga-trachers/daniela-garza-rios.jpg"
  )

User.create!(
  first_name: 'Malika',
  last_name: 'Jusi',
  email: 'malika.jusi@gmail.com',
  address: 'Im Breitloo 5, 8802 Kirchberg, Zurich',
  biography: 'Malika Studied Hatha Yoga with the guru of OKI yoga for 4 years in Japan. Her Yin Yoga practice is based on studies with Hiroshi Motoyama. A deeper connection with the body led her to study Buddhist Medicine in Kyushu, Japan where she was trained in Moxa treatment. Nature is already complete and inner balance is the key to unlocking the natural healing powers that reside in the body. Bali has influenced Malikas healing techniques as well as her holistic approach to treatments which meet individual needs.',
  is_admin: false,
  is_teacher: true,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://www.theyogabarn.com/images/bali-yoga-trachers/malika.jpg"
  )

puts 'Creating students...'
alina = User.create!(
  first_name: 'Alina',
  last_name: 'Heimgartner',
  email: 'alina.heimgartner@gmail.com',
  address: 'Hauptstrasse 10, 65182 Zurich',
  biography: 'I studied Hatha Yoga with the guru of OKI yoga for 4 years in Japan. My Yin Yoga practice is based on studies with Hiroshi Motoyama. A deeper connection with the body led her to study Buddhist Medicine in Kyushu, Japan where she was trained in Moxa treatment. Nature is already complete and inner balance is the key to unlocking the natural healing powers that reside in the body. Bali has influenced Malikas healing techniques as well as her holistic approach to treatments which meet individual needs.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url: "https://scontent.fjog1-1.fna.fbcdn.net/v/t1.0-9/1966776_10152438908341295_2419754696049711065_n.jpg?_nc_cat=101&_nc_ht=scontent.fjog1-1.fna&oh=c7ec4cf7432adf4066631c6f8af41597&oe=5D79E199"
  )

clara = User.create!(
  first_name: 'Clara',
  last_name: 'Edward',
  email: 'clara@edward.co.nz',
  address: '34 Hapua Street, Remuera, Auckland 1050',
  biography: 'Clara has been practicing yoga and meditation for 3 years. Her girlfriend introduced her to yoga and she has now both in her life as a continous companion.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url:'https://images.unsplash.com/photo-1549459685-701565fe9ff1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=950&q=80'
)

jessica = User.create!(
  first_name: 'Jessica',
  last_name: 'Gonzales',
  email: 'Jessy@claro.com.ar',
  address: 'Av. 401, Buenos Aires 1427',
  biography: 'Jessica loves yoga as she started as a littl girl with her mother who is a teacher in Buenos Aires.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url:'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'
)

paco = User.create!(
  first_name: 'Paco',
  last_name: 'Cavaletti',
  email: 'paco@liberomail.it',
  address: 'Piazzale Dino Viola, 1 - 00128 Roma',
  biography: 'Paco founded his own company and after many years of only work he found yoga as his spot of calmness. He took some time of and has been traveling different yoga spots in the world',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url:'https://images.unsplash.com/photo-1548898821-d756a2e30bdf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80'
)

maia = User.create!(
  first_name: 'Maia',
  last_name: 'Cavaletti',
  email: 'Maia@liberomail.it',
  address: 'Piazzale Dino Viola 1, 00128 Roma',
  biography: 'Maia was the one that introduced her husband Paco to yoga as he was working to much. Next to yoga she loves to cook at home with friends.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url:'https://images.unsplash.com/photo-1548536515-67545ff2ecc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80'
)

joerg = User.create!(
  first_name: 'Joerg',
  last_name: 'Hanson',
  email: 'Jörg@nordialaw.se',
  address: 'Regeringsgatan 59, 111 56 Stockholm',
  biography: 'During a long winter Jörg saw a tv documentary about India and was intrigued about learning more about yoga thus he decided to look into it. That was 4 years ago.',
  is_teacher: false,
  is_admin: false,
  password: '123456',
  studio_id: studio.id,
  remote_photo_url:'https://images.unsplash.com/photo-1548536515-67545ff2ecc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80'
)

puts 'Creating a lesson...'
l1 = Lesson.create!(
  name: 'Ashtanga',
  location: 'Room 1',
  content: 'YOGA IS REALLY A BREATHING EXERCISE IN WHICH WE USE THE BODY TO EXPAND THE MIND…
Ashtanga yoga is a spiritual practice and an inner journey to the self. The ashtanga method is based on the weaving of body and breath movements into a deepening flow of yoga poses. A dynamic practice, Ashtanga yoga will stretch every corner of your body and mind, inviting you to strengthen areas of challenge and inspire you to live with grace. Akin to a cooking process, the heat generated, the struggle endured and the peace cultivated bring together and reveal the flavour of your being.',
  slots: 20,
  start_time: "18:00",
  end_time: "19:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: carlos.id,
  studio_id: studio.id
  )

l2 = Lesson.create!(
  name: 'Mysore',
  location: 'Room 1',
  content: 'Named after the birthplace of the ashtanga system in Mysore, south India; This is the traditional method for learning, deepening and perfecting your Ashtanga practice. A private class in a group setting, the teacher doesn’t lead the whole group but holds the space for the practitioners, beginners and advanced together, to learn and refine each student’s personal  practice. As a beginner you will be taught one pose at a time in order to integrate the information gradually learning the sequence to develop your personalised yoga practice. You are invited to repeat over and over until a sense of flow and poise is attained. Eventually the teaching becomes more subtle allowing the practice itself to be your guide. You don’t need to be flexible or know the sequence in order to begin. The practice will teach you gradually.',
  slots: 20,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "14.06.2019",
  occurrence: 10,
  user_id: carlos.id,
  studio_id: studio.id
  )

l3 = Lesson.create!(
  name: 'Mysore beginner',
  location: 'Room 2',
  content: 'This a class where we introduce you to the Mysore practice and its tools. Beginners are required to commit to enough classes before they can participate in the Mysore classes, in order to get a better understanding of the practice and its sequence.  The idea is that you learn the standing sequence and can join the Mysore morning class, and become autonomous in practice.',
  slots: 10,
  start_time: "16:00",
  end_time: "17:00",
  start_date: "15.06.2019",
  occurrence: 5,
  user_id: anik.id,
  studio_id: studio.id
  )

l4 = Lesson.create!(
  name: 'Hatha Tantra',
  location: 'Room 2',
  content: 'Hatha Tantra embraces all the manifestations of life energy, the Shakti. A tool to reach higher states of consciousness. Hatha Tantra embraces life in all its manifestations; body, emotions, energy, sexuality, astrology, sounds (mantras), patterns (yantras). Hatha yoga is a body orientated practice originating from the tantric tradition.

The awareness you develop first on a body level is then extended to your heart, mind and spirit, allowing you to get rid of the unnecessary veils cloaking your true self. Hatha Tantra is a powerful framework for transformation and spiritual development if you are ready to acknowledge, study and experience your light and darkness.',
  slots: 10,
  start_time: "08:00",
  end_time: "09:00",
  start_date: "15.06.2019",
  occurrence: 5,
  user_id: daniela.id,
  studio_id: studio.id
  )


puts 'Creating a subscription..'
subs = Subscription.create!(
  name: '12 class pack',
  content: 'Yoga package for twelve yoga classes',
  package_size: 12,
  durability: 60,
  subscription_sku: '12-class-pack',
  studio_id: studio.id,
  amount_cents: 200_000_00,
  payment_option: "card"
  )

sub_cash = Subscription.create!(
  name: '1 class pack',
  content: 'Yoga package for a yoga classes',
  package_size: 1,
  durability: 30,
subscription_sku: '1-class-pack',
  studio_id: studio.id,
  amount_cents: 70_000_00,
  payment_option: "cash"
  )

sub_cash = Subscription.create!(
  name: '6 class pack',
  content: 'Yoga package for six yoga classes',
  package_size: 6,
  durability: 60,
subscription_sku: '6-class-pack',
  studio_id: studio.id,
  amount_cents: 100_000_00,
  payment_option: "card"
  )

sub_cash = Subscription.create!(
  name: '20 class pack',
  content: 'Yoga package for 20 yoga classes',
  package_size: 6,
  durability: 60,
subscription_sku: '20-class-pack',
  studio_id: studio.id,
  amount_cents: 100_000_00,
  payment_option: "card"
  )

puts 'Creating a order...'
p = Order.create!(
  subscription_id: subs.id,
  user_id: alina.id,
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
  user_id: alina.id
  )

puts 'Creating a booking...'
Booking.create!(
  user_plan_id: up.id,
  user_id: alina.id,
  lesson_id: l1.id,
  date: Date.today
  )

puts 'Creating a second booking...'
boo1 =Booking.new(
  user_plan_id: up.id,
  user_id: alina.id,
  lesson_id: l2.id,
  date: Date.today-5
  )
boo1.save

puts 'Creating a third booking...'
boo2 =Booking.new(
  user_plan_id: up.id,
  user_id: alina.id,
  lesson_id: l3.id,
  date: Date.today-3
  )
boo2.save


puts 'Creating an event...'
Event.create!(
  title: 'ECSTATIC DANCE & SOUND CIRCLE',
  content: 'Warm your body up with gentle free movement. Awaken your primal energy and release the old with Kundalini shaking. Let go and dance into ecstasy, experiencing yourself as pure energy. This ecstatic experience is supported by your breath, gentle guidance and rocking music.No previous dance experience required. This is a non judgmental space of free expression. Jacqueline Jai has been facilitating Ecstatic Awakening Dance since 2012 and did her Ecstatic Awakening Dance teacher training with the School of Ecstatic Movement. She has danced extensively with many brilliant movement facilitators and communities.',
  date: Date.today,
  studio_id: studio.id,
  remote_photo_url: "https://i2.wp.com/www.samadibali.com/wp-content/uploads/2019/04/EcstaticDance_IG_0419-01.jpg?w=800&ssl=1"
  )

Event.create!(
  title: 'SUNDAY MARKET',
  content: 'Come and meet our local Organic Farmers and Artisans. A happening vibrant local market, with music, laughter, good food and fresh produce. Samadi Sunday Market is about community, local organic farmers and artisans getting together who consciously choose to support each other. Our local farmers supply chemical free, healthy, and fresh produce every week. A community that says no to GMO and pesticides a commitment to one another.',
  date: "09/7/2019",
  studio_id: studio.id,
  remote_photo_url: "https://i1.wp.com/www.samadibali.com/wp-content/uploads/2018/06/20170507-3samadi-A6500-slog2-pro-01-2-1.jpg?w=1200&ssl=1"
  )

Event.create!(
  title: 'WOMEN’S CIRCLE',
  content: 'A self healing and self loving place for women to come together with Yoga, Breathwork, Yoni Love, Dance and much more to explore the body, mind and energy system. This is a place of play and sensuality as well as being a sacred vessel for healing and transformation.
Within each of us is the innate and natural ability to heal ourselves. As we access and surrender to our own inner power we learn to understand how energy moves in the body and how we can use it to unlock stored trauma and release what no longer serves us. In this space low vibrational energy can be transformed into a higher frequency where we experience pleasure, bliss and ecstasy.',
  date: "12/7/2019",
  studio_id: studio.id,
  remote_photo_url: "https://i1.wp.com/www.samadibali.com/wp-content/uploads/2019/04/IG-Womens-Circle.jpg?w=800&ssl=1"
  )

Event.create!(
  title: 'FREE MOVIE NIGHT',
  content: 'Ubud filmmaker Jason Moon introduces and screens two of his award-winning documentaries. Jason will lead a Q&A following the screening.

Troppoc (30 minutes) – Documentary Kim Webby tells her personal story of volunteering, as she heads to remote Sumatran islands and signs up to help Kiwi doctor Derek Allen,  60,000 islanders’ only medical lifeline.
Coming Home (30 minutes) – An autobiographical documentary about Jason Moon’s journey back to his ancestral village in China.
',
  date: "15/7/2019",
  studio_id: studio.id,
  remote_photo_url: "https://i1.wp.com/www.samadibali.com/wp-content/uploads/2019/05/jasonmoon-ig-1.jpg?w=2040&ssl=1"
  )

Event.create!(
  title: 'GONG BATH',
  content: 'Gong and Sound Healing has been proof as one of method can bring our mind into deep relaxation, yet grounding, energizing and harmonizing energy in our body, mind and spirit.

Abdi who is known as Energy Healer in Bali will entertain you with one part of his talent to play Gong,  pow wow drum, Semantic  Drum , Tibetan bowl   drive  your brain wave in to  theta frequency which bring your mind in to deep relaxation  create balance in your chakra the energy center in our body . As Energy healer he will reconnect you to pure Energy of Universe to clear, to ground, energize , harmonize,  create a peacefulness and blissfulness  of  our body energy , subtle energy
',
  date: "19/7/2019",
  studio_id: studio.id,
  remote_photo_url: "https://i2.wp.com/www.samadibali.com/wp-content/uploads/2019/05/soundbath.jpg?w=800&ssl=1"
  )

Event.create!(
  title: 'FULL MOON KIRTAN & BHAJANS',
  content: 'Join us for a heart opening evening of devotion honoring the sacred transformations of reawakening.
Kirtan is a form of devotional chanting whose roots go back to India over 500 years. It is a form of Bhakti Yoga (yoga of devotion) and has the power to open the heart. The singing is accompanied by musical instruments and rhythmic drumming while the audience is encouraged to participate by chanting, clapping and dancing. Explore kirtan and bhajans, connecting with the qualities of Indian deities.',
  date: "21/7/2019",
  studio_id: studio.id,
  remote_photo_url: "https://i2.wp.com/www.samadibali.com/wp-content/uploads/2019/05/IG-Full-Moon.jpg?w=851&ssl=1"
  )


puts 'Creating a note...'
Note.create!(
  user_id: alina.id,
  title: 'Its been a good day.',
  content: 'Practiced for 2 hours and had a great meditation session. Note to self: meditate every second day.',
  date: Date.today
  )

Note.create!(
  user_id: alina.id,
  title: 'Its been a hard day, I was sick for 3 days and feel a bit weak.',
  content: 'Practiced for 1 hour and had the final presentation in my mind.',
  date: Date.today - 2
  )

Note.create!(
  user_id: alina.id,
  title: 'What an amazing day, started with Navasana and almost got it',
  content: 'new pose so very excited and should remember to breath more deeply',
  date: Date.today - 5
  )

puts 'Creating the default studio-announcements-channel'
cat1 = Category.create!(
  user_id: anik.id,
  title: 'Studio News',
  description: 'All general studio announcements will be made via this channel so make sure to log in regularly 🧘🏻‍♀️🧘🏽‍♂️',
  studio_id: studio.id
  )

cat2 = Category.create!(
  user_id: anik.id,
  title: 'Mysore exchange',
  description: 'Exchange about mysore-techniques and a safe-space for questions',
  studio_id: studio.id
  )

cat2 = Category.create!(
  user_id: anik.id,
  title: 'Hatha Style',
  description: 'A softer approach to explore your inner landscape through yoga poses (Asanas), breathing exercises (Pranayama) and meditation.',
  studio_id: studio.id
  )

cat3 = Category.create!(
  user_id: anik.id,
  title: 'FLY HIGH YOGA',
  description: 'A form of aerial yoga which focuses on the lengthening the spine and creating space between the vertebrae. Relax the body into its natural form and curves allowing gravity do the work for you. In Fly High Yoga a student uses a belt securely attached to the ceiling to perform numerous sets of poses hanging from the belt, increasing flexibility and improving inversions.',
  studio_id: studio.id
  )

cat4 = Category.create!(
  user_id: anik.id,
  title: 'Book recommendations',
  description: '..',
  studio_id: studio.id
  )

cat5 = Category.create!(
  user_id: anik.id,
  title: 'Places to go',
  description: '..',
  studio_id: studio.id
  )

puts 'Creating a post...'
p = Post.create!(
  user_id: alina.id,
  category_id: cat2.id,
  title: 'My Mysore tips and tricks',
  content: 'MYSORE STYLE is a particular way of teaching yoga within the tradition of Ashtanga Yoga as taught by Sri K. Pattabhi Jois in Mysore, India. In this class everyone practices at their own pace, with assistance and adjustment from the teacher. The support is given to each student individually but within a group of people practicing together. Each student memorizes the sequence of asana (postures) to follow and new poses are progressively added to it when a student is ready. In Mysore style one begins learning slowly, respecting the limitations of the body and focusing on the breathing. The time of the class is the time it takes you to practice. Your first practice may only be about 30-45 min, while for someone more experienced it can take up to 1 h and 45 minutes. The entry to Mysore class is flexible, people start and finish at different times.'
  )

puts 'Creating a studio announcement'
Post.create!(
  user_id: anik.id,
  category_id: cat1.id,
  title: 'Hatha class 30mins later on Monday, 17.06.',
  content: 'Please remember that next weeks Hatha class will start 30 minutes later due to the extended meditation session. If you are able to come by the studio at 4pm already you are more than welcome to join the meditation lesson plus the regular Hatha class.
  In case of any questions, please comment 😊'
)


puts 'All done, YAY 🐣'
