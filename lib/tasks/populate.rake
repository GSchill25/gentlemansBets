namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'faker'
    require 'factory_girl_rails'
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke

    graham = Member.new
    graham.first_name = "Graham"
    graham.last_name = "Shilling"
    graham.date_of_birth = 20.years.ago.to_date
    graham.number_of_bets = 3
    graham.bets_won = 2
    graham.active = true
    graham.save!
    graham_user = User.new
    graham_user.username = "graham"
    graham_user.member_id = graham.id
    #graham_user.password = "password"
    #graham_user.password_confirmation = "password"
    graham_user.role = "admin"
    graham_user.save!

    mike = Member.new
    mike.first_name = "Mike"
    mike.last_name = "Edward"
    mike.date_of_birth = 25.years.ago.to_date
    mike.number_of_bets = 3
    mike.bets_won = 1
    mike.active = true
    mike.save!
    mike_user = User.new
    mike_user.username = "mike"
    mike_user.member_id = mike.id
    #mike_user.password = "password"
    #mike_user.password_confirmation = "password"
    mike_user.role = "member"
    mike_user.save!

    juli = Member.new
    juli.first_name = "Juli"
    juli.last_name = "Ann"
    juli.date_of_birth = 26.years.ago.to_date
    juli.number_of_bets = 2
    juli.bets_won = 1
    juli.active = true
    juli.save!
    juli_user = User.new
    juli_user.username = "juli"
    juli_user.member_id = juli.id
    #juli_user.password = "password"
    #juli_user.password_confirmation = "password"
    juli_user.role = "member"
    juli_user.save!

    hope = Member.new
    hope.first_name = "Hope"
    hope.last_name = "Johnson"
    hope.date_of_birth = 42.years.ago.to_date
    hope.number_of_bets = 3
    hope.bets_won = 1
    hope.active = true
    hope.save!
    hope_user = User.new
    hope_user.username = "hope"
    hope_user.member_id = hope.id
    #hope_user.password = "password"
    #hope_user.password_confirmation = "password"
    hope_user.role = "member"
    hope_user.save!

    dennis = Member.new
    dennis.first_name = "Dennis"
    dennis.last_name = "Joseph"
    dennis.date_of_birth = 45.years.ago.to_date
    dennis.number_of_bets = 2
    dennis.bets_won = 1
    dennis.active = true
    dennis.save!
    dennis_user = User.new
    dennis_user.username = "dennis"
    dennis_user.member_id = dennis.id
    #dennis_user.password = "password"
    #dennis_user.password_confirmation = "password"
    dennis_user.role = "member"
    dennis_user.save!

    bet1 = Bet.new
    bet1.name = "Super Bowl Champs"
    bet1.description = "The Denver Broncos will win the Super Bowl this year. There is no way they can come up short with Peyton Manning healthy and leading this offense!"
    bet1.winner = mike.proper_name
    bet1.member_id = graham.id
    bet1.member_one_confidence = 5
    bet1.member_two_confidence = 7
    bet1.challengee = mike.proper_name
    bet1.challengee_id = mike.id
    bet1.accepted = true
    bet1.active = true
    bet1.save!

    bet2 = Bet.new
    bet2.name = "Starting a Fire"
    bet2.description = "Graham can't start a fire in less than 5 minutes, he has no outdoor skills and the wood he is using is soaking wet."
    bet2.winner = graham.proper_name
    bet2.member_id = mike.id
    bet2.member_one_confidence = 9
    bet2.member_two_confidence = 6
    bet2.challengee = graham.proper_name
    bet2.challengee_id = graham.id
    bet2.accepted = true
    bet2.active = true
    bet2.save!

    bet3 = Bet.new
    bet3.name = "Faster Mile Run"
    bet3.description = "I can run a mile in a faster time than michael. He's kinda slow and out of shape, plus I'm built for distance..."
    bet3.winner = graham.proper_name
    bet3.member_id = graham.id
    bet3.member_one_confidence = 5
    bet3.member_two_confidence = 10
    bet3.challengee = mike.proper_name
    bet3.challengee_id = mike.id
    bet3.accepted = true
    bet3.active = true
    bet3.save!

    bet4 = Bet.new
    bet4.name = "Higher Score in 2048"
    bet4.description = "2048 is my game... I've gotten the 2048 tile numerous times and I even got a 4096 tile once. If hope thinks she can beat me, she is off her rocker!"
    bet4.winner = juli.proper_name
    bet4.member_id = juli.id
    bet4.member_one_confidence = 8
    bet4.member_two_confidence = 3
    bet4.challengee = hope.proper_name
    bet4.challengee_id = hope.id
    bet4.accepted = true
    bet4.active = true
    bet4.save!

    bet5 = Bet.new
    bet5.name = "Movie Name"
    bet5.description = "Dennis cannot ever remember the names of movies. I think the popular batman movie is called 'The Dark Knight' but he thinks its called 'The Night of Darkness'. I know I'm right about this one."
    bet5.winner = hope.proper_name
    bet5.member_id = hope.id
    bet5.member_one_confidence = 9
    bet5.member_two_confidence = 4
    bet5.challengee = dennis.proper_name
    bet5.challengee_id = dennis.id
    bet5.accepted = true
    bet5.active = true
    bet5.save!

    bet6 = Bet.new
    bet6.name = "Johnny Maziel: Draft"
    bet6.description = "The NFL Draft is my area of expertise. Hope thinks Johnny Football will go to Texans, but I'm pretty certain my Browns will be drafting him."
    bet6.winner = dennis.proper_name
    bet6.member_id = dennis.id
    bet6.member_one_confidence = 6
    bet6.member_two_confidence = 3
    bet6.challengee = hope.proper_name
    bet6.challengee_id = hope.id
    bet6.accepted = true
    bet6.active = true
    bet6.save!

    bet7 = Bet.new
    bet7.name = "Google Glass vs Apple Watch"
    bet7.description = "This bet is simple... I think Google Glass will sell more units in the first year after its release than the Apple Watch. Both great companies but we will see..."
    bet7.member_id = juli.id
    bet7.member_one_confidence = 5
    bet7.challengee = graham.proper_name
    bet7.challengee_id = graham.id
    bet7.accepted = false
    bet7.active = true
    bet7.save!



  end

end