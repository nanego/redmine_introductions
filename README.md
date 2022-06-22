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


## Test status

|Plugin branch| Redmine Version   | Test Status      |
|-------------|-------------------|------------------|
|master       | 4.2.7             | [![4.2.7][1]][5] |  
|master       | 4.1.7             | [![4.1.7][2]][5] |
|master       | master            | [![master][4]][5]|

[1]: https://github.com/nanego/redmine_introductions/actions/workflows/4_2_7.yml/badge.svg
[2]: https://github.com/nanego/redmine_introductions/actions/workflows/4_1_7.yml/badge.svg
[4]: https://github.com/nanego/redmine_introductions/actions/workflows/master.yml/badge.svg
[5]: https://github.com/nanego/redmine_introductions/actions


Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
