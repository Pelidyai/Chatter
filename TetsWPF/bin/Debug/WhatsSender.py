import codecs
import csv
import sys

import pywhatkit
from datetime import datetime
import argparse


def createParser():
    r = argparse.ArgumentParser()
    r.add_argument('-f', '--file')
    r.add_argument('-m', '--mes')
    return r


if __name__ == "__main__":
    arg_parser = createParser()
    namespace = arg_parser.parse_args(sys.argv[1:])

    file = namespace.file
    mes = namespace.mes

    file = file.encode("cp866").decode("cp1251")
    mes = mes.encode("cp866").decode("cp1251")

    # mes = "Тестовое сообщение"
    # file = "out_files/Чат дизайнеров РФ.csv"
    # file = "out_files/tets.csv"

    wr = csv.reader(codecs.open(file, 'rU', 'utf-16'))
    tel = ""

    for row in wr:
        count = 0
        i = 0
        for i in range(len(row[0])):
            if row[0][i] == '\t':
                count += 1
                if count == 3:
                    i += 1
                    while row[0][i] != '\t':
                        tel += row[0][i]
                        i += 1
                    break
        if tel != "None" and tel != "phone" and tel != "" and len(tel) == 11:
            pywhatkit.sendwhatmsg("+" + tel, mes, datetime.now().hour, datetime.now().minute + 3, 15, True, 0)
        tel = ""
