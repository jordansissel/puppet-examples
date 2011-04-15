# Functions returning a hash

From this directory, run:

    puppet apply --modulepath . -e '$myvar = helloworld()   notice($myvar["Hello"])'

Output:

    notice: Scope(Class[main]): World

