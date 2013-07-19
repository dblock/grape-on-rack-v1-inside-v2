Grape API w/ Versioning Fallback
================================

[![Build Status](https://secure.travis-ci.org/dblock/grape-on-rack-v1-inside-v2.png)](http://travis-ci.org/dblock/grape-on-rack-v1-inside-v2)

A [Grape](http://github.com/intridea/grape) API mounted on Rack with two versions where `v2` builds incrementally on top of `v1`. In this example the `ping` method is only implemented on version `v1`, while the root method is implemented on both versions.

Run
---

```
$ bundle install
$ rackup
```

Try
---

```
# without a version

curl http://localhost:9292/
{"version":"v2"}

curl http://localhost:9292/ping
{"ping":"pong"}

# version v2 (current)

curl http://localhost:9292 -H "Accept:application/vnd.acme-v2+json"
{"version":"v2"}

curl http://localhost:9292/ping -H "Accept:application/vnd.acme-v2+json"
{"ping":"pong"}

# version v1 (old)

curl http://localhost:9292 -H "Accept:application/vnd.acme-v1+json"
{"version":"v1"}

curl http://localhost:9292/ping -H "Accept:application/vnd.acme-v1+json"
{"ping":"pong"}
```
