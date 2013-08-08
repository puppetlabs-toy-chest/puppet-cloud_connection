# Cloud_connection

## What?

This type does no work.  It just stores credentials for reference in the
catalog for retrieval.  As such there are no providers to work with.

## Usage

All that is needed is to create a resource with that looks something like the
following.

    cloud_connection { 'myawscredentials':
      user     => $user,
      pass     => $pass,
      location => $region,
    }

Now types that support this resource and reference this type to gain credential
information.

    mycloudtype { "aws":
      ...
      connection => 'myawscredentials',
      ...
    }

Now the user, pass, and location are available in the 'mycloudtype'.  Note,
this is only supported on types that have implemented such features.

## Adding support for a type

To bring in the required code, a type needs to require the credentials code and
then include the module to bring in the methods.

    require 'puppet_x/cloud/credentials'
    include PuppetX::Cloud::Credentials
    Puppet::Type.newtype(:mynewtype) do
      ...
    end

