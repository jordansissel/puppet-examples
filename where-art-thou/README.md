# Find where a module is loaded from

This trick uses a template, $settings::modulepath, and __FILE__ from a template
to find the location of a template (and thus its module) relative to the puppet
module path.


From this directory, run:

    % puppet apply --modulepath . -e 'include whereareyou'

Output:

    notice: Scope(Class[Whereareyou]): [".", "whereareyou/templates/example.erb"]

The output above is ["module path for this file", "file path relative to the modulepath"]

Another example run with multiple module paths:

    % puppet apply --modulepath /tmp:../where-art-thou  -e 'include whereareyou'
    notice: Scope(Class[Whereareyou]): ["../where-art-thou", "whereareyou/templates/example.erb"]

