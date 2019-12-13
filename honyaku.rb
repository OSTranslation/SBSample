

require 'open-uri'
require 'slack-ruby-bot'
require 'json'
require 'uri'



class PongBot < SlackRubyBot::Bot
    command %r!.*! do |client, data, match|
        puts "---------------------------------------------------------------------------------"
        puts "---------------------------------------------------------------------------------"
        p data.text
#        p data.channel
#        p data.user
#        p data.user_team
#        puts "---------------------------------------------------------------------------------"
#        puts "---------------------------------------------------------------------------------"
        source = data.text
        p source
        source = URI.escape( source )
        p source
        answer = OpenURI.open_uri("https://script.google.com/macros/s/AKfycbw366Zp4tqBQbDD8Kxcu5AHlKz0wDMSDGyPfr6h4hq6Ln_Rnas/exec?text=#{source}&source=ja&target=en")
        puts "---------------------------------------------------------------------------------"
        puts "---------------------------------------------------------------------------------"
        result = answer.read
        p result
        puts "---------------------------------------------------------------------------------"
        puts "---------------------------------------------------------------------------------"
        client.say(text: result, channel: data.channel)
    end
end
PongBot.run


