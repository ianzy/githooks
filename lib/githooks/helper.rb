module Githooks
  module Helper
    def ask(question, default=true)
      option_string = default ? '[Y/n]' : '[y/N]'
      response = nil
      while (response != 'Y') && (response != 'N') && (response != "\r")
        print "#{question} #{option_string} "
        response = gets
        puts response
        response.upcase!
      end
      return default if response == "\r"
      return (response == 'Y') ? true : false
    end
  end
end