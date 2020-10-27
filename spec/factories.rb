FactoryBot.define do
  factory(:message) do
    author {Faker::FunnyName.three_word_name}
    content {Faker::TvShows::MichaelScott.quote}

    group
  end


  factory(:group) do
    name {Faker::Games::Fallout.character}

    factory :group_with_messages do

      transient do
        messages_count { 5 }
      end

      after(:create) do |group, evaluator|
        create_list(:message, evaluator.messages_count, group: group)
      end
    end
  end  
end