User.destroy_all
History.destroy_all
Profile.destroy_all
Workout.destroy_all
WorkoutSet.destroy_all
Category.destroy_all

10.times do
  user_name = Faker::FunnyName.two_word_name
  user = User.create( username: Faker::Internet.unique.username(user_name),
                      email: Faker::Internet.unique.email(user_name),
                      password: Faker::Internet.unique.password)
  profile = user.build_profile( sex: Faker::Gender.type,
                      height: Faker::Number.between(1, 2.5),
                      name: user_name,
                      avatar_image: Faker::LoremFlickr.image("50x60", ['sports', 'fitness'], true),
                      birthdate: Faker::Date.birthday(18, 65),
                      metric: Faker::Boolean.boolean)
  profile.save
  10.times do
    history = user.histories.build(weight: Faker::Number.between(60, 120),
                       date: Faker::Date.forward(2))
    history.save
  end
end


  