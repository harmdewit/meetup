# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Admin wachtwoord = wachtwoord

meetings = Meeting.create ([{
	:id => 1,
	:title => 'Koekjes Bakken', 
	:description => 'Koekjes bakken is een eeuwenoude kunst. Na deze meeting zult u koekjes helemaal van binnen en buiten kennen. De avond word afgerond met een gastoptreden van Joop Braakhekke.'}, 
	{
	:id => 2,
	:title => 'Star Wars', 
	:description => 'War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku.  There are heroes on both sides.  Evil is everywhere. '
}])

users = User.create ([{
	:id => 1,
	:first_name => 'Harm', 
	:last_name => 'de Wit', 
	:email => 'harmdewit@gmail.com', 
	:linkedin_id => 'QaIpZE_mjh', 
	:linkedin_token => '6ca85409-27d3-410b-9a90-e6cef7176ae0', 
	:linkedin_secret => '86a65bce-b3ac-4b27-882c-dd0e55c61a53', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_EBP1Xaklx7wElN4nHt82XuX_gEO6PtHnHKbuXuv_C7o9u9096l_0E23SPXYJrvdswNlDIIbGt-9j', 
	:ticket => '2f928c4fcbacec6ef63da9627898d15e'}, 
	{
	:id => 2,
	:first_name => 'Bram', 
	:last_name => 'Jetten', 
	:email => 'bramjetten@gmail.com', 
	:linkedin_id => 'HmHKxBZcF3', 
	:linkedin_token => '1f00aede-231c-4443-af38-bb53e1d5b43a', 
	:linkedin_secret => '4d695a7a-7fb8-4b2b-9449-21203d3f43b7', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_oivHPaH73nSEBjT1H5cUPusr3POIUYr1eXTBPuIrOnoRkVFPQL5Xj2xOfjYq4MA0IhB9yIJlgv_D', 
	:ticket => 'ae2c593f27ced8f0d26f7a92bd8a31ed'},	
	{
	:id => 3,
	:first_name => 'Han', 
	:last_name => 'Solo', 
	:email => 'hdwtest1@gmail.com', 
	:linkedin_id => 'TAX1T9xGSW', 
	:linkedin_token => '255d29c0-5e53-4926-bfc4-14af42c642a4', 
	:linkedin_secret => '34af61a1-fd9f-413f-ae3e-8c6a50c9a055', 
	:ticket => '29b20466f4c87e28c427722c750e1b00', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_QoM0AdJeMBd4EkkjXHJhAwYvUAS9oCNjXeS8AE0vkqM6z6_go2W1xowUvxDdW5vAbdU3ODSARHwc'}
])

participants = Participant.create ([{
	:id => 1,
	:user_id => 1,
	:meeting_id => 1,
	:motivation => 'Harm zijn leven draait geheel om koekjes. Zonder koekjes zou hij zijn leven beëindigen.'},
	{
	:id => 2,
	:user_id => 1,
	:meeting_id => 2,
	:motivation => 'Harm heeft Star Wars net een maand gekeken. Hij is door zijn projectlid gedwongen om naar deze meeting te gaan'},
	{
	:id => 3,
	:user_id => 2,
	:meeting_id => 2,
	:motivation => 'Tja, ik ben gewoon een nerd'},
	{
	:id => 4,
	:user_id => 3,
	:meeting_id => 2,
	:motivation => 'I blast yall with my blastergun.'}
])

connections = Connection.create ([{
	:id => 1,
	:participant_id => 2,
	:connected_participant_id => 4,
	:status => 'Accepted'},
	{
	:id => 2,
	:participant_id => 4,
	:connected_participant_id => 2,
	:status => 'Accepted'},
	{
	:id => 3,
	:participant_id => 3,
	:connected_participant_id => 4,
	:status => 'Accepted'},
	{
	:id => 4,
	:participant_id => 4,
	:connected_participant_id => 3,
	:status => 'Accepted'}
])




