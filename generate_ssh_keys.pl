#!/usr/bin/perl
use strict;
use warnings;

my $key_path = "$ENV{HOME}/.ssh/id_rsa";
my @servers = ('youruser@192.168.1.101', 'youruser@192.168.1.102', 'youruser@192.168.1.103');

# Check if key already exists
unless (-e $key_path) {
    print "Generating new SSH key pair...\n";
    my $gen_cmd = "ssh-keygen -t rsa -b 4096 -f $key_path -N ''";
    system($gen_cmd) == 0 or die "Failed to generate SSH key.\n";
    print "SSH key pair created at $key_path\n";
} else {
    print "SSH key already exists at $key_path — skipping generation.\n";
}

# Copy key to each server
foreach my $server (@servers) {
    print "Copying SSH key to $server...\n";
    my $copy_cmd = "ssh-copy-id $server";
    system($copy_cmd) == 0 or warn "Failed to copy key to $server\n";
}

print "🎉 Done.\n";
