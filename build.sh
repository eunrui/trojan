#!/bin/bash
#获取当前的这个脚本所在绝对路径
shell_path=$(cd `dirname $0`; pwd)


cd $shell_path

version=`git describe --tags $(git rev-list --tags --max-count=1)`
now=`TZ=Asia/Shanghai date "+%Y%m%d-%H%M"`
go_version=`go version|awk '{print $3,$4}'`
git_version=`git rev-parse HEAD`
ldflags="-w -s -X 'trojan/trojan.MVersion=$version' -X 'trojan/trojan.BuildDate=$now' -X 'trojan/trojan.GoVersion=$go_version' -X 'trojan/trojan.GitVersion=$git_version'"

GOOS=linux GOARCH=amd64 go build -ldflags "$ldflags" -o "result/trojan-linux-amd64" .
