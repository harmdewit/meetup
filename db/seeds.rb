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
	:description => 'War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku. There are heroes on both sides. Evil is everywhere.'
}])

users = User.create ([
	{
		:id => 1,
		:first_name => 'Harm', 
		:last_name => 'de Wit', 
		:email => 'harmdewit@gmail.com', 
		:linkedin_id => 'QaIpZE_mjh', 
		:linkedin_token => '6ca85409-27d3-410b-9a90-e6cef7176ae0', 
		:linkedin_secret => '86a65bce-b3ac-4b27-882c-dd0e55c61a53', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_EBP1Xaklx7wElN4nHt82XuX_gEO6PtHnHKbuXuv_C7o9u9096l_0E23SPXYJrvdswNlDIIbGt-9j', 
		:ticket => '2f928c4fcbacec6ef63da9627898d15e'
	}, 	{
		:id => 2,
		:first_name => 'Bram', 
		:last_name => 'Jetten', 
		:email => 'bramjetten@gmail.com', 
		:linkedin_id => 'HmHKxBZcF3', 
		:linkedin_token => '1f00aede-231c-4443-af38-bb53e1d5b43a', 
		:linkedin_secret => '4d695a7a-7fb8-4b2b-9449-21203d3f43b7', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_oivHPaH73nSEBjT1H5cUPusr3POIUYr1eXTBPuIrOnoRkVFPQL5Xj2xOfjYq4MA0IhB9yIJlgv_D', 
		:ticket => 'ae2c593f27ced8f0d26f7a92bd8a31ed'
	},	{
		:id => 3,
		:first_name => 'George', 
		:last_name => 'Michael', 
		:email => 'hdwtest1@gmail.com', 
		:ticket => '29b20466f4c87e28c427722c750e1b01', 
		:linkedin_id => 'yAJxQ_GY4n', 
		:linkedin_token => '4a976e66-7f58-41b5-8df4-6d8ef4fc6c55', 
		:linkedin_secret => 'f294f51d-3e2b-4466-a4fd-dc5983ec2f48', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_utI7LyX29uceyixqaz4yLO5jq7rEYQxqav0rL0XjIEXsTGeNhNR_wxK1V3KvjTY4SldloZnupKEL'
	},	{
		:id => 4,
		:first_name => 'Martijn', 
		:last_name => 'de Boer', 
		:email => 'ikjdoudart@gmail.com', 
		:ticket => '29b20466f4c87e28c427722c750e1b02', 
		:linkedin_id => '1H8Ewsdmkx', 
		:linkedin_token => '83cec4aa-f9e6-4928-9c70-b73617e3855e', 
		:linkedin_secret => 'adc0193b-3cef-4eff-b008-30af88695460', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_fxkuMxcXPTGLuraif4q0MpNJPhNE29OiSjK1MjkJuL8s1td__MN8cgrcgmqv7A0fayQtnss9-CTd'
	}, {
		:id => 5,
		:first_name => 'Gere', 
		:last_name => 'Gerrits', 
		:email => 'ikjdoudartmac@gmail.com', 
		:ticket => '29b20466f4c87e28c427722c750e1b03', 
		:linkedin_id => 'drxsEy0eMb', 
		:linkedin_token => '5573594f-3d5b-490c-b6e8-72ca65ae7c82', 
		:linkedin_secret => 'e2dafbe3-d4e5-425e-8425-0f1328773647', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0__gnH4ZAFm_1nf0gu_M6U4VrqCikUf0pu3sCB4Rhqg6KwrUI2fUQXnUNVuSXku4j8CYN9cyts_7EX'
	}, {
		:id => 6,
		:first_name => 'Ilona', 
		:last_name => 'Doudart de la Gree', 
		:email => 'mevrouwpollewop@gmail.com', 
		:ticket => '29b20466f4c87e28c427722c750e1b04', 
		:linkedin_id => '9csNVeHuF8', 
		:linkedin_token => 'a7c755fd-dc49-43a5-a194-fb4428f863ea', 
		:linkedin_secret => 'b955f406-c81a-4f35-9a51-0f73b1ae2ae5', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_cDHk-hjebPW7eerrcdZc-CxsFnxxHITrv7pR-_7s4Pw7c7nKUI4eyiRNd408w28p9aosjXlejgZe'
	}, {
		:id => 7,
		:first_name => 'Carlton', 
		:last_name => 'Banks', 
		:email => 'mevrouwpollewop@hotmail.com', 
		:ticket => '29b20466f4c87e28c427722c750e1b05', 
		:linkedin_id => '2IGan8AhRO', 
		:linkedin_token => 'd4e18563-ecbb-4e59-b931-6416493343d4', 
		:linkedin_secret => '19bdfa09-95ae-48c2-ae84-866ec1fc2ca8', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_UciCehcPtWxaK1pbU1PAeC62tEVG-zSbJrcje_92S7a-DlsFcA1m6iCGyXsjl-uwsq3ybXH_wwQL'
	}, {
		:id => 8,
		:first_name => 'Justin', 
		:last_name => 'Bieber', 
		:email => 'wildcherry@live.nl', 
		:ticket => '29b20466f4c87e28c427722c750e1b06', 
		:linkedin_id => 'WqYZjCLtkn', 
		:linkedin_token => 'a7059012-dd07-49fd-a084-234b4d16552c', 
		:linkedin_secret => '1a319933-526c-40a1-bdee-8308846a2db2', 
		:picture_url => 'http://media.linkedin.com/mpr/mprx/0_UciCehK0K2Sfr1SbUKPAeC62tEVG-zSbJ9cje_92S7a-DlsFcA1m6iCGyXsjl-uwsq3ybXHGojzL'
	}

])

