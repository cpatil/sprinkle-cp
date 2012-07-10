module Sprinkle
  module Verifiers
    # = Yum package Verifier
    #
    # Contains a verifier to check the existance of an Yum package.
    # 
    # == Example Usage
    #
    #   verify { has_yum 'ntp' }
    #
    module Yum
      Sprinkle::Verify.register(Sprinkle::Verifiers::Yum)

      # Checks to make sure the yum <tt>package</tt> exists on the remote server.
      def has_yum(package)
          puts package
         @commands << "yum list | grep #{package} "
      end

    end
  end
end
