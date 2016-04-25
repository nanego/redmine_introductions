Redmine Introductions plugin
======================

This redmine plugin add the ability to display introductions for features and to create step-by-step users guide.

It is based on the Intro.js project (http://usablica.github.io/intro.js/).

Example
------------

![redmine_introductions screenshot](http://blog.nanego.com/images/redmine_plugin_introductions.png)

![redmine_introductions configuration_example](https://cloud.githubusercontent.com/assets/1620522/14710594/44e578ce-07d6-11e6-9a22-9b224a3f10b3.png)

Installation
------------

This plugin is compatible with Redmine 2.1.0+.

Please apply general instructions for plugins [here](http://www.redmine.org/wiki/redmine/Plugins).

First download the source or clone the plugin and put it in the "plugins/" directory of your redmine instance. Note that this is crucial that the directory is named 'redmine_introductions'!

Then execute:

    $ bundle install
    $ rake redmine:plugins

And finally restart your Redmine instance.


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
