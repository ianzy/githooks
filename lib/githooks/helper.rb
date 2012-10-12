module Githooks
  module Helper
    def ask(question, default=true)
      option_string = default ? '[Y/n]' : '[y/N]'
      response = nil
      while (response != "Y\n") && (response != "N\n") && (response != "\n")
        print "#{question} #{option_string} "
        response = gets
        response.upcase!
      end
      return default if response == "\n"
      return (response == "Y\n") ? true : false
    end
  end
end