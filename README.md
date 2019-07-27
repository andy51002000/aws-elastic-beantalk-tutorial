# Firt, Setup your Environment

You have to configure your aws cli with app ID, key, and region

```bash
initial_setup.sh
```


# Second, Create resources on cloud

You might need to check the available dns name

aws elasticbeanstalk check-dns-availability --cname-prefix andyapp123
# {
#     "Available": true,
#     "FullyQualifiedCNAME": "my-cname.elasticbeanstalk.com"
# }

Then create an application on Elastica beanstalk

```bash
setup_elastic_beanstalk.sh
```

#Third, Deploy

```bash
push-to-cloud.sh
```

