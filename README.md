# Githooks [![Build Status](https://secure.travis-ci.org/ianzy/githooks.png)](http://travis-ci.org/ianzy/githooks)

A framework to manage git hooks with your repository. Codes in *_githooks.rb will be executed by the framework.

## Convention
Githooks will look for files named as filename_githooks.rb under githooks folder in your repository. The typical directory structure with Githooks will look like this,
```
/Your repository
  /lib
  /app
  ...
  /hooks
    example_githooks.rb
    example2_githooks.rb
```
## Installation

Add this line to your application's Gemfile:

    gem 'githooks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install githooks

## Usage

After the gem is installed, you need to initialize githooks in your repository.

    $ githooks --init

Following key words can be used in your filename_githooks.rb files
*   applypatch_msg
*   pre_applypatch
*   post_applypatch
*   pre_commit
*   prepare_commit_msg
*   commit_msg
*   post_commit
*   pre_rebase
*   post_checkout
*   post_merge
*   pre_receive
*   post_receive
*   update
*   post_update
*   pre_auto_gc
*   post_rewrite

The framework enable you to group different git hooks in one file and manage hooks based on their functionalities. Arguments for a specific hook is yielded to its corresponding marco. For example, you can access commit file through commit_msg { |args| p args[0] }  

## Example
```ruby
# dummy_githooks.rb
pre_commit do
  puts "executed in pre commit hook"
end

commit_msg do |args|
  git_root = `git rev-parse --show-toplevel`.chop
  
  message_file = args[0]
  message = File.read(git_root+'/'+message_file)
  
  $regex = /\[ref: (\d+)\]/
  
  if !$regex.match(message)
    puts "[POLICY] Your message is not formatted correctly"
    exit 1
  end
end
```

The example hook checks whether the commit message follows the provided pattern. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

1. Testing / CI
2. Provide git related information in the environment
3. Share context across hooks
