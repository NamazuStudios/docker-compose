#!/usr/bin/env bash

chmod go-rwx setup/id_bogo
ssh -i setup/id_bogo -p 2022 elements@localhost

