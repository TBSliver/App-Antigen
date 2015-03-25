# NAME

App::Antigen - Plugin Manager for Zsh

# SYNOPSIS

    use App::Antigen;

    my $app = App::Antigen->new_with_options( plugins => \@plugins );
    $app->run;

# DESCRIPTION

App::Antigen is the underlying code for the antigen-perl tool, which is used
for managing Zsh plugins. This module is still under development, and so the
interface is subject to change as new features are added, and bugs are found.

## Todo

There are many things which are still to do in this, including supporting
upgrades to the plugins as hosted on github, as well as adding support for
other targets such as normal git repos, tarball downloads, and local files and
folders. As said before, this module is still under development, and may change
entirely without warning.

## Attributes

These are the attributes provided (using MooX::Options). These can also be put
in the configuration file - see [antigen-perl](https://metacpan.org/pod/antigen-perl)

### output

This it the output folder into which all the plugin repositories and code will
be put. Defaults to $HOME/.antigen-perl

### repo

This is the folder where all the repositories will be stored. Defaults to
$HOME/.antigen-perl/repos

### output\_file

This is the file which will contain all the calls to the various plugins for
zsh to load. Defaults to $HOME/.antigen-perl/antigen-perl.zsh

### plugins

This contains an array of hashrefs of the plugins, with the keys as the method/place to
get the plugins from. Currently only accepts one method for getting the
plugins, github. An example plugin config:

    my $plugins = [
      github => "TBSliver/zsh-theme-steeef",
      github => "TBSliver/zsh-plugin-extract"
    ];

## Methods

These are the various methods which are provided, either for internal use or
for basic usage.

### run

This is the main method of App::Antigen, and when called will actually build
the entire plugin structure, according to the plugin options specified.

### gen\_github\_url

This function generates the github repository URL as required for getting the
plugins.

### gen\_plugin\_target

This function performs a regex on the github url, replacing all colons (:) with
'-COLON-', and all slashes (/) with '-SLASH-'. This is then used as the folder
name for the github target.

### github\_cmd

This function pulls together the github url and target folder, and actually
performs the git command using a call out to system.

### find\_plugin

This finds all the plugins inside the repo directory with a file extension of
\*.plugin.zsh and addes them to the plugin list. This will find every occurance
of a file with that plugin extension.

### write\_output\_file

This takes all the plugins found with the correct extension, and puts them in a
single file ready to be added to your .zshrc

# AUTHOR

Tom Bloor <tom.bloor@googlemail.com>

# COPYRIGHT

Copyright 2014- Tom Bloor

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[antigen-perl](https://metacpan.org/pod/antigen-perl), [MooX::Options](https://metacpan.org/pod/MooX::Options)
