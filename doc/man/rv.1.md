# rv 1 "June 2013" rv "User Manuals"

## SYNOPSIS

`rv` [RUBY] [COMMAND]

## DESCRIPTION

Activates a ruby interpreter and gem environment.

https://github.com/regularfry/rv#readme

## ARGUMENTS

*RUBY*
	Chruby-compatible name of an installed ruby

*COMMAND*
	Optionally specify the command to run.  Defaults to $SHELL.


## ENVIRONMENT VARIABLES

*GEMENV*
	Location of the gem environment to activate (default `.env/$RUBY`)


## EXAMPLES

Install a version of ruby, create a gem environment and activate it:

    $ ruby-install ruby 1.9.3
    $ rv-init 1.9.3
    $ rv 1.9.3

Create a named gem environment and activate it with a specific shell:

    $ GEMENV=myapp rv-init 1.9.3
    $ GEMENV=myapp rv 1.9.3 /bin/dash

## FILES

*.env/$ruby*
	Default gem environment location, as generated by `gemenv`.


## AUTHOR

Alex Young <alex@blackkettle.org>

## SEE ALSO

rv-init(1), ruby(1), gem(1), chruby(1), chruby-exec(1)