package Clipboard::Pb;
use Spiffy -Base;

sub copy {
    open my $exe, '|pbcopy' or die "Couldn't run pbcopy: $!";
    print $exe $_[0];
}

sub paste {
    open my $exe, 'pbpaste|' or die "Couldn't run pbpaste: $!";

    my $cp_buf = do { local $/; <$exe> };

    # Some apps like XEmacs for OS X still use \r for new lines,
    # so let's just make sure we remove those characters from the buffer.
    $cp_buf =~ s/(?:\r\n{0,1})/\n/g;

    return $cp_buf;
}
