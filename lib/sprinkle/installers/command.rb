cmodule Sprinkle
  module Installers
    # = Custom installer
    #
    # It executes the specified command.
    #   # 
    # == Example Usage
    #
    # First, a simple installation of the magic_beans gem:
    #
    #   package :magic_beans do
    #     description "Beans beans they're good for your heart..."
    #     command 'gem install magic_beans'
    #   end
    #
    # As you can see, setting options is as simple as creating a
    # block and calling the option as a method with the value as 
    # its parameter.
    class Command < Installer
      attr_accessor :command #:nodoc:

      def initialize(parent, command, options = {}, &block) #:nodoc:
        super parent, options, &block
        @command = command
      end

      protected

        def install_commands #:nodoc:
          cmd = command
          cmd
        end
        
    end
  end
end
