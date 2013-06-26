package Rex::Logger::ToLogAny;
# ABSTRACT: Rexでのログを、Log::Anyに流します。

use strict;
use Log::Any '$log';
use Rex::Logger ();

sub info {
    my ($msg, $type) = @_;

    $type ||= "info";
    my $lc = lc($type);
    my $uc = uc($type);
    my $line = Rex::Logger::format_string($msg, $uc);
    $log->$lc($line);
}

sub debug {
    my ($msg) = @_;

    my $line = Rex::Logger::format_string($msg, "DEBUG");
    $log->debug($line);
}

my @subs = qw(info debug);
for (@subs) {
    my $code = __PACKAGE__->can($_) or die;
    no strict 'refs';
    no warnings 'redefine';
    *{"Rex::Logger::$_"} = $code;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Rex::Logger::ToLogAny - Rexでのログを、Log::Anyに流します。

=head1 SYNOPSIS

Rexでのログを、Log::Anyに流すようにします。

Log::Logger::(info|debug)を上書きします。

    @@ Rexfile

    use Rex::Logger::ToLogAny;

    task "..." => sub {
        ...
    };

=cut

1;
