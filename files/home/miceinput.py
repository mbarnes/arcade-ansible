#!/usr/bin/python3
#
# Echos mouse device movement and button events to help
# diagnose problems with input devices posing as mice like
# trackballs and rotary spinners.
#

import struct
import sys

def getMouseEvent(file):
    buf = file.read(3)
    button = buf[0]
    bLeft = button & 0x1
    bMiddle = (button & 0x4) > 0
    bRight = (button & 0x2) > 0
    x,y = struct.unpack("bb", buf[1:])
    xarrow = ' '
    yarrow = ' '
    if x < 0:
        xarrow = '←'
    elif x > 0:
        xarrow = '→'
    if y < 0:
        yarrow = '↑'
    elif y > 0:
        yarrow = '↓'
    print("{} {}  (x: {}, y: {})".format(xarrow, yarrow, x, y))

if __name__ == '__main__':
    device = sys.argv[1] if len(sys.argv) > 1 else "mice"
    with open("/dev/input/" + device, "rb") as file:
        while True:
            getMouseEvent(file)
