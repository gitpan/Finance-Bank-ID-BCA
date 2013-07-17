
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "File::Slurp" => 0,
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Check your BCA accounts from Perl",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Finance-Bank-ID-BCA",
  "dist_version" => "0.26",
  "license" => "perl",
  "module_name" => "Finance::Bank::ID::BCA",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "App::Options" => 0,
    "Data::Rmap" => 0,
    "DateTime" => 0,
    "File::HomeDir" => 0,
    "Log::Any" => 0,
    "Log::Any::App" => "0.23",
    "Moo" => 0,
    "Perinci::CmdLine" => "0.55",
    "Rinci" => "v1.1.20",
    "WWW::Mechanize" => 0,
    "YAML" => 0,
    "perl" => "5.010001"
  },
  "script_files" => [
    "bin/download-bca",
    "bin/parse-bca-statement"
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
