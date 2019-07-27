#!/bin/bash

appname='appname1234567abc'

npm init --yes
npm install --save express


git init
git add -A
git commit -m 'first commit'

eb init $appname
eb deploy
eb open