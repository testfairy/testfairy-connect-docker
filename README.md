# TestFairy Connect (Docker)

#### Installation

Pull the docker image:

```
docker pull testfairy/testfairy-connect:latest
```

Configure TestFairy Connect, needed only once:

```
# Replace the $PWD argument with a directory of your choice to store your TestFairy Connect configuration.
docker run -i -t -v $PWD:/etc/testfairy-connect testfairy/testfairy-connect:latest configure
```

If you are having permission errors related to your docker volume, try attaching volume in relaxed SELinux mode.

```
# Replace the $PWD argument with a directory of your choice to store your TestFairy Connect configuration.
docker run -i -t -v $PWD:/etc/testfairy-connect:z testfairy/testfairy-connect:latest configure
```

Or you can run `setenforce 0` with administation rights to disable SELinux enforcement entirely if you are out of options.

If there are no issue, you can now follow the interactive wizard that is displayed on screen. Documentation for this process is
available at https://docs.testfairy.com/Bug_Tracking/TestFairy_Connect.html

#### Running

Now that you have TestFairy Connect configured, run it with:

```
# Replace the $PWD argument with the directory which holds your TestFairy Connect configuration.
docker run -d -v $PWD:/etc/testfairy-connect --restart=always testfairy/testfairy-connect:latest
```

Please note that if you had permission errors during configuration, you must also enable relaxed SELinux mode when you start your container.

```
# Replace the $PWD argument with the directory which holds your TestFairy Connect configuration.
docker run -d -v $PWD:/etc/testfairy-connect:z --restart=always testfairy/testfairy-connect:latest
```
