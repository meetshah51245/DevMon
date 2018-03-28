package json_perl;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;
use JSON::XS;
use Data::Validate::Struct;

#-----------------------------------------------------------------------------
# Method: json2perl
#   A utility to convert JSON data into perl.
#
#   Parameters (in order):
#       - JSON data
#   Return values (in order):
#       - Perl/Bash data
#-----------------------------------------------------------------------------
sub json2perl {
  my ($self, $json_data) = @_;
  my $perl_data;

  $perl_data = decode_json($json_data);

  return (1, $perl_data);
}

#-----------------------------------------------------------------------------
# Method: perl2json
#   A utility to convert data from perl to json.
#
#   Parameters (in order):
#       - Perl Data
#   Return values (in order):
#       - JSON Data
#-----------------------------------------------------------------------------
sub perl2json {
  my ($self, $perl_data) = @_;
  my $json_data;

  $json_data = encode_json($perl_data);

  return (1,$json_data);
}

1;
