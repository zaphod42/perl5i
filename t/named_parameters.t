#!/usr/bin/perl

use perl5i::2;
use Test::More;


# Named func parameters
{
    func named(:$this) { return $this; }
    is named({ this => 42 }), 42;
    is named(42), 42;
}

# Named anonymous func parameters
{
    my $named = func(:$this) { return $this; };
    is $named->({ this => 42 }), 42;
    is $named->(42), 42;
}

# Method with named parameters
{
    {
        package Foo;
        use perl5i::2;

        method new ($class: :$param) {
            return bless { param => $param }, $class;
        }
        method get (:$thing) {
            return $self->{$thing};
        }
    }

    my $named = Foo->new({ param => 42 });
    isa_ok $named, "Foo";
    is $named->get({ thing => "param" }), 42;
    is $named->get("param"), 42;

    my $positional = Foo->new(42);
    is $positional->get({ thing => "param" }), 42;
    is $positional->get("param"), 42;
}

# Multple named parameters
{
    my $named = func(:$this, :$that) { return $this + $that; };
    is $named->({ this => 42, that => 15 }), 57;
    is $named->(42, 15), 57;
}

done_testing();

