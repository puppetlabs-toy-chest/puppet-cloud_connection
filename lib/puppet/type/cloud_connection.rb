Puppet::Type.newtype(:cloud_connection) do
  @doc = "Instance provisioning with puppet."

  newparam(:name, :namevar => true) do
    desc "unique name of instance"
  end

  newparam(:user, :isrequired => true) do
    desc "The username to use for the API calls."
  end

  newparam(:pass, :isrequired => true) do
    desc "The password for the user making the API calls."
  end

  newparam(:location) do
    desc "What datacenter/region is this instance in?"
  end

end
