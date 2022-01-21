FactoryBot.define do
  factory(:cat) do
    name {Faker::JapaneseMedia::Naruto.character}
    species {'cat'}
    age {Faker::Number.between(from: 1, to: 18)}
  end
  factory(:dog) do
    name {Faker::JapaneseMedia::DragonBall.character}
    species {'dog'}
    age {Faker::Number.between(from: 1, to: 15)}
  end
end