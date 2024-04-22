#!/bin/bash

play start ${VIREO_PATH}

play pid ${VIREO_PATH}

tail -f /dev/null