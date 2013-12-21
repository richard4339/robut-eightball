require 'calc'

# 8 Ball
class Robut::Plugin::EightBall
  include Robut::Plugin

  desc "8ball - respond with an 8ball response"
  match /^8ball (.*)/, :sent_to_me => true do |message|
    answers = ["It is certain",
               "It is decidedly so",
               "Without a doubt",
               "Yes definitely",
               "You may rely on it",
               "As I see it yes",
               "Most likely",
               "Outlook good",
               "Yes",
               "Signs point to yes",
               "Reply hazy try again",
               "Ask again later",
               "Better not tell you now",
               "Cannot predict now",
               "Concentrate and ask again",
               "Don't count on it",
               "My reply is no",
               "My sources say no",
               "Outlook not so good",
               "Very doubtful"]
    rsp = answers[random(answers.length)]
    reply("#{rsp}") if rsp
  end

  def random(c)
    rand(c)
  end

end