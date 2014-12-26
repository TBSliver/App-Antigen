requires 'Moo';
requires 'MooX::Options';
requires 'YAML::Tiny';
requires 'Path::Tiny';

on test => sub {
    requires 'Test::More', '0.96';
};
