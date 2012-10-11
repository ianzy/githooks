# Githooks

A framework to manage git hooks with your repository. Codes in *_githooks.rb will be executed by the framework.

## Convention
The name of the hook file should look like this filename_githooks.rb
The typical directory structure with githooks will look like this,
/Your repository
  /lib
  /app
  ...
  /hooks
    example_githooks.rb
    example2_githooks.rb

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

Following key words can be used in your githooks.rb files
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

## Example
```ruby
    pre_commit do
      puts "executed in pre commit hook"
    end

    commit_msg do
      puts "executed in commit msg hook"
      exit -1
    end
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
