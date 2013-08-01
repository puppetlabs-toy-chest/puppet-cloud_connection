require 'puppet_x/cloud'

# Included by the providers to reduce code repitiion
module PuppetX::Cloud::Connection

  #
  # Get the connection object using the current resource paramaters
  #
  # Here we just return the existing connection object if it already exists or
  # build it and return it.
  #
  # @conn is the connection object.  It is the fog resource that does the
  # actual lifting.
  #
  def connect
    if @conn
      debug "found existing connection"
      return @conn
    else
      get_cloud_connection()

      debug "exting connection not found"

      args = []
      args << @connection_resource[:user]
      args << @connection_resource[:pass]
      args << @connection_resource[:location] if @connection_resource[:location]

      @conn = self.class.connection(*args)
      return @conn
    end
  end

  #
  # Get the credentials fom the type by searching through the catlog for the
  # given connection resoruce.
  #
  # This is strictly a helper to ensure that we lookup the information only
  # one time..
  #
  def get_cloud_connection
    if @connection_resource
      debug "found connection resource"
      return @connection_resource
    else
      debug "searching for connection resource"
      @connection_resource = resource.get_creds(resource[:connection])
      return @connection_resource
    end
  end

end
