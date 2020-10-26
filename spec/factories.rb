FactoryBot.define do
  factory(:message) do
    author {Faker::FunnyName.three_word_name}
    content {Faker::TvShows::MichaelScott.quote}
    # date {"today"}
  end

end