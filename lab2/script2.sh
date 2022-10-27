#!/bin/bash

ps -Af | grep "/sbin/" | awk '{print $2}'
