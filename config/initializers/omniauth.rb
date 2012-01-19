Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    provider :linkedin, 'du6egpmuzdvl', 'FoePCrBCPDs2qDGE'
  else
     provider :linkedin, '-1YQvzZ-M0-j2vNnq8cSTsbOigV2XUur4lTVLQKBJ7kMVjSMGOF2Ndrib8EhXfLD', '4cD40PK_AYoq69NptDig_4rJbR9aCS1APWAk_jsOeBLAwVh5zed4a7zhXl43hOWh'
  end

end