.. _readme:

Little Snitch Formula
=====================

Manages Little Snitch in the user environment.

.. contents:: **Table of Contents**
   :depth: 1

Usage
-----
Applying ``tool_snitch`` will make sure ``snitch`` is configured as specified.

Configuration
-------------

This formula
~~~~~~~~~~~~
The general configuration structure is in line with all other formulae from the `tool` suite, for details see :ref:`toolsuite`. An example pillar is provided, see :ref:`pillar.example`. Note that you do not need to specify everything by pillar. Often, it's much easier and less resource-heavy to use the ``parameters/<grain>/<value>.yaml`` files for non-sensitive settings. The underlying logic is explained in :ref:`map.jinja`.

User-specific
^^^^^^^^^^^^^
The following shows an example of ``tool_snitch`` per-user configuration. If provided by pillar, namespace it to ``tool_global:users`` and/or ``tool_snitch:users``. For the ``parameters`` YAML file variant, it needs to be nested under a ``values`` parent key. The YAML files are expected to be found in

1. ``salt://tool_snitch/parameters/<grain>/<value>.yaml`` or
2. ``salt://tool_global/parameters/<grain>/<value>.yaml``.

.. code-block:: yaml

  user: {}

  #   _______________
  #  < many settings >
  #   ---------------
  #          \   ^__^
  #           \  (xx)\_______
  #              (__)\       )\/\
  #               U  ||----w |
  #                  ||     ||

Formula-specific
^^^^^^^^^^^^^^^^

.. code-block:: yaml

  tool_snitch:

      # Specify an explicit version (works on most Linux distributions) or
      # keep the packages updated to their latest version on subsequent runs
      # by leaving version empty or setting it to 'latest'
      # (again for Linux, brew does that anyways).
    version: latest

      # Find license in /Library/Application Support/Objective Development/Little Snitch/registration.xpl
      # after having activated Little Snitch manually once.
    license: |-
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>d8e8fca2dc0</key>
        <data>
        PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXAK
        </data>
        <key>57a54c8e2</key>
        <dict>
          <key>owner</key>
          <string>user</string>
        </dict>
        <key>b5470458133</key>
        <data>
        PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwCg==
        </data>
      </dict>
      </plist>

This license is a made-up example, of course (verify: ``echo 'PCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwCg==' | base64 -d``). I'm currently hoping this is derived from your registration data only and therefore installable automatically.
Find ``/Library/Application Support/Objective Development/Little Snitch/registration.xpl`` after registering Little Snitch and paste its contents into the pillar.

<INSERT_STATES>

Development
-----------

Contributing to this repo
~~~~~~~~~~~~~~~~~~~~~~~~~

Commit messages
^^^^^^^^^^^^^^^

Commit message formatting is significant.

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

pre-commit
^^^^^^^^^^

`pre-commit <https://pre-commit.com/>`_ is configured for this formula, which you may optionally use to ease the steps involved in submitting your changes.
First install  the ``pre-commit`` package manager using the appropriate `method <https://pre-commit.com/#installation>`_, then run ``bin/install-hooks`` and
now ``pre-commit`` will run automatically on each ``git commit``.

.. code-block:: console

  $ bin/install-hooks
  pre-commit installed at .git/hooks/pre-commit
  pre-commit installed at .git/hooks/commit-msg

State documentation
~~~~~~~~~~~~~~~~~~~
There is a script that semi-autodocuments available states: ``bin/slsdoc``.

If a ``.sls`` file begins with a Jinja comment, it will dump that into the docs. It can be configured differently depending on the formula. See the script source code for details currently.

This means if you feel a state should be documented, make sure to write a comment explaining it.

Todo
----
* manage Little Snitch rules with custom states (would need scripting enabled)
