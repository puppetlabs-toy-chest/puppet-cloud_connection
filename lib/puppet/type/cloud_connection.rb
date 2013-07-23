Puppet::Type.newtype(:cloud_connection) do
  @doc = "Puppet catalog cloud credential storage."

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
    desc "The datacenter/region API calls should be made to."
  end
end
