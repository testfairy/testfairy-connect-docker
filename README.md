# TestFairy Connect (Docker)

#### Installation

Let's configure TestFairy Connect. This is needed only once. Docker will automatically download the latest version.

```
# Replace the $PWD argument with a directory of your choice to store your TestFairy Connect configuration.
docker run -i -t -v $PWD:/etc/testfairy-connect testfairy/testfairy-connect:latest configure
```

If there are no issue, you can now follow the interactive wizard that is displayed on screen. Documentation for this process is available at https://docs.testfairy.com/Bug_Tracking/TestFairy_Connect.html

#### Running

Now that you have TestFairy Connect configured, run it with:

```
# Replace the $PWD argument with the directory which holds your TestFairy Connect configuration.
docker run -d -v $PWD:/etc/testfairy-connect --restart=always testfairy/testfairy-connect:latest
```

#### Troubleshooting

- SELinux: If you are having permission errors related to your docker volume, you can either try attaching volume in relaxed SELinux mode or disable SELinux enforcement entirely.
  - Use these commands to attach volume in relaxed SELinux mode:
  ```
  docker run -i -t -v $PWD:/etc/testfairy-connect:z testfairy/testfairy-connect:latest configure
  docker run -d -v $PWD:/etc/testfairy-connect:z --restart=always testfairy/testfairy-connect:latest start
  ```
  - Alternatively, you can disable SELinux altogether by running:
  ```
  sudo setenforce 0
  ```
  


