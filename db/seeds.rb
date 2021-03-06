# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    Group.destroy_all
    seed = Seed.new
    seed.generate_groups
  end

  def generate_groups
    20.times do |i|
      group = Group.create!(
        name: Faker::Games::Fallout.character
      )
      5.times do |i|
        message = group.messages.create!(
          author: Faker::FunnyName.three_word_name,
          content: Faker::TvShows::MichaelScott.quote,
        )
      end
      puts "group #{i}: name is #{group.name} it has '#{group.messages.length}' messages."
    end
  end

  # def generate_messages
  #   5.times do |i|
  #     message = Message.create!(
  #       author: Faker::FunnyName.three_word_name,
  #       content: Faker::TvShows::MichaelScott.quote
  #     )
      
  #     puts "Message #{i}: Author is #{message.author} and quotation is '#{message.content}'."
  #   end
  # end
end

Seed.begin