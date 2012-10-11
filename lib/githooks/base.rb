class String
  def underscore
    word = self.dup
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end
end

module Githooks
  HookNames = %w[applypatch_msg pre_applypatch post_applypatch
    pre_commit prepare_commit_msg commit_msg post_commit
    pre_rebase
    post_checkout
    post_merge
    pre_receive post_receive update post_update
    pre_auto_gc
    post_rewrite]
  class Base
    def execute
      lambda {
        hooks = []
        Kernel.send :define_method, self.class.name.underscore do |&block|
          hooks << block
        end
        
        Kernel.send :define_method, :each_hook do |&block| 
          hooks.each do |hook|
            block.call hook
          end
        end
        
        Kernel.send :define_method, :method_missing do |method, *args|
          super(method, args) unless Githooks::HookNames.include? method.to_s
        end
      }.call
      
      git_root = `git rev-parse --show-toplevel`.chop
      
      Dir.glob("#{git_root}/**/*_githooks.rb").each do |file|
        load file
      end
      
      env = Object.new
      each_hook do |hook|
        env.instance_eval &hook
      end
    end

  end
end
