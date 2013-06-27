# NAME

Rex::Logger::ToLogAny - Rexでのログを、Log::Anyに流します。

# SYNOPSIS

Rexでのログを、Log::Anyに流すようにします。

Log::Logger::(info|debug)を上書きします。

    @@ Rexfile

    use Rex::Logger::ToLogAny;

    # As you like
    use Log::Any::App '$log';
    Log::Any::App::init([
        -screen => { level => 'info' , pattern_style => 'plain_nl', },
        -file   => { level => 'debug', pattern_style => 'plain_nl', path => 'var/rex.log' },
    ]);

    task "..." => sub {
        ...
    };
