<img src="https://github.com/SwiftVISA/CoreSwiftVISA/blob/master/SwiftVISA%20Logo.png" width="512" height="512">

# NISwiftVISAService

NISwiftVISAService is a proccess that runs in the background that allows the NISwiftVISA framework to communicate with NI-VISA's C framework. This service is necessary becuase NI only distributes binaries of its NI-VISA C framework. Because SwiftVISA is built using the Swift Package Manager, it requires that all dependencies be open source. To circumvent this requirement, the NISwiftVISA framework uses interprocess communicaiton to have this service make calls to NI-VISA's C framework on its behalf. Becuase this process must communicate with the closed source framework, it does not use the Swift Package Manager (although it does have dependencies from the Swift Package Manager). This package is required in order to use NISwiftVISA.

## Requirements.

- Swift 5.0+
- macOS 11.0+ (Big Sur)
- 64-bit Intel proccessor (Apple Silicon not supported)
- [NI-VISA 20.0+](https://www.ni.com/en-us/support/downloads/drivers/download.ni-visa.html#351229)

## Installation.

Before installing, make sure that you have installed [NI-VISA 20.0](https://www.ni.com/en-us/support/downloads/drivers/download.ni-visa.html#351229) or later. To install NISwiftVISAService, navigate to the [releases page](https://github.com/SwiftVISA/NISwiftVISAService/releases). Then download the file NISwiftVISAService.zip. Unzip and open this folder. This folder contains a README.txt file that explains further installation instructions. You will need to restart your computer after installation.


## Contributions and Comments

This project is a slow-moving "labor-of-love" for our group and intended additional features are worked on sporadically based upon need, time, and our ability to deal with Apple's poor documentation.  Currently, the bulk of our efforts are put into SwiftVISASwift (https://github.com/SwiftVISA/SwiftVISASwift).  We would love help and please e-mail me (or to reply to the relevant issue or open a new one).

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owner of this repository before making a change.

### All Code Changes Happen Through Pull Requests

1. Fork the repo and create your branch from `master`.
2. Make sure the syle of your code is consistent with that of the current one (indentation, etc.).
3. If you've changed any relevant functionalities, update the documentation.
4. Ensure the application is working correctly.
5. Issue that pull request.

### Code of Conduct

Use common sense (source: https://github.com/gasparl/possa/blob/master/CONTRIBUTING.md)

Examples:

* Be respectful of differing viewpoints and experiences
* Gracefully accept constructive criticism
* Focus on what is best for the community
* Have empathy towards other community members

Examples of unacceptable behavior by participants include:

* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information without explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting
  
 
### Reporting Issues or Problems
* Please submit an Issue if you have any problems with any SwiftVISA frameworks/packages
* Please submit an Issue if you need any help installing or working with any of the SwiftVISA Frameworks/Packages
