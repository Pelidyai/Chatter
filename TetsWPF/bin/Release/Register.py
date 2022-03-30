import sys
import time

from ChatParser import ChatParser

if __name__ == "__main__":
    dir = sys.argv[0]
    print(dir)
    buf = ""
    c = dir.count('\\')
    c1 = 0
    for d in dir:
        if d == '\\':
            c1 += 1
        if c1 == c:
            break
        buf += d
    buf += "\\config.ini"
    print(buf)
    parser = ChatParser(buf)
    time.sleep(60)

