#-*- coding:utf-8 -*-

'''
this is for telnet function, you can run it on linux by standalone or called by bat script on windows(make sure you have PVM on windows)
'''

__author__ = 'Wallance Hou'

#!/usr/bin/python
#
#Author: Wallance Hou
#Date: 08/16/2017

# socket for telnet program
import socket, select, string, sys

def mytelnet(host,port):

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(5)
    try:
        s.connect((host, port))
    except socket.gaierror,e:
        print("***%s name can't be resolved" % (host))
        sys.exit()
    except socket.timeout,e:
        print("***connect to %s on port %d timeout" % (host,port))
        sys.exit()
    except:
        #print("\033[31;1mUnable to connect %s on port %d\033[0m" % (host, port))
        print("[Failed]: Unable to connect %s on port %d" % (host, port))
        sys.exit()
    else:
        #print("\033[32;1mConnected to %s on port %d\033[0m" % (host, port))
        print("[Succeed]: Connected to %s on port %d" % (host, port))
	

if __name__ == "__main__":

    try:
        host = raw_input('Hostname: ').strip()
        port = raw_input('Port: ').strip()
        if host and port:
            if port.isdigit():
                port = int(port)
                mytelnet(host,port)
            else:
                print "port error"
        else:
            print "input empty"
            sys.exit(255)
    except KeyboardInterrupt,e:
	    print e
