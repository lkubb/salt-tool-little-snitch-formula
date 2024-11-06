Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_snitch``
~~~~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_snitch.package``
~~~~~~~~~~~~~~~~~~~~~~~
Installs the Little Snitch package only.


``tool_snitch.license``
~~~~~~~~~~~~~~~~~~~~~~~



``tool_snitch.clean``
~~~~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_snitch`` meta-state
in reverse order.


``tool_snitch.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the Little Snitch package.


``tool_snitch.license.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



