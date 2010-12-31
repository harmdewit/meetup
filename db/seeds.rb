# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Admin wachtwoord = wachtwoord
admins = Admin.create([{
	:id => 1,
	:email => 'harmdewit@gmail.com', 
	:encrypted_password => 'c32e0301d3dbdacfd8f26260e8706e5db9b05590', 
	:password_salt => 'hrx-EKOpo5veVlxpdYFI'}, 
	{
	:id => 2,
	:email => 'bramjetten@gmail.com', 
	:encrypted_password => 'c32e0301d3dbdacfd8f26260e8706e5db9b05590', 
	:password_salt => 'hrx-EKOpo5veVlxpdYFI'}, 
	{
	:id => 3,
	:email => 'meximusz@gmail.com', 
	:encrypted_password => 'c32e0301d3dbdacfd8f26260e8706e5db9b05590', 
	:password_salt => 'hrx-EKOpo5veVlxpdYFI'}
])

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
	:first_name => 'George', 
	:last_name => 'Michael', 
	:email => 'harmdewit@live.nl', 
	:linkedin_id => 'fB7pRihQUe', 
	:linkedin_token => '069b398c-de99-4ea3-accc-8308d7b399e9', 
	:linkedin_secret => 'a6ba07ed-f254-4ee8-bf59-aa76283044fb', 
	:ticket => '29b20466f4c87e28c427722c750e1b05', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_UQF0Z_VfOhpaUz43U3b8ZhyjO8UGRn43JT18Zhsj357-X-fTc8c198a1raRjZlJDs5L3BbkZRFrR'}, 
	{
	:id => 3,
	:first_name => 'Bram', 
	:last_name => 'Jetten', 
	:email => 'bramjetten@gmail.com', 
	:linkedin_id => '5BcBOuHFvP', 
	:linkedin_token => '320f3b3d-3f18-4819-9f24-e0a6d1057969', 
	:linkedin_secret => 'bed4d659-3874-434a-899c-2fb9366964ea', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_oivHPaH73nSEBjT1H5cUPusr3POIUYr1eXTBPuIrOnoRkVFPQL5Xj2xOfjYq4MA0IhB9yIJlgv_D', 
	:ticket => '3a165656b747ddc2cfdb64d90977b0f2'}
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
	:motivation => 'Ik ben een groot fan van Luke Skywalker.'},
	{
	:id => 4,
	:user_id => 3,
	:meeting_id => 2,
	:motivation => 'Tja, ik ben gewoon een nerd'}
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




