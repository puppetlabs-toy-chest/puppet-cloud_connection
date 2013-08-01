require 'puppet_x/cloud'

module PuppetX::Cloud::Connection::Ec2

  #
  # Connect to AWS
  #
  # Return the Fog::Compute conneciton object
  #
  def self.connection(user,pass,region='us-west-2')
    opts = {
      :provider              => 'aws',
      :aws_access_key_id     => user,
      :aws_secret_access_key => pass,
      :region                => region,
    }

    debug "creating connection to AWS for EC2"
    Fog::Compute.new(opts)
  end

end
