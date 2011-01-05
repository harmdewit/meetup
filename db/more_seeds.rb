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
=begin, 
	{
	:id => 4,
	:first_name => 'George', 
	:last_name => 'Michael', 
	:email => 'hdwtest2@gmail.com', 
	:linkedin_id => 'oZskpbjghU', 
	:linkedin_token => 'a2fdfa57-860b-4eeb-8a98-71156e62fa2b', 
	:linkedin_secret => 'db0b89a3-ee8e-416b-a202-cdcbdb5582dd', 
	:ticket => '29b20466f4c87e28c427722c750e1b01', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_M3jGd3eO9Ej2q8pXR8gjd_w3NWsSN82XR_dgdCo3wumgwXRkzFDabGYfsFVtcbDHZG0p6LN0CGd8'},
	{
	:id => 5,
	:first_name => 'King', 
	:last_name => 'Leonidas', 
	:email => 'hdwtest3@gmail.com', 
	:linkedin_id => '8iRXM5YIaF', 
	:linkedin_token => 'aa117a66-4116-476d-888f-98563d55966d', 
	:linkedin_secret => 'fde64680-0298-497a-b40f-4f813ed47a7e', 
	:ticket => '29b20466f4c87e28c427722c750e1b02', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_IcAN_o-payWXt09Md1lw_eq3mV75tybMWrLI_Wv3l0UvS4KJbA3ZDd3f8NfsAUQvoq1EuabvRfrx'},
	{
	:id => 6,
	:first_name => 'Ace', 
	:last_name => 'Ventura', 
	:email => 'hdwtest4@gmail.com', 
	:linkedin_id => 'cV-5e8HcgK', 
	:linkedin_token => '6ff90cfa-30d9-4f49-b168-4c54925369d3', 
	:linkedin_secret => 'a5bd29b4-fe4d-469a-9c33-ee560e80a7c4', 
	:ticket => '29b20466f4c87e28c427722c750e1b03', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_SEVdfjZE5JLwWD-X7es9fYRBbp9XIm-XfHanfxsBZJGqqoLk3uoLT0aMWtnReW1HuW4ch4XkTJTF'},
	{
	:id => 7,
	:first_name => 'Samwise', 
	:last_name => 'Bamgee', 
	:email => 'hdwtest5@gmail.com', 
	:linkedin_id => 'xV9XQnjHMu', 
	:linkedin_token => '551f7bd8-a020-4b19-890c-3912498a47d2', 
	:linkedin_secret => '907071eb-1b13-4d7a-b125-509f821b1997', 
	:ticket => '29b20466f4c87e28c427722c750e1b04', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_U-uG0h8AqKuuA8rGzv2j0C6aNvVm1LhGJzZg0_bawKaY2TcCcqyali1hsRslKG3asAmprXvi7jpj'},
	{
	:id => 8,
	:first_name => 'Ali', 
	:last_name => 'G', 
	:email => 'hdwtest6@gmail.com', 
	:linkedin_id => '3MMZJzDur6', 
	:linkedin_token => 'f24727cd-e8d8-429c-861c-cff786d8daea', 
	:linkedin_secret => '83310316-5fbf-4f12-b01c-e04adc3860e8', 
	:ticket => '29b20466f4c87e28c427722c750e1b05', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_izp7YxCpBrTNPC-3_tyKYp1TB1cnACP3TBHrYjtTe9iQa6kT712_rg67MgBWt5tDG9OllshU8Kv-'},
	{
	:id => 9,
	:first_name => 'The', 
	:last_name => 'Dude', 
	:email => 'hdwtest7@gmail.com', 
	:linkedin_id => 'KcDCXsUzHM', 
	:linkedin_token => '0098352f-7f81-4f9f-b4ba-e28a2ddd49f7', 
	:linkedin_secret => 'f1f2bd12-4478-49ba-8ff6-3941a4264c2b', 
	:ticket => '29b20466f4c87e28c427722c750e1b06', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_66VqguuaWnpbZech6GsIgaj-INMBsmQhkkawgfy-qlSb5ol8Eho417HpLVJeJWb2FL4oteaA_pIf'},
	{
	:id => 10,
	:first_name => 'Carlton', 
	:last_name => 'Banks', 
	:email => 'hdwtest8@gmail.com', 
	:linkedin_id => 'N7WhtlMYnT', 
	:linkedin_token => '6ad84e56-9c5d-4331-bfbd-527be158b50a', 
	:linkedin_secret => 'ccfbe1ab-8907-4e17-ac0d-cd02ffaf23d8', 
	:ticket => '29b20466f4c87e28c427722c750e1b07', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_u_fFGJ4r5Mbsnohsaba4GUd7LsGE9WTsaCRZGse7Vx9sdDnVh50IuVpTIqCvvm8nS8DJDj9ytN6M'},
	{
	:id => 11,
	:first_name => 'Hulk', 
	:last_name => 'Hogan', 
	:email => 'hdwtest9@gmail.com', 
	:linkedin_id => 'scgKpJFhSL', 
	:linkedin_token => '8ce00db3-8fe6-469d-bd32-dd741ea088f2', 
	:linkedin_secret => '96ad04da-df57-47a9-87eb-d72c21623a86', 
	:ticket => '29b20466f4c87e28c427722c750e1b08', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_utI7LgB8Nwc5p87qaKoKLO5jq7rEYQxqaP0rL0XjIEXsTGeNhNR_wxK1V3KvjTY4SldloZntuJDL'},
	{
	:id => 12,
	:first_name => 'Justin', 
	:last_name => 'Bieber', 
	:email => 'hdwtest10@gmail.com', 
	:linkedin_id => 'wDW_k7SCoK', 
	:linkedin_token => '099c19b1-3fc5-46fa-8c92-bce6c54e53b1', 
	:linkedin_secret => 'd969c77c-a506-46a0-89c1-d22d8c69f8cc', 
	:ticket => '29b20466f4c87e28c427722c750e1b09', 
	:picture_url => 'http://media.linkedin.com/mpr/mprx/0_JE55fCEE3yO7bZPkRIksfhZVTMRhwZ_kUHlVf3JVYyfrNpNXvuvWTTSq7cU0HxCe4WbUhQwrjJU3'}
=end
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
=begin,	{
	:id => 5,
	:user_id => 4,
	:meeting_id => 2,
	:motivation => 'Ik ben een groot fan van Luke Skywalker.'},
	{
	:id => 6,
	:user_id => 5,
	:meeting_id => 2,
	:motivation => 'SPAAAAARTAAAAAAAAAA !!!11one!!eleven!11'},
	{
	:id => 7,
	:user_id => 6,
	:meeting_id => 2,
	:motivation => 'Ik zoek iemand om mijn kapsel te doen.'},
	{
	:id => 8,
	:user_id => 7,
	:meeting_id => 2,
	:motivation => 'Ik zoek Frodo.'},
	{
	:id => 9,
	:user_id => 8,
	:meeting_id => 2,
	:motivation => 'I looking for some women, Aaaight!'},
	{
	:id => 10,
	:user_id => 9,
	:meeting_id => 2,
	:motivation => 'Ik heb geen flauw idee waarom ik eigenlijk ga.'},
	{
	:id => 11,
	:user_id => 10,
	:meeting_id => 2,
	:motivation => 'I wanna show some dance moves.'},
	{
	:id => 12,
	:user_id => 11,
	:meeting_id => 2,
	:motivation => 'I break you!'},
	{
	:id => 13,
	:user_id => 12,
	:meeting_id => 2,
	:motivation => 'Baby, baby, baby. . ooh Right.'}
=end
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




