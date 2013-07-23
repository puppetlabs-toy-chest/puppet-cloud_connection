#! /usr/bin/env ruby
require 'spec_helper'
require 'puppet/type/cloud_connection'

type_class = Puppet::Type.type(:cloud_connection)

describe type_class do

  puts type_class
  subject { type_class }

  parameters = [:name, :user, :pass, :location]
  parameters.each do |parameter|
    it "should have a #{parameter} paramater" do
      subject.attrtype(parameter).should eq(:param)
    end
  end
end
