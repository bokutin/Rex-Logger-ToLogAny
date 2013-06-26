use strict;
use Test::More;
use Log::Any::Test; # should appear before 'use Log::Any'!
BEGIN { use_ok("Rex::Logger::ToLogAny") }
use Log::Any qw($log);

Rex::Logger::info("info-message");
Rex::Logger::debug("debug-message");

my $msgs = $log->msgs;
is( @$msgs, 2 );
like( $msgs->[0]{message}, qr/^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\] INFO - info-message$/  );
is( $msgs->[0]{level}, 'info' );
like( $msgs->[1]{message}, qr/^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\] DEBUG - debug-message$/ );
is( $msgs->[1]{level}, 'debug' );

done_testing();
