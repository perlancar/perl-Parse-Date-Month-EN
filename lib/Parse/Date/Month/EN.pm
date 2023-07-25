package Parse::Date::Month::EN;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(parse_date_month_en $Pat);

our %month_values = (
    jn => 1,
    jan => 1,
    january => 1,

    fe => 2,
    feb => 2,
    february => 2,

    mr => 3,
    mar => 3,
    march => 3,

    ap => 4,
    apr => 4,
    april => 4,

    my => 5,
    may => 5,

    jn => 6,
    jun => 6,
    june => 6,

    jl => 7,
    jul => 7,
    july => 7,

    au => 8,
    agt => 8,
    aug => 8,
    august => 8,

    se => 9,
    sep => 9,
    sept => 9,
    september => 9,

    oc => 10,
    oct => 10,
    october => 10,

    nv => 11,
    nov => 11,
    nop => 11,
    november => 11,

    de => 12,
    dec => 12,
    december => 12,
);

our $Pat = join("|", sort keys %month_values); $Pat = qr/(?:$Pat)/;

our %SPEC;

$SPEC{parse_date_month_en} = {
    v => 1.1,
    summary => 'Parse month name from English text',
    description => <<'_',

Returns undef when month name is unrecognized.

_
    args    => {
        text => {
            summary => 'The input text that contains month name',
            schema => 'str*',
            pos => 0,
            req => 1,
        },
    },
    result_naked => 1,
};
sub parse_date_month_en {
    my %args = @_;
    my $text = $args{text};

    $text =~ s/^\s+//s;
    return undef unless length($text); ## no critic: Subroutines::ProhibitExplicitReturnUndef

    $month_values{lc $text};
}

1;
# ABSTRACT:

=head1 SYNOPSIS

 use Parse::Date::Month::EN qw(parse_date_month_en);

 my $m = parse_date_month_en(text => "sept"); # 9
 $m = parse_date_month_en(text => "mars"); # undef


=head1 DESCRIPTION

The goal of this module is to parse month names commonly found in English text.
It currently parses abbreviated and full month names in English.


=head1 VARIABLES

None are exported by default, but they are exportable.

=head2 $Pat

A regex.


=head1 SEE ALSO

Other C<Parse::Month::Name::*> modules, e.g. L<Parse::Date::Month::ID>.

=cut
