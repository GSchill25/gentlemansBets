namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'populator'
    require 'faker'
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke

    Member.populate 10 do |member|
      member.first_name = Faker::Name.first_name
      member.last_name = Faker::Name.last_name
      member.date_of_birth = (12..100).to_a.sample.years.ago.to_date
      member.number_of_bets = 0..10
      member.bets_won = 0
      member.active = true
      User.populate 1 do |user|
        user.member_id = member.id
        user.username = Populator.words(1)
        #user.password = "secret"
        #user.password_confirmation = "secret"
        user.role = ['admin', 'member']
        user.active = true
      end
      Bet.populate member.number_of_bets do |bet|
        bet.member_id = member.id
        bet.name = Populator.sentences(1)
        bet.description = Populator.paragraphs(1)
        bet.winner = ""
        bet.member_one_confidence = 1..10
        bet.member_two_confidence = 1..10
        bet.challengee = Faker::Name.name
        bet.challengee_id = 1..10
        bet.accepted = true
        bet.active = true
      end
    end

  end

end