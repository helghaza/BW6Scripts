# Install BW6
Commands to install TIBCO BusinessWorks 6.6 in MacOS environment

## Install following softwares
* TIBCO BusinessWorks 6.6
* TIBCO EMS 8.5
* TIBCO TEA 2.3
* PostgreSQL

## PostgreSQL database setup :

* Create schema bwadmindb
* Create user bwadmin

## BusinessWorks setup
### Add EMS driver to BW6
* Go to `<TIBCO_HOME>\bw\6.6\bin` directory
* Execute command
`
bwinstall ems-driver
`
* The following display appears:
```
Buildfile: /opt/tibco642/bw/6.4/scripts/bwinstall.xml
ems-driver:
-init-bw:
-ems-home-location:
    [input] Please enter full path to the EMS Home components plugin folder including the components folder (typically  EMS_HOME/components//shared/1.0.0/plugins) :
```
* Enter path of EMS plugins (using TIBCO_HOME and not EMS_HOME as displayed)
``
<TIBCO_HOME>\components\shared\1.0.0\plugins
``
* Check installation complete without error :
```
./install-ems-driver:
BUILD SUCCESSFUL
Total time: 42 seconds
```
### Configuration of BW6 agent
*	Edit the config file  `<TIBCO_HOME>\int\tibco\bw\6.4\config\bwagent_db.json`

```
{
adminmode: enterprise,
adminpersistencetype: dbems,
httpport: 8079,

...

db: true,
dbtype: postgresql,
dbdriver: "org.postgresql.Driver",
dbconnectionurl: "jdbc:postgresql://localhost:5432/bw6",
dbuser: bwadmin,
dbpassword: bwadmin,
emsserverurl: "tcp://localhost:7222",
emsusername: admin,
emsuserpassword: "",

...

tea: true,
teaserverurl: "http://localhost:8777/tea",
statsprovider: true,
providertechnology: "db",
dbprovidertype: postgresql,
dbproviderdriver: "org.postgresql.Driver",
dbproviderconnectionurl: "jdbc:postgresql://localhost:5432/bw6",
dbprovideruser: bwadmin,
dbproviderpassword: bwadmin,

...

governancejmsserverurl: "tcp://localhost:7222",
governancejmsusername: admin,
governancejmsuserpassword: "",
...
}

```

* Check installation complete when launching BW6 agent :
```
./bwagent 
TIBCO ActiveMatrix BusinessWorks version 6.6.0, hotfix 2, build V67, 2020-03-05
15:33:10.214 WARN  [main] org.eclipse.jetty.server.Server - ErrorPageMapper not supported for Server level Error Handling
TIBCO-BW-AGENT-300002: BusinessWorks Agent started successfully.
````
If everything fine, you can use the scripts above.

## Built With

* [TIBCO](http://www.tibco.com/)
* [TIBCO Community](https://community.tibco.com/)
* [TIBCO Docs](https://docs.tibco.com/)

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **[Hicham EL GHAZALI](https://www.linkedin.com/in/hichamelghazali/)** 

## License

This project is licensed under the MIT License 
