require 'rubygems'
require 'active_support'

# Use active supports auto load mechanism
ActiveSupport::Dependencies.load_paths << File.dirname(__FILE__)

# Configure active support to log auto-loading of dependencies
#Dependencies::RAILS_DEFAULT_LOGGER = Logger.new($stdout)
#Dependencies.log_activity = true

# Load up extensions to existing classes
Dir[File.dirname(__FILE__) + '/sprinkle/extensions/*.rb'].each { |e| require e }
# Load up the verifiers so they can register themselves
Dir[File.dirname(__FILE__) + '/sprinkle/verifiers/*.rb'].each { |e| require e }

# Configuration options
module Sprinkle
  OPTIONS = { :testing => false, :verbose => false, :force => false }
end

# Object is extended to give the package, policy, and deployment methods. To
# read about each method, see the corresponding module which is included.
#--
# Define a logging target and understand packages, policies and deployment DSL
#++
class Object
  include Sprinkle::Package, Sprinkle::Policy, Sprinkle::Deployment

  def logger # :nodoc:
    @@__log__ ||= ActiveSupport::BufferedLogger.new($stdout, ActiveSupport::BufferedLogger::Severity::INFO)
  end
end
