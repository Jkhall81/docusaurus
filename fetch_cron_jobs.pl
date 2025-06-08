#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use File::Path qw(make_path);

# Define your server list and output paths
my @servers = ('server-a', 'server-b', 'server-c');  # replace with real hostnames or IPs
my $raw_dir = "/path/to/docusaurus/static/data/cron/raw";     # stores raw .txt files
my $json_output = "/path/to/docusaurus/static/data/cron/cron-jobs.json";  # final structured JSON

# Ensure output directory exists
make_path($raw_dir) unless -d $raw_dir;

# Collect all parsed cron jobs
my @all_jobs;

foreach my $server (@servers) {
    print "Fetching crontab from $server...\n";

    my $cmd = "ssh $server 'crontab -l'";
    my $crontab = `$cmd`;

    if ($? == 0) {
        my $txt_path = "$raw_dir/$server-cron.txt";
        open my $out, '>', $txt_path or die "Can't write $txt_path: $!";
        print $out $crontab;
        close $out;
        print "Saved: $txt_path\n";

        # Parse each line
        foreach my $line (split /\n/, $crontab) {
            next if $line =~ /^\s*$/ || $line =~ /^\s*#/;  # skip comments/blank lines

            if ($line =~ /^(\S+\s+\S+\s+\S+\s+\S+\s+\S+)\s+(.+)$/) {
                my ($schedule, $command) = ($1, $2);
                push @all_jobs, {
                    server    => $server,
                    schedule  => $schedule,
                    command   => $command,
                };
            }
        }

    } else {
        warn "Failed to fetch crontab from $server\n";
    }
}

# Write combined JSON
open my $json_fh, '>', $json_output or die "Can't write $json_output: $!";
print $json_fh to_json(\@all_jobs, { pretty => 1 });
close $json_fh;

print "✅ Wrote parsed cron job data to: $json_output\n";
