
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Handy CLI HTTP tool",
  "AUTHOR" => "Arthur Axel \"fREW\" Schmidt <frioux+cpan\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-Adenosine",
  "EXE_FILES" => [
    "bin/adenosine",
    "bin/pp"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::Adenosine",
  "PREREQ_PM" => {
    "Capture::Tiny" => 0,
    "Config::Any" => 0,
    "File::HomeDir" => 0,
    "File::Path" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "File::pushd" => 0,
    "FindBin" => 0,
    "Getopt::Long" => 0,
    "JSON" => "2.53",
    "Module::Runtime" => 0,
    "Moo" => "1.000006",
    "Path::Class" => "0.26",
    "Scalar::Util" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0,
    "Text::ParseWords" => 0,
    "Time::HiRes" => 0,
    "URI" => 0,
    "URI::Escape" => 0,
    "YAML" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "2.001006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



