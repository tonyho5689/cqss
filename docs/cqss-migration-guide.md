# CQSS Project: Ant to Maven Migration Guide

## 1. Overview

This document provides a step-by-step guide for migrating the CQSS project from Ant to Maven. The CQSS project is a multi-module Java EE application built for WebSphere Application Server with various dependencies.

## 2. Project Structure

The current project has the following modules:

```
cqss/
├── CqssApplet            # Java applet module
├── CqssBatchJobDB        # Batch job database module
├── CqssCommon            # Common utilities and shared classes
├── CqssDB                # Database access layer
├── CqssEjbTestClient     # EJB test client
├── CqssEjbUtil           # EJB utility classes
├── CqssIntraEAR          # EAR packaging module
├── CqssIntraEjb          # Intranet EJB module
├── CqssIntranetWeb       # Intranet web application
├── CqssSecurityAdmin     # Security administration module
├── CqssStartup           # Application startup module
├── CqssSvr               # Server module
├── CqssVo                # Value Objects (VO)
└── Ibator                # iBATIS code generator
```

After migration, the Maven project structure will be:

```
cqss/
├── pom.xml               # Parent POM
├── CqssApplet/           # Java applet module
├── CqssBatchJobDB/       # Batch job database module
├── CqssCommon/           # Common utilities and shared classes
├── CqssDB/               # Database access layer
├── CqssEjbTestClient/    # EJB test client
├── CqssEjbUtil/          # EJB utility classes
├── CqssIntraEAR/         # EAR packaging module
├── CqssIntraEjb/         # Intranet EJB module
├── CqssIntranetWeb/      # Intranet web application
├── CqssSecurityAdmin/    # Security administration module
├── CqssStartup/          # Application startup module
├── CqssSvr/              # Server module
├── CqssVo/               # Value Objects (VO)
└── Ibator/               # iBATIS code generator
```

## 3. Migration Steps

### 3.1. Create Maven Project Structure

1. Create the parent directory structure
2. Create module directories with Maven standard directory layout
3. Move source files to appropriate Maven directories

### 3.2. Install Custom Dependencies

Many of the dependencies used in the project are custom or internal libraries that may not be available in public Maven repositories. These need to be installed in a local Maven repository.

```bash
# Create a directory for the local repository
mkdir -p cqss-repo/repository

# Install each JAR file to the local repository
mvn install:install-file \
    -Dfile=path/to/file.jar \
    -DgroupId=group-id \
    -DartifactId=artifact-id \
    -Dversion=version \
    -Dpackaging=jar \
    -DlocalRepositoryPath=./cqss-repo/repository
```

A script has been provided in `scripts/install-dependencies.bat` to automate this process.

### 3.3. Create POM Files

1. Create parent POM file at the root of the project
2. Create module-specific POM files in each module directory

Example POM files have been provided in the `examples/poms/` directory.

### 3.4. Configure Maven Plugins

Configure Maven plugins to replicate the functionality of the Ant build scripts:

- maven-compiler-plugin: For compiling Java sources
- maven-jar-plugin: For creating JAR files
- maven-war-plugin: For creating WAR files
- maven-ear-plugin: For creating EAR files
- maven-resources-plugin: For copying resources

### 3.5. Test and Verify

After setting up the Maven project structure and POM files, build the project to verify that everything works correctly:

```bash
# Build the entire project
mvn clean install

# Build a specific module
mvn clean install -pl CqssCommon

# Skip tests
mvn clean install -DskipTests

# Build EAR only
mvn clean install -pl CqssIntraEAR
```

## 4. Module-specific Migration Notes

### 4.1. CqssCommon

- Dependencies: log4j, commons-logging, AppCore, AppMsg, CyberUtilCommonForWas
- Maven packaging: jar

### 4.2. CqssStartup

- Dependencies: log4j, WnbLog, WebSphere APIs
- Maven packaging: jar

### 4.3. CqssVo

- Dependencies: commons-beanutils, WebSphere APIs
- Maven packaging: jar

### 4.4. CqssDB

- Dependencies: CqssVo, Spring, iBatis
- Maven packaging: jar

### 4.5. CqssEjbUtil

- Dependencies: Apache Commons libraries, Spring, CyberUtil, CqssCommon
- Maven packaging: jar

### 4.6. CqssIntraEjb

- Dependencies: Multiple CQSS modules, Spring, CyberUtil
- Maven packaging: ejb

### 4.7. CqssIntranetWeb

- Dependencies: CQSS modules, Struts, WebSphere libraries
- Maven packaging: war

### 4.8. CqssApplet

- Dependencies: JAWS library
- Maven packaging: jar

### 4.9. CqssIntraEAR

- Dependencies: All CQSS modules
- Maven packaging: ear

### 4.10. Other Modules

- CqssBatchJobDB, CqssSecurityAdmin, CqssSvr: Follow similar patterns based on their dependencies

## 5. Common Issues and Solutions

### 5.1. Class Path Issues

Maven uses a different class path resolution mechanism than Ant. Make sure all dependencies are correctly specified in the POM files.

### 5.2. Resource Filtering

Maven filters resources by default. If this causes issues with binary files, configure the maven-resources-plugin accordingly.

### 5.3. WebSphere Specific Configuration

WebSphere specific configuration might need special handling in Maven. Use the appropriate plugins or custom configurations.

## 6. Conclusion

This guide provides a comprehensive approach to migrating the CQSS project from Ant to Maven. Following these steps should result in a successfully migrated project that maintains all functionality and dependencies.
