#!/usr/bin/perl
use strict;
use utf8;
use Net::SSH::Perl;
use Config::Tiny;

my $config = Config::Tiny->read('dev.config');
my $ssh = Net::SSH::Perl->new($config->{master}{host});

$ssh->login($config->{master}{user},$config->{master}{password});
my($stdout, $stderr, $exit) = $ssh->cmd("ls -al");

foreach(split(/\n/,$stdout)) {
	print "> $_\n";
}
