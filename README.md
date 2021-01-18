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
