#!/usr/bin/perl

use perl5i;
use Test::More;

class Thing {
    has count => (
        isa => "Num",
        is  => "rw",
        default => 0,
    );

    method increment_count(Int $amount = 1) {
        return $self->count( $self->count + $amount );
    }
}


{
    my $obj = Thing->new;
    is $obj->count, 0;
    is $obj->increment_count(),  1;
    is $obj->increment_count(2), 3;
}


done_testing();
