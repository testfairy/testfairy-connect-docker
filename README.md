# testfairy-connect-docker
Dockerfile for TestFairy Connect

## Requirements:
- TestFairy account
- Docker installed
- One of the issue tracking systems supported by TestFairy Connect https://docs.testfairy.com/TestFairy_Connect/Overview.html

## In order to run TestFairy Connect in docker

1. Configure TestFairy Connect `docker run -v ~/.testfairy-connect/config.json:/etc/testfairy-connect/config.json -it testfairy/testfairy-connect configure`
1. Run TestFairy Docker conatainer `docker run -v ~/.testfairy-connect/config.json:/etc/testfairy-connect/config.json -d testfairy/testfairy-connect`