participants = Participant.create ([
	{
		:id => 1,
		:user_id => 1,
		:meeting_id => 1,
		:motivation => 'Harm zijn leven draait geheel om koekjes. Zonder koekjes zou hij zijn leven beeindigen.'
	},	{
		:id => 2,
		:user_id => 1,
		:meeting_id => 2,
		:motivation => 'Ik specialiseer mezelf in de programmeertaal Ruby On Rails. Op deze avond zoek ik naar personen om mijn kennis te delen'
	}, {
		:id => 3,
		:user_id => 2,
		:meeting_id => 2,
		:motivation => 'Ik heb een web solution om de meetings van LaRed in beter banen te leiden.'
	},	{
		:id => 4,
		:user_id => 3,
		:meeting_id => 2,
		:motivation => 'Na jaren bij NASA te hebben gewerkt zoek ik nu andere bedrijfsvlakken om mijn kennis toe te passen.'
	},	{
		:id => 5,
		:user_id => 4,
		:meeting_id => 2,
		:motivation => 'Met mijn kennis van planning en organisatie biedt ik mijn diensten aan als consultant bij midden- en klein bedrijf.'
	},	{
		:id => 6,
		:user_id => 5,
		:meeting_id => 2,
		:motivation => 'Ik heb een fantastisch concept om de apotheek naar de mensen te brengen via een website. Hiervoor heb ik nog een goede programmeur nodig.'
	},	{
		:id => 7,
		:user_id => 6,
		:meeting_id => 2,
		:motivation => 'Het onderwerp van de presentatie interesseert mij, Ik ben een groot fan van Luke Skywalker.'
	},	{
		:id => 8,
		:user_id => 7,
		:meeting_id => 2,
		:motivation => 'Dit is de eerste keer dat ik naar een bijeenkomst ga. Deze eerste keer kom ik om eens rond te kijken om te zien wat er allemaal te doen is.'
	},	{
		:id => 9,
		:user_id => 8,
		:meeting_id => 2,
		:motivation => 'Op deze avond hoop ik een paar vakgenoten in de gezondheidszorg. Ik zou graag meer willen weten over de kostenbesparing bij de thuiszorg.'
	}
])

connections = Connection.create ([
	{
		:id => 5,
		:participant_id => 9,
		:connected_participant_id => 6,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 6,
		:connected_participant_id => 9,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 6,
		:connected_participant_id => 2,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 6,
		:connected_participant_id => 3,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 2,
		:connected_participant_id => 3,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 3,
		:connected_participant_id => 2,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 3,
		:connected_participant_id => 6,
		:status => 'Accepted'
	},	{
		:id => 5,
		:participant_id => 2,
		:connected_participant_id => 6,
		:status => 'Accepted'
	}
	
	
])




