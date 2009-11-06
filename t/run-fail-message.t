use strict;
use warnings;
use Test::Builder::Tester;
use Test::More;
use Test::Base;

plan tests => 1*blocks;

my $out = "not ok 1 - should fail";
test_out($out);

my $err = <<END_OF_RUN_IS_DEEPLY;
#   Failed test 'should fail'
#   at $0 line %s.
#          got: 'foo'
#     expected: 'bar'
END_OF_RUN_IS_DEEPLY

chomp $err;
test_err(sprintf($err, line_num(+1)));
run_is_deeply;
test_test("run_is_deeply");

__END__
=== should fail
--- foo: foo
--- bar: bar
