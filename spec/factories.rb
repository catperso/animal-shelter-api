FactoryBot.define do
  factory(:animal) do
    name {Faker::JapaneseMedia::Naruto.character}
    species {'cat'}
    age {Faker::Number.between(from: 1, to: 18)}
  end
end