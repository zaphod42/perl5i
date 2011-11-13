#!/usr/bin/perl

use perl5i::2;
use Test::More;


# Named func parameters
{
    func named(:$this) { return $this; }
    is named({ this => 42 }), 42;
}

# Named anonymous func parameters
{
    my $named = func(:$this) { return $this; };
    is $named->({ this => 42 }), 42;
}

done_testing();

