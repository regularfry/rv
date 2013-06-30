rv
==

A trivial wrapper around the (chruby,gemsh) pair.  Use it to set up and
switch between gemsets and selected ruby interpreters as part of your
development workflow.

Installation
------------

    # make install

Usage
-----

To initialise a gemset for use with a specific ruby:

    $ ruby-install ruby 1.9.3   # must be done first
    $ rv-init 1.9.3

By default, this will generate a GEM\_HOME within the `.env/1.9.3/`
directory.  As the comment implies, the ruby must be installed before
running rv-init, but you don't have to use ruby-install to provide it.
Anything that installs a ruby which chruby can select will do.

To use the gemset you've just created:

    $ rv 1.9.3

This will launch a $SHELL process with ruby 1.9.3 selected, and the
gemset you've just created activated for you to work in.  If you now run
`gem install rails`, the gem will be installed into
`.env/1.9.3/gem_home`.

If you want to install gems when you create the gemset to save a step,
specify them to rv-init:

    $ rv-init 1.9.3 rails bundler rspec rspec-rails  # for instance

If you want a named gemset, you can specify it with the GEMENV
environment variable:

    $ GEMENV=.env/myrailsapp rv-init 1.9.3 rails bundler

This will create a gem environment at `.env/myrailsapp`, with the rails
and bundler gems installed by ruby 1.9.3.  You can activate it like so:

    $ GEMENV=.env/myrailsapp rv 1.9.3

If you want to run a command other than $SHELL in your gem environment,
pass it to `rv`:

    $ rv 1.9.3 ruby -v
    ruby 1.9.3p429 (2013-05-15 revision 40747) [x86_64-linux]


Details
-------

`rv` is a very thin wrapper around `chruby` and `gemsh`.  See
https://github.com/postmodern/chruby and
https://github.com/regularfry/gemsh for details of these projects.


Author
------

Alex Young <alex@blackkettle.org>

Makefile liberally plundered from
https://github.com/postmodern/ruby-install.
