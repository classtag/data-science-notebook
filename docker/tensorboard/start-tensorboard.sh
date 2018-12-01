#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

exec tensorboard --logdir /tflogs --host 0.0.0.0 
