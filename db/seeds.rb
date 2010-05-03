# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:name => "Dave")
User.create(:name => "Some_Random_Person")
User.create(:name => "Dan")

Stat.create(:GU => 20, :SA_Long => 5, :SA_Short => 5, :Macs => 0, :Scanners => 1, :LL => 5, :Video => 2, :User => "Dave", :Comment => "Slow Day?", :Slot => "2010-02-08 18:30:00", :created_at => "2010-02-08 18:12:20", :updated_at => "2010-02-08 18:12:20")
Stat.create(:GU => 30, :SA_Long => 55, :SA_Short => 25, :Macs => 17, :Scanners => 2, :LL => 10, :Video => 6, :User => "Dave", :Comment => "Got busy", :Slot => "2010-02-08 19:00:00", :created_at => "2010-02-08 19:12:20", :updated_at => "2010-02-08 19:12:20")