# hanami-demo-app


Hanami.prepare

When you call Hanami.prepare (or use require "hanami/prepare") Hanami will make its app available, but components within the app container will be lazily loaded.
This is useful for minimizing load time. It’s the default mode in the Hanami console and when running tests.


Hanami.boot

When you call Hanami.boot (or use require "hanami/boot") Hanami will go one step further and eagerly load all components up front.
This is useful in contexts where you want to incur initialization costs at boot time, such as when preparing your application to serve web requests. It’s the default when running via Hanami’s puma setup (see config.ru).


A Hanami slice:

has its own container
imports a number of standard components from the app
can have its own providers (e.g. slices/api/config/providers/my_provider.rb)
can include actions, routable from the application’s router
can import and export components from other slices
can be prepared and booted independently of other slices
can have its own slice-specific settings (e.g. slices/api/config/settings.rb)
