
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
    "File::Path" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => 0,
    "Getopt::Long" => 0,
    "JSON" => "2.53",
    "Module::Runtime" => 0,
    "Moo" => "1.000006",
    "Path::Class" => 0,
    "Test::Deep" => 0,
    "Test::More" => 0,
    "Text::ParseWords" => 0,
    "URI" => 0,
    "URI::Escape" => 0
  },
  "VERSION" => "2.000000",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


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



