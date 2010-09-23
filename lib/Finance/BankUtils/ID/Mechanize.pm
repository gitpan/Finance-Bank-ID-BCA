package Finance::BankUtils::ID::Mechanize;
BEGIN {
  $Finance::BankUtils::ID::Mechanize::VERSION = '0.12';
}
# ABSTRACT: A subclass of WWW::Mechanize that does HTTPS certificate verification


use 5.010;
use Crypt::SSLeay;
use Log::Any qw($log);
use base qw(WWW::Mechanize);



sub new {
    my ($class, %args) = @_;
    my $mech = WWW::Mechanize->new;
    $mech->{verify_https} = $args{verify_https} // 0;
    $mech->{https_ca_dir} = $args{https_ca_dir} // "/etc/ssl/certs";
    $mech->{https_host}   = $args{https_host};
    bless $mech, $class;
}


sub request {
    my ($self, $req) = @_;
    local $ENV{HTTPS_CA_DIR} = $self->{verify_https} ?
        $self->{https_ca_dir} : undef;
    $log->trace("HTTPS_CA_DIR = $ENV{HTTPS_CA_DIR}");
    if ($self->{verify_https} && $self->{https_host}) {
        $req->header('If-SSL-Cert-Subject',
                     qr!\Q/CN=$self->{https_host}\E(/|$)!);
    }
    $log->trace('Mech request: ' . $req->headers_as_string);
    my $resp = $self->SUPER::request($req);
    $log->trace('Mech response: ' . $resp->headers_as_string);
    $resp;
}

1;

__END__
=pod

=head1 NAME

Finance::BankUtils::ID::Mechanize - A subclass of WWW::Mechanize that does HTTPS certificate verification

=head1 VERSION

version 0.12

=head1 SYNOPSIS

 my $mech = Finance::BankUtils::ID::Mechanize->new(
     verify_https => 1,
     #https_ca_dir => '/etc/ssl/certs',
     https_host   => 'example.com',
 );
 # use as you would WWW::Mechanize object ...

=head1 DESCRIPTION

This is a subclass of WWW::Mechanize that does (optional) HTTPS certificate verification.

=head1 METHODS

=head2 new()

=head2 request()

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

