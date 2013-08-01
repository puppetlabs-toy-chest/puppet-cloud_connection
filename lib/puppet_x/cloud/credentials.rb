require 'puppet_x/cloud'

# Included by the types
module PuppetX::Cloud::Credentials

  #
  # Searches the catalog for the resource type 'cloud_connection' by the title
  # of the received connection name and retuns a hash of the username nad
  # password from that resource.  This is here so that the cloud types can
  # reference a resource with the credentials.
  #
  # Should be included by any type that needs access to the credentials stored
  # in the catalog for a given cloud provider.
  #
  def get_creds(connection=self[:connection])
    self.catalog.resources.find {|r|
      r.is_a?(Puppet::Type.type(:cloud_connection)) && r[:name] == connection
    }
  end

end
