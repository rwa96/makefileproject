## Sample makefile project for C/C++ development on linux
This repository contains a Makefile and some instructions on how to use it.

***

### Setup
Usually my projects inclue the following folders:
*	**bin**
	*The output executables go here, both for the app and for any tests and spikes.*
*	**build**
	*This folder contains all object files, and is removed on a clean.*
*	**doc**
	*Project documentation files*
*	**config**
	*config files*
*	**include**
	*All project headers files. All necessary third-party header files that do not exist under /usr/local/include are also placed here*
*	**lib**
	*Any libs that get compiled by the project, third party or any needed in development.
	Prior to deployment, third party libraries get moved to **/usr/local/lib** where they belong leaving
	the project clean enough to compile on our Linux deployment servers. Ireally use this to test different librariy versions than the standard*
*	**src**
	*The application and only the application's source files*
*	**test**
	*All test code files. You do write tests, no?*

***

### Workflow
1.	**Build**
	To trigger a build, simply use the default goal by typing "*make*" in console. All files with a specified file extenxion **SRCEXT** from the source folder will be compiled and stored in the **build** directory.
	The final binary is then stored in **bin**.
2.	**Clean**
	Type "*make clean*" to remove all compiled files (**build** and **bin**)
3.	**Test**
	To compile the a test binary you need a single file "*test/tester.SRCEXT*".
	The command "*make tester*" compiles this file.

***

### Note
Since every OS has its own include paths you can **override includes** by setting **INC environment variable**.
```
export INC="-I/own/include/path"
```
