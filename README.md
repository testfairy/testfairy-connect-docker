# TestFairy Connect (Docker)

#### Installation

Pull the docker image:

```
docker pull testfairy/testfairy-connect:latest
```

Configure TestFairy Connect, needed only once:

```
docker run -i -t -v config.json:/config.json testfairy/testfairy-connect:latest configure
```

And now follow the interactive wizard that is displayed on screen. Documentation for this process is
available at https://docs.testfairy.com/Bug_Tracking/TestFairy_Connect.html

#### Running

Now that you have TestFairy Connect configured, run it with:

```
docker run -d -v config.json:/config.json testfairy/testfairy-connect:latest
```

