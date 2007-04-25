package Net::XMPP2::Event;

=head1 NAME

Net::XMPP2::Event - A event handler class

=head1 SYNOPSIS

   package foo;
   use Net::XMPP2::Event;

   our @ISA = qw/Net::XMPP2::Event/;

   package main;
   my $o = foo->new;
   $o->reg_cb (foo => sub { ...; 1 });
   $o->event (foo => 1, 2, 3);

=head1 DESCRIPTION

This module is just a small helper module for the connection
and client classes.

You may only derive from this package.

=head2 reg_cb ($eventname1, $cb1, [$eventname2, $cb2, ...])

This method registers a callback C<$cb1> for the event with the
name C<$eventname1>. You can also pass multiple of these eventname => callback
pairs.

The return value will be an ID that represents the set of callbacks you have installed.
Call C<unreg_cb> with that ID to remove those callbacks again.

To see a documentation of emitted events please take a look at the EVENTS section
in the classes that inherit from this one.

=cut

sub reg_cb {
   my ($self, %regs) = @_;

   $self->{id}++;

   for my $cmd (keys %regs) {
      push @{$self->{events}->{lc $cmd}}, [$self->{id}, $regs{$cmd}]
   }

   $self->{id}
}

=head2 unreg_cb ($id)

Removes the set C<$id> of registered callbacks. C<$id> is the
return value of a C<reg_cb> call.

=cut

sub unreg_cb {
   my ($self, $id) = @_;

   my $set = delete $self->{ids}->{$id};

   for my $key (keys %{$self->{events}}) {
      @{$self->{events}->{$key}} =
         grep {
            $_->[0] ne $id
         } @{$self->{events}->{$key}};
   }
}


=head2 event ($eventname, @args)

Emits the event C<$eventname> and passes the arguments C<@args>.

=cut

sub event {
   my ($self, $ev, @arg) = @_;

   my $nxt = [];

   my $handled;
   for (@{$self->{events}->{lc $ev}}) {
      $_->[1]->($self, @arg) and push @$nxt, $_;
   }

   $self->{events}->{lc $ev} = $nxt;
}

=head1 AUTHOR

Robin Redeker, C<< <elmex at ta-sa.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2007 Robin Redeker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
