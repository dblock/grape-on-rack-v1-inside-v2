Grape API w/ Versioning Fallback
================================

[![Build Status](https://secure.travis-ci.org/dblock/grape-on-rack-v1-inside-v2.png)](http://travis-ci.org/dblock/grape-on-rack-v1-inside-v2)

A [Grape](http://github.com/intridea/grape) API mounted on Rack with two versions where `v2` builds incrementally on top of `v1`. In this example the `only_in_v1` method is only implemented on version `v1`, while the root method is implemented on both versions.

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

curl http://localhost:9292/only_in_v1
{"only_in_v1":"true"}

curl http://localhost:9292/in_both_v1_and_v2
{"in_both_v1_and_v2":"v2"}

# version v2 (current)

Implemented in v2.

curl http://localhost:9292 -H "Accept:application/vnd.acme-v2+json"
{"version":"v2"}

Implemented in v1 and inherited by v2.

curl http://localhost:9292/only_in_v1 -H "Accept:application/vnd.acme-v2+json"
{"only_in_v1":"true"}

Implemented in v2.

curl http://localhost:9292/only_in_v2 -H "Accept:application/vnd.acme-v2+json"
{"only_in_v2":"true"}

curl http://localhost:9292/in_both_v1_and_v2 -H "Accept:application/vnd.acme-v2+json"
{"in_both_v1_and_v2":"v2"}

# version v1 (old)

curl http://localhost:9292 -H "Accept:application/vnd.acme-v1+json"
{"version":"v1"}

curl http://localhost:9292/only_in_v1 -H "Accept:application/vnd.acme-v1+json"
{"only_in_v1":"true"}

curl http://localhost:9292/in_both_v1_and_v2 -H "Accept:application/vnd.acme-v1+json"
{"in_both_v1_and_v2":"v1"}
```
