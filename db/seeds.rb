User.destroy_all
History.destroy_all
Profile.destroy_all
Workout.destroy_all
Exercise.destroy_all
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
      # byebug
    exercise = category.exercises.build(name: exercise_name, description: Faker::Lorem.sentence(10), instruction: Faker::Lorem.sentence(10), hero_image: "exercises/#{exercise_name.split(" ").join("-")}")
    exercise.save
    end
  end



10.times do
  user_name = Faker::FunnyName.two_word_name
  pwd = Faker::Internet.unique.password
  user = User.create( username: Faker::Internet.unique.username(user_name),
                      email: Faker::Internet.unique.email(user_name),
                      actual_password: pwd,
                      password: pwd)
  profile = user.build_profile( name: user_name,
                                height: Faker::Number.between(1, 2.5),
                                starting_weight: Faker::Number.between(60, 120),
                                avatar_image: "no image",
                                age: Faker::Number.between(18, 75),
                                metric: Faker::Boolean.boolean)
  profile.save


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

  # 10.times do
  #   history = user.histories.build(weight: Faker::Number.between(60, 120),
  #                      date: Faker::Date.forward(2))
  #   history.save

  # end
