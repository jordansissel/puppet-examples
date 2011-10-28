# Functions invoking lookupvar

From this directory, run:

    puppet apply --modulepath .  -e '$fizzle = "testing" notice(helloworld())'
     
Output:

    notice: Scope(Class[main]): testing

