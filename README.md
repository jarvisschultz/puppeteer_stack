puppeteer_stack
===============

This is a git "supermodule" that contains all of the ROS packages used
in the Northwestern University NxR lab's marionette project.  It is
provided simply as a convenience to those wishing to gain access to
all of the individual repositories.  You can find more about the
project in general at [this page][lims]


Usage
-----

Submodules do not function exactly like normal git repositories.  If
you `git clone` this repository you wil not automatically have local
copies of all of the submodules loaded.  You must also run 

    git submodule init
    git submodule update

The submodules, by default, point to the urls of the host repositories
using the https protocol.  This is so that github is responsible for
automatically determining the permissions that you have for pushing
and pulling the submodules.  If you have push permissions, I recommend
you clone this repository using the https protocol as well.

You can read an excellent tutorial on git submodules at [this
page][subs]. More info on the https protocol can be found
[here][https]. To avoid excess password entry see [this link][pass].

Finally note that you can always clone the individual submodules
individually.


License
-------

Copyright (C) 2012 Jarvis Schultz, schultzjarvis@gmail.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

[lims]: http://nxr.northwestern.edu/research/scalable-algorithms-physical-systems/marionettes
[subs]: http://www.arlocarreon.com/blog/git/git-repo-inside-a-git-repo/
[https]: https://help.github.com/articles/which-remote-url-should-i-use
[pass]: https://help.github.com/articles/set-up-git#password-caching