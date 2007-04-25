package Net::XMPP2;
use warnings;
use strict;

=head1 NAME

Net::XMPP2 - An implementation of the XMPP Protocol

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

   use Net::XMPP2::Connection;

or:

   use Net::XMPP2::IM::Connection;

=head1 DESCRIPTION

This is the head module of the L<Net::XMPP2> XMPP client protocol (as described in
RFC 3920 and RFC 3921) framework.

L<Net::XMPP2::Connection> is a RFC 3920 conformant "XML" stream implementation
for clients, which handles tcp connect up to the resource binding. And provides
low-level access to the XML nodes on the XML stream along with some high
level methods to send the predefined XML stanzas.

L<Net::XMPP2::IM::Connection> is a more highlevel module, which is derived
from L<Net::XMPP2::Connection>. It handles all the instant messaging client
functionality described in RFC 3921.

For a list of L<Supportet extensions> see below.

There are also other modules in this distribution, for example:
L<Net::XMPP2::Util>, L<Net::XMPP2::Writer>, L<Net::XMPP2::Parser> and those i
forgot :-) Those modules might be helpful and/or required if you want to use
this framework for XMPP.

See also L<Net::XMPP2::Writer> for a discussion about the brokeness of XML in the XMPP
specification.

=head1 Why (yet) another XMPP module?

The main outstanding feature of this module in comparsion to the other XMPP
(aka Jabber) modules out there is the support for L<AnyEvent>. L<AnyEvent>
permits you to use this module together with other I/O event based programs and
libraries (ie. L<Gtk2> or L<Event>).

The other modules could often only be integrated in those applications or librarys
by using threads. I decided to write this module because i think CPAN lacks
an event based XMPP module. Threads are unfortunately not an alternative in Perl
at the moment due the limited threading functionality they provide and the global
speed hit. I also think that a simple event based I/O framework might be a bit easier
to handle than threads.

Another thing was that I didn't like the APIs of the other modules. In L<Net::XMPP2>
I try to provide low level modules for speaking XMPP as defined in RFC 3920 and RFC 3921
(see also L<Net::XMPP2::Connection> and L<Net::XMPP2::IM::Connection>). But I also
try to provide a high level API for easier usage for instant messaging tasks and clients.

=head1 A note about TLS

This module also supports TLS, as the specification of XMPP requires an
implementation to support TLS.

There are maybe still some bugs in the handling of TLS in L<Net::XMPP2::Connection>.
So keep an eye on TLS with this module. If you encounter any problems it would be
very helpful if you could debug them or at least send me a detailed report on how
to reproduce the problem.

(As I use this module myself I don't expect TLS to be completly broken, but it
might break under different circumstances than I have here.  Those
circumstances might be a different load of data pumped through the TLS
connection.)

I mainly expect problems where aviable data isn't properly read from the socket
or written to it. You might want to take a look at the C<debug_send> and C<debug_recv>
events in L<Net::XMPP2::Connection>.

=head1 Supportet extensions

See L<Net::XMPP2::Ext> for a list.

=head1 AUTHOR

Robin Redeker, C<< <elmex at ta-sa.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-net-xmpp2 at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-XMPP2>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::XMPP2

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-XMPP2>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Net-XMPP2>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-XMPP2>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-XMPP2>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2007 Robin Redeker, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Net::XMPP2
