#!/bin/bash

USER_ID=$(id -u)

if [ !USER_ID -eq 0 ]
then
    echo "Not a Root user"
else
    echo "Root user"
fi