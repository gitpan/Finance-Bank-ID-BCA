
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Check your BCA accounts from Perl",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Finance-Bank-ID-BCA",
  "EXE_FILES" => [
    "bin/parse-bca-statement",
    "bin/download-bca"
  ],
  "LICENSE" => "perl",
  "NAME" => "Finance::Bank::ID::BCA",
  "PREREQ_PM" => {
    "App::Options" => 0,
    "Data::Rmap" => 0,
    "DateTime" => 0,
    "File::HomeDir" => 0,
    "Log::Any" => 0,
    "Log::Any::App" => "0.23",
    "Moo" => 0,
    "Perinci::CmdLine" => "0.55",
    "Rinci" => "v1.1.20",
    "SHARYANTO::String::Util" => 0,
    "WWW::Mechanize" => 0,
    "YAML::Syck" => 0
  },
  "TEST_REQUIRES" => {
    "File::Slurp" => 0,
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.28",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "App::Options" => 0,
  "Data::Rmap" => 0,
  "DateTime" => 0,
  "File::HomeDir" => 0,
  "File::Slurp" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Log::Any" => 0,
  "Log::Any::App" => "0.23",
  "Moo" => 0,
  "Perinci::CmdLine" => "0.55",
  "Rinci" => "v1.1.20",
  "SHARYANTO::String::Util" => 0,
  "Test::More" => 0,
  "WWW::Mechanize" => 0,
  "YAML::Syck" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



