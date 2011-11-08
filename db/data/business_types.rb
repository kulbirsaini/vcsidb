#!/usr/bin/env ruby

business_types = [
  { :name => 'Internet Service Provider', :description => 'Internet Service Provider (or ISPs) providing internet services to clients in a region or country.' },
  { :name => 'Wireless Internet Service Provider', :description => 'Wireless Internet Service Provider (or WISP) providing internet services over wireless or satelite links.' },
  { :name => 'Government Organization or Department', :description => 'An organization or department controlled by Government.' },
  { :name => 'For Profit Company/Orignization', :description => 'A for-profit Company or organization.' },
  { :name => 'Not For Profit Company/Orignization', :description => 'A not-for-profit Company or organization.' },
  { :name => 'Cyber Cafe', :description => 'A Cyber Cafe with up to a few hundred clients.' },
  { :name => 'Educational Institution (College/University)', :description => 'An educational institution of the level of college/university.' },
  { :name => 'Educational Institution (School)', :description => 'An educational institution of the level of school.' },
  { :name => 'Individual', :description => '' },
]

BusinessType.create( business_types )
