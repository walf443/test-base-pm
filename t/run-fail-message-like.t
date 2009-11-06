use strict;
use warnings;
use Test::Builder::Tester;
use Test::More;
use Test::Base;

plan tests => 2;

my $ERROR_LIKE_TEMPLATE = <<END_OF_ERROR_LIKE_TEMPLATE;
#   Failed test 'for like'
#   at $0 line %s.
#                   '(?-xism:foo)'
#     doesn't match '(?-xism:bar)'
END_OF_ERROR_LIKE_TEMPLATE
chomp $ERROR_LIKE_TEMPLATE;


my $ERROR_UNLIKE_TEMPLATE = <<END_OF_ERROR_UNLIKE_TEMPLATE;
#   Failed test 'for unlike'
#   at $0 line %s.
#                   '(?-xism:foo)'
#           matches '(?-xism:foo)'
END_OF_ERROR_UNLIKE_TEMPLATE
chomp $ERROR_UNLIKE_TEMPLATE;

{
# run_compare

test_err(sprintf($ERROR_LIKE_TEMPLATE, line_num(+1)));
run_like;
test_test(title => "run_like", skip_out => 1);

}

{
# run_compare

test_err(sprintf($ERROR_UNLIKE_TEMPLATE, line_num(+1)));
run_unlike;
test_test(title => "run_unlike", skip_out => 1);

}

__END__
=== for like
--- foo eval: qr/foo/
--- bar eval: qr/bar/

=== for unlike
--- foo eval: qr/foo/
--- bar eval: qr/foo/
