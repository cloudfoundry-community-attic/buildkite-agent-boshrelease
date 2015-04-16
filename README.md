Manage BuildKite worker cluster with BOSH
=========================================

If you're using BOSH, you can bootstrap, scale, resize, destroy your [BuildKite](https://buildkite.com) cluster using this BOSH release:

![agents-running](http://cl.ly/image/161B102R311o/buildkite-agents.png)

This was as simple as:

```
./templates/make_manifest warden TOKEN 3
```

Usage
-----

To use this bosh release, first upload it to your bosh:

```
git clone https://github.com/cloudfoundry-community/buildkite-agent-boshrelease.git
cd buildkite-agent-boshrelease
bosh create release
bosh upload release
```

For [bosh-lite](https://github.com/cloudfoundry/bosh-lite), you can quickly create a deployment manifest & deploy a cluster:

```
templates/make_manifest warden TOKEN 1
bosh -n deploy
```

For AWS EC2, create a single VM:

```
templates/make_manifest aws-ec2 TOKEN 1
bosh -n deploy
```

### Resize cluster

In the examples above, the suffix `1` is the number of nodes. Change it to scale out:

```
templates/make_manifest warden TOKEN 3
bosh -n deploy
```

Will add two BuildKite workers.
