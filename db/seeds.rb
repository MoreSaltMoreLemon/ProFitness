User.destroy_all
History.destroy_all
Profile.destroy_all
Workout.destroy_all
WorkoutSet.destroy_all
Category.destroy_all

exercises = {"chest" => ["bench press", "dumbell fly", "incline press"],
              "legs" => ["deadlift", "squat", "leg extension"],
              "arms" => ["preacher curl", "skullcrusher", "tricep extension"],
              "shoulders" => ["shoulder press", "barbell push-press", "arnold press"],
              "back" => ["row", "barbell deadlift", "wide-grip pull-up"],
              "core" => ["sit up", "plank", "crunch"]}
  exercises.each_pair do |name, exercises|
    category = Category.create(name: name)
    exercises.each do |exercise_name|
      category.exercises.build(name: exercise_name,
                             description: Faker::Lorem.sentence(10),
                             instruction: Faker::Lorem.sentence(10),
                             hero_image: Faker::LoremFlickr.image("50x60", ['sports', 'fitness'], true)).save
    end
  end



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

  10.times do
    workout = user.workouts.build(date: Faker::Date.forward(2))
    workout.save
    10.times do
      sets = workout.workout_sets.build(exercise: Exercise.all.sample,
                                        reps: Faker::Number.between(3, 12),
                                        weight: Faker::Number.between(10, 100))
      sets.save
    end
  end
end
