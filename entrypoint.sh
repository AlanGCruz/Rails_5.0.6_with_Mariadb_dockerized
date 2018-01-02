#!/bin/bash
bundle check || bundle update && bundle install --clean
rails s
tail -f /dev/null
