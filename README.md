# WHY??
In college, it have a subject call "computer graphic". Evethings we learn about algorithm draw line, shape, fill color,..
I must use graphics.h library to implement that algorithm. Sad thing it not support for mac os :))

So i figure out use docker to use linux by virural machine, write some script and hope your guy enjoy.

Here is my introduction!

# INSTALL 
## INSTALL COMPONENTS
1. Install docker and start
2. Install X11 environment

```
brew install xquartz
```
Open it and press [Command] + [,] to open setting preference window -> swich sercurity tab and enable some setting
![X11_Preference](https://miro.medium.com/max/1960/1*zMO-bPar1Z1AUUH-O2WBfw.png)

3. Install socat
```
brew install socat
```
Socat is a unix tool that creates two bidirectional streams between two endpoints. Our end goal is to create a connection between the docker container that runs a graphical application and the X window system on our OS X host operating system

So lets begin by creating a bridge between a network socket with a TCP listener on port 6000
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

## INSTALL CONTAINNER
