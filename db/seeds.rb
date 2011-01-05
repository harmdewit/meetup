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
	:first_name => 'George', 
	:last_name => 'Michael', 
	:email => 'hdwtest1@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b01', 
	:linkedin_id => 'yAJxQ_GY4n', 
	:linkedin_token => '4a976e66-7f58-41b5-8df4-6d8ef4fc6c55', 
	:linkedin_secret => 'f294f51d-3e2b-4466-a4fd-dc5983ec2f48', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_utI7LyX29uceyixqaz4yLO5jq7rEYQxqav0rL0XjIEXsTGeNhNR_wxK1V3KvjTY4SldloZnupKEL'},
	{
	:id => 4,
	:first_name => 'Han', 
	:last_name => 'Solo', 
	:email => 'hdwtest2@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b02', 
	:linkedin_id => 'XNC2wEOvBs', 
	:linkedin_token => 'd1e8ae7f-9baf-4970-8ede-328e81843687', 
	:linkedin_secret => '02e21dc9-51e6-4a9b-a7ff-78c1ca892acf', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_oLg_hd4PcpwocFtJeCmKhws3B4aFc3iJebWphER3ejVcH5qMQiS7mo7fMnm4N6GzI6xgfDW-9184'
},
	{
	:id => 5,
	:first_name => 'Justin', 
	:last_name => 'Bieber', 
	:email => 'hdwtest3@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b03', 
	:linkedin_id => '8vl2DptyTK', 
	:linkedin_token => '6e5bf308-fb93-48dd-ae91-3eeb19c90f95', 
	:linkedin_secret => '40b3c509-ebc0-4e0b-9199-26ec238ca10d', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_I3FrdoM2gu0wZ9HHWiqideHjxWoWZ9WHWh17dWWj8uOMbtYebFcpbdj1lFEnRAeXoGLa6aUxpmSz'},
	{
	:id => 6,
	:first_name => 'Ace', 
	:last_name => 'Ventura', 
	:email => 'hdwtest4@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b04', 
	:linkedin_id => 'sBdOsWsNTg', 
	:linkedin_token => '4f24e507-6ff2-46fe-819e-f7c6e6d5473e', 
	:linkedin_secret => '37346d16-ab3c-4b4c-9b7a-a69c4e6c06c1', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_9Nf_3Qlu9UogKitUNnpK3Xr2qZ2A-LiUNvRp3Ll2Ig43DTqRst0775LGV9ualGGBcBDgaC7L3b3N'},
	{
	:id => 7,
	:first_name => 'Ali', 
	:last_name => 'G.', 
	:email => 'hdwtest5@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b05', 
	:linkedin_id => '4qGbcfqOzM', 
	:linkedin_token => '9b781ef4-c7f6-4d9c-8e02-b81e6f87068f', 
	:linkedin_secret => '7fb4b5f2-2693-4611-9235-647bf655b8f9', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_ZgfI5GksLHVu3WpzVpp458XWL2Y7_WgzVsRN5T5WVdExyDEvqU0FI3AbICOKhmyJMYDzE6Uve-4Z'},
	{
	:id => 8,
	:first_name => 'King', 
	:last_name => 'Leonidas', 
	:email => 'hdwtest6@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b06', 
	:linkedin_id => 'BZwoGG8IyU', 
	:linkedin_token => '6d8aa421-e6ff-48d3-aa27-f884b5c9c1fa', 
	:linkedin_secret => 'dde8100f-6ece-443d-ae67-802a60bf3853', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_CHQ4YJmEm93ZwsbDhWvIYsx4m1FzdJ9DhftbYUO4l91L9g3SaanqrRE98gboEOc3_Ik6lp8BjPC_'},
	{
	:id => 9,
	:first_name => 'Carlton', 
	:last_name => 'Banks', 
	:email => 'hdwtest7@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b07', 
	:linkedin_id => 'SilZlwknRG', 
	:linkedin_token => 'c472ce2a-3f71-4649-9576-9f509ee886d7', 
	:linkedin_secret => 'a8a53225-80bd-4e84-a5b5-0922f6dd7dce', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_V5_s-LHymrUlV4Xy4bKW-bs72Ka394qyZFBL-QR71vVAdyipn_Pny67TGOmOv0zKRQTkj35lxSix'},
	{
	:id => 10,
	:first_name => 'Samwise', 
	:last_name => 'Bamgee', 
	:email => 'hdwtest8@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b08', 
	:linkedin_id => 'YXodl7k8-7', 
	:linkedin_token => '27684ac7-6dbb-4d90-82b4-385ebc1e7fd2', 
	:linkedin_secret => '603ce0eb-24a3-48f8-87f1-0ccb87dd05de', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_QoM0AdJLMzH66CNjkwE2AwYvUAS9oCNjXDS8AE0vkqM6z6_go2W1xowUvxDdW5vAbdU3ODD6snMc'},
	{
	:id => 11,
	:first_name => 'The', 
	:last_name => 'Dude', 
	:email => 'hdwtest9@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b09', 
	:linkedin_id => 'H3_g-b31R7', 
	:linkedin_token => '06133801-e499-4eef-be61-3717fb3e0a87', 
	:linkedin_secret => '3013335a-4a2f-4d66-a446-25ec1581b6a9', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_8LXTPsu3t1nJR-rxCkctP40yKv_nUBhxGbrOPJYy7KBQk1c02iqSjMotYRiW4K3PT66xyY2Sz65q'},
	{
	:id => 12,
	:first_name => 'Hulk', 
	:last_name => 'Hogan', 
	:email => 'hdwtest10@gmail.com', 
	:ticket => '29b20466f4c87e28c427722c750e1b10', 
	:linkedin_id => 'oXD2XZBBjG', 
	:linkedin_token => '778295f1-0f8d-44d4-a4f4-6004e81b3b9c', 
	:linkedin_secret => '9d0502b8-fda3-4d1b-9f5e-239b7ecb4a7c', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_2AaKEsQ1ZePFtTeHCzj_E4buVw6w-beHmPVfEJ6uLm-UDixe8cOyXMtCqLQNl8WXD-2m5YN088Vq'}
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
	:motivation => 'Ik ben een groot fan van Luke Skywalker.'},
	{
	:id => 5,
	:user_id => 4,
	:meeting_id => 2,
	:motivation => 'I blast yall with my blastergun.'},
	{
	:id => 6,
	:user_id => 5,
	:meeting_id => 2,
	:motivation => 'Baby, baby, baby. . ooh Right.'},
	{
	:id => 7,
	:user_id => 6,
	:meeting_id => 2,
	:motivation => 'Ik zoek iemand om mijn kapsel te doen.'},
	{
	:id => 8,
	:user_id => 7,
	:meeting_id => 2,
	:motivation => 'I looking for some women, Aaaight!'},
	{
	:id => 9,
	:user_id => 8,
	:meeting_id => 2,
	:motivation => 'SPAAAAARTAAAAAAAAAA !!!11one!!eleven!11'},
	{
	:id => 10,
	:user_id => 9,
	:meeting_id => 2,
	:motivation => 'I wanna show some dance moves.'},
	{
	:id => 11,
	:user_id => 10,
	:meeting_id => 2,
	:motivation => 'Ik zoek Frodo.'},
	{
	:id => 11,
	:user_id => 10,
	:meeting_id => 2,
	:motivation => 'Ik heb geen flauw idee waarom ik eigenlijk ga.'},
	{
	:id => 12,
	:user_id => 11,
	:meeting_id => 2,
	:motivation => 'I break you!'}

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




