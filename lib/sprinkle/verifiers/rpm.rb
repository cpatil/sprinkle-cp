module Sprinkle
  module Verifiers
    # = RPM Verifier
    #
    # Contains a verifier to check the existance of an RPM package.
    # 
    # == Example Usage
    #
    #   verify { has_rpm 'ntp' }
    #
    module Rpm
      Sprinkle::Verify.register(Sprinkle::Verifiers::Rpm)
      
      # Checks to make sure <tt>package</tt> exists in the rpm installed database on the remote server.
      def has_rpm(package)
        @commands << %Q!rpm -qa | grep -e '^#{::File.basename(package, ".rpm")}'!
      end
      
    end
  end
end
