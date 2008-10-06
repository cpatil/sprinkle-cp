module Sprinkle
  module Verifiers
    # = Execute a commandf Verifier
    #
    # Contains a verifier that runs the specified command 
    # 
    # == Example Usage
    #
    #   verify { has_successful_execution %Q!ruby -e "..."! }
    #
    module CommandExecution
      Sprinkle::Verify.register(Sprinkle::Verifiers::CommandExecution)
      
      # Checks to make sure <tt>cmd</tt> runs successfully.
      def has_successful_execution(cmd)
        @commands << cmd
      end
    end
  end
end
