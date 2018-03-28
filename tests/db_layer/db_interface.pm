package db_interface;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;
use json_perl;

sub insertToDB {
  my ($self, $json) = @_;
  my $perl_data; my $result_json; my $result_perl;
  my $pass=""; my $fail="";

  # Get Index and store at index.
  $perl_data = json_perl->json2perl($json);
  my $index = $perl_data->{'indexing'};
  return 0 if(!insertToElasticSearch($index, $json));

  return 1;
}

sub insertToElasticSearch {
  my ($index, $json) = @_;
  my $result_json;
  my $result_perl;
  my $pass="";
  my $fail="";

  my $insert_cmd="curl -XPOST '$index?pretty' -d '$json'";
  $result_json = `$insert_cmd 2>/dev/null`;

  # Analyze result for pass/fail.
  $result_perl = json_perl->json2perl($result_json);
  $pass = $result_perl->{'acknowledged'} || $result_perl->{'created'};
  $fail = $result_perl->{'error'};
  return 0 if ($fail || not $pass);

  return 1;
}

1;
