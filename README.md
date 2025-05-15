# CQSS Project

This repository contains the CQSS (Customer Query and Service System) project, migrated from Ant to Maven build system.

## Project Structure

The project consists of the following modules:

- **CqssApplet** - Java applet module
- **CqssBatchJobDB** - Batch job database module
- **CqssCommon** - Common utilities and shared classes
- **CqssDB** - Database access layer
- **CqssEjbTestClient** - EJB test client
- **CqssEjbUtil** - EJB utility classes
- **CqssIntraEAR** - EAR packaging module
- **CqssIntraEjb** - Intranet EJB module
- **CqssIntranetWeb** - Intranet web application
- **CqssSecurityAdmin** - Security administration module
- **CqssStartup** - Application startup module
- **CqssSvr** - Server module
- **CqssVo** - Value Objects (VO)
- **Ibator** - iBATIS code generator

## Migration from Ant to Maven

This project has been migrated from an Ant-based build system to Maven. The migration guide can be found in the [docs/cqss-migration-guide.md](docs/cqss-migration-guide.md) file.

## POM Files

Maven POM files have been provided for all modules in the project. These can be found in the [examples/poms](examples/poms) directory:

- [Parent POM](examples/poms/pom.xml) - The main POM file with common configuration for all modules
- [CqssApplet](examples/poms/CqssApplet/pom.xml) - Java applet module
- [CqssBatchJobDB](examples/poms/CqssBatchJobDB/pom.xml) - Batch job database module
- [CqssCommon](examples/poms/CqssCommon/pom.xml) - Common utilities module
- [CqssDB](examples/poms/CqssDB/pom.xml) - Database access layer
- [CqssEjbTestClient](examples/poms/CqssEjbTestClient/pom.xml) - EJB test client module
- [CqssEjbUtil](examples/poms/CqssEjbUtil/pom.xml) - EJB utility classes module
- [CqssIntraEAR](examples/poms/CqssIntraEAR/pom.xml) - EAR packaging module
- [CqssIntraEjb](examples/poms/CqssIntraEjb/pom.xml) - Intranet EJB module
- [CqssIntranetWeb](examples/poms/CqssIntranetWeb/pom.xml) - Intranet web application module
- [CqssSecurityAdmin](examples/poms/CqssSecurityAdmin/pom.xml) - Security administration module
- [CqssStartup](examples/poms/CqssStartup/pom.xml) - Application startup module
- [CqssSvr](examples/poms/CqssSvr/pom.xml) - Server module
- [CqssVo](examples/poms/CqssVo/pom.xml) - Value Objects module
- [Ibator](examples/poms/Ibator/pom.xml) - iBATIS code generator module

## Build Instructions

### Prerequisites

- JDK 1.8.0_152 or compatible version
- Maven 3.6 or later
- IBM WebSphere Application Server 9.0

### Setting up Custom Dependencies

Before building the project, you need to install the custom dependencies to a local Maven repository. Run the provided script:

```
scripts/install-dependencies.bat
```

This script will install the following types of dependencies:
- WNB Core libraries (AppCore.jar, AppMsg.jar, AppUtil.jar)
- WebSphere Core libraries (EjbCommon.jar, WnbLog.jar, etc.)
- CyberUtil libraries
- Other custom libraries

### Reorganizing Source Files

To reorganize the source files from the original Ant project structure to Maven's standard directory layout, run:

```
scripts/reorganize-source.bat
```

This script will:
- Create Maven standard directory structure for each module
- Move Java files to src/main/java
- Move resources to src/main/resources
- Handle special directories like ejbModule and WebContent

### Building the Project

To build the entire project:

```
mvn clean install
```

To build a specific module:

```
mvn clean install -pl ModuleName
```

To build the EAR file only:

```
mvn clean install -pl CqssIntraEAR
```

To skip tests during build:

```
mvn clean install -DskipTests
```

## Module Dependencies

The dependencies between modules are as follows:

- **CqssCommon**: Base module with common utilities
- **CqssStartup**: Depends on logging libraries and WebSphere core
- **CqssVo**: Value objects used by other modules
- **CqssDB**: Depends on CqssVo, provides database access
- **CqssEjbUtil**: Depends on CqssCommon and provides utilities for EJB modules
- **CqssIntraEjb**: Main EJB module that depends on most of the other modules
- **CqssIntranetWeb**: Web interface module
- **CqssIntraEAR**: Packages all modules into an EAR file for deployment

## External Dependencies

The project uses a number of external libraries:

- Apache Commons (logging, beanutils, digester, etc.)
- Spring Framework 2.5.5
- iBATIS 2.3.0.677
- Struts 1.2.9
- AspectJ 1.6.1
- Log4j 1.2.14
- And other custom libraries

## Deployment

After building the project, the EAR file can be found in the `CqssIntraEAR/target` directory. Deploy this file to WebSphere Application Server using the administrative console or wsadmin tool.

## Documentation

- [Migration Guide](docs/cqss-migration-guide.md) - Detailed guide for migrating from Ant to Maven
- Example POM files in the [examples/poms](examples/poms) directory
- Scripts for setting up the build environment in the [scripts](scripts) directory

## Issues and Solutions

If you encounter any issues during the build process, please check the migration guide for common issues and solutions.

## License

This project is proprietary and is not licensed for public use.