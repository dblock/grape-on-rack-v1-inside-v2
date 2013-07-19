Grape API on Rack
=================

[![Build Status](https://secure.travis-ci.org/dblock/grape-on-rack-v1-inside-v2.png)](http://travis-ci.org/dblock/grape-on-rack-v1-inside-v2)

A [Grape](http://github.com/intridea/grape) API mounted on Rack with two versions where `v2` builds incrementally on top of `v1`.

Run
---

```
$ bundle install
$ rackup
```

Explore the API
---------------

Explore the API using [Swagger UI](http://petstore.swagger.wordnik.com). Run the application and point the explorer to `http://localhost:9292/api/swagger_doc`.
