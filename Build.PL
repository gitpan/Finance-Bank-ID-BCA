
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Check your BCA accounts from Perl',
  'dist_author' => [
    'Steven Haryanto <stevenharyanto@gmail.com>'
  ],
  'dist_name' => 'Finance-Bank-ID-BCA',
  'dist_version' => '0.08',
  'license' => 'perl',
  'module_name' => 'Finance::Bank::ID::BCA',
  'recommends' => {},
  'requires' => {
    'Any::Moose' => '0',
    'Data::Dumper' => '0',
    'DateTime' => '0',
    'File::Slurp' => '0',
    'Log::Any' => '0',
    'Mouse' => '0',
    'WWW::Mechanize' => '0',
    'perl' => '5.010000'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
