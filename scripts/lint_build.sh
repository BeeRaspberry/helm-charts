#!/bin/bash

function check_api_chart () {
  DIFF=$(git diff HEAD^ HEAD charts/bee-api/Chart.yaml)
  if [[ ! -z "$DIFF" ]]; then
    VERSION=$(grep appVersion: charts/bee-api/Chart.yaml | awk -F ': ' '{print $NF}')
    printf "/- name: bee-api/" >sed-command
    printf '!b;n;c\ \ version: ' >>sed-command
    printf "${VERSION}" >>sed-command
    sed -f sed-command Chart.yaml
    return 1
  fi

  return 0
}

function check_ui_chart () {
  DIFF=$(git diff HEAD^ HEAD charts/bee-ui/Chart.yaml)
  if [[ ! -z "$DIFF" ]]; then
    VERSION=$(grep appVersion: charts/bee-ui/Chart.yaml | awk -F ': ' '{print $NF}')
    printf "/- name: bee-ui/" >sed-command
    printf '!b;n;c\ \ version: ' >>sed-command
    printf "${VERSION}" >>sed-command
    sed -f sed-command Chart.yaml
    return 1
  fi

  return 0
}

