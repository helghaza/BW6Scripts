# BW6Scripts
Scripts to manage the TIBCO Software in MacOS environment

## List of scripts
* bwagent : manage TIBCO BusinessWorks agent
* ems : manage TIBCO EMS agent
* tea : manage TIBCO TEA agent
* gems.command : start GEMS
* startAll.sh : start EMS, BWAgent and TEA
* statusAll.sh: get the status of EMS, BWAgent and TEA
* stopAll.sh: stop EMS, BWAgent and TEA

## How to launch :

1 - Update the line with your installation path in each scripts bwagent, ems and tea:
```
export TIBCO_HOME=/opt/tibco/home/BW651
```
2 - add execution mode in these scripts 
```
  chmod +x *
```
3 - Enjoy !

## Built With

* [TIBCO](http://www.tibco.com/) - 
* [TIBCO Community](https://community.tibco.com/) - 
* [TIBCO Docs](https://docs.tibco.com/) - 

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **[Hicham EL GHAZALI](https://www.linkedin.com/in/hichamelghazali/)** 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
