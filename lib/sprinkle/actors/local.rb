module Sprinkle
  module Actors
    # = Local Delivery Method
    #
    # This actor implementation performs any given commands on your local system, as
    # opposed to other implementations that generally run commands on a remote system
    # via the network.
    #
    # This is useful if you'd like to use Sprinkle to provision your local machine. 
    # To enable this actor, in your Sprinkle script specify the :local delivery mechanism. 
    #
    #   deployment do
    #     delivery :local
    #   end
    #
    # Note, your local machine will be assumed to be a member of all roles when applying policies
    #
    class Local
      attr_accessor :options

      def initialize(options = {}, &block) #:nodoc:
        @options = options
        self.instance_eval &block if block
      end

      def set_env(hsh)
        @options[:env] = hsh
      end

      def process(name, commands, roles, suppress_and_return_failures = false) #:nodoc:
        @options[:env].each {|k,v|  ENV[k.to_s] = v.empty? ? nil : v} unless @options[:env].nil?
        begin
          commands.each { |command|  raise CmdExecutionException.new(command, $!) unless system command  }
        rescue CmdExecutionException => e          
          return false if suppress_and_return_failures

          puts "Error running command '#{e.command}' : #{e.err}"
          puts e.backtrace.join("\n")
          exit 1
        end
      end
      

      def post_process
        unless @options[:env].nil?
          # write out the env

          
        end
      end

    end
  end
end

class CmdExecutionException < Exception
  attr_accessor :command, :err
  def initialize(command, err)
    @command = command
    @err = err ? err : 'please see output file for this command if any'
  end
end
