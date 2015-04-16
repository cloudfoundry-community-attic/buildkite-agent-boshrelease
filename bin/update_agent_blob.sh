#!/bin/bash

agent_path=$1; shift
if [[ "${agent_path}X" == "X" ]]; then
  echo "USAGE ./bin/update_agent_blob.sh path/to/buildkite-agent-linux-amd64-1.0-beta.23.450.tar.gz"
  exit 1
fi

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd $DIR/..
  rm -rf blobs/*agent
  mkdir -p blobs/agent
  cp ${agent_path} blobs/agent
popd
