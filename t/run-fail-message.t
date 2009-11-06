use strict;
use warnings;
use Test::Builder::Tester;
use Test::More;
use Test::Base;

plan tests => 4*blocks;

my $ERROR_IS_TEMPLATE = <<END_OF_ERROR_IS_TEMPLATE;
#   Failed test 'should fail'
#   at $0 line %s.
#          got: 'foo'
#     expected: 'bar'
END_OF_ERROR_IS_TEMPLATE

chomp $ERROR_IS_TEMPLATE;

my $ERROR_IS_DEEP_TEMPLATE = <<END_OF_ERROR_IS_DEEP_TEMPLATE;
#   Failed test 'should fail'
#   at $0 line %s.
# Compared \$data
#    got : 'foo'
# expect : 'bar'
END_OF_ERROR_IS_DEEP_TEMPLATE
chomp $ERROR_IS_DEEP_TEMPLATE;

my $OUT = "not ok 1 - should fail";

{
# run_compare

test_out($OUT);
test_err(sprintf($ERROR_IS_TEMPLATE, line_num(+1)));
run_compare;
test_test("run_compare");

}

{
# run_is

test_out($OUT);
test_err(sprintf($ERROR_IS_TEMPLATE, line_num(+1)));
run_is;
test_test("run_is");

}

{
# run_is_deeply

test_out($OUT);
test_err(sprintf($ERROR_IS_TEMPLATE, line_num(+1)));
run_is_deeply;
test_test("run_is_deeply");

}

{
# run_is_deep

test_out($OUT);
test_err(sprintf($ERROR_IS_DEEP_TEMPLATE, line_num(+1)));
run_is_deep;
test_test("run_is_deep");

}

__END__
=== should fail
--- foo: foo
--- bar : bar
