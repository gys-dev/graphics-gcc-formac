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
1. Pull from internet
```
docker pull ducy23061999/graphic-gcc
```
2. Run container

```
docker run -it \
--name graphicgcc \     
-v [path_to_working_directory]:/home \
-e DISPLAY=192.168.1.3:0 \
ducy23061999/graphic-gcc bin/bash \
```
*Change*:
<br> 
[path_to_working_directory]: c++ source list you put in a directory. Remember remove [] =))
<br>
192.168.1.3:0: Your ip address. Change [IP]:0. Type ifconfig to see all available ip
<br>

Keep session terminal. You'll need it to complie c++ source file. Keep working and check it out

```
cd home && ls
```
You'll see all file that you just mount. Not we done to setup. 
### COMPLIE
```
g++ [source_file_name].cpp -o  [destination_file_name].out  -lgraph
```
Ex: g++ file_in.cpp -o  file_out.out  -lgraph
### RUN
```
./[destination_file_name].out
```
Ex: ./file_out.out