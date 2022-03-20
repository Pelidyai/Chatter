from ChatParser import ChatParser
import sys
import argparse


def createParser():
    r = argparse.ArgumentParser()
    r.add_argument('-f', '--file')
    r.add_argument('-m', '--mes')
    r.add_argument('-p', '--pic')
    r.add_argument('-v', '--vid')
    return r


arg_parser = createParser()
namespace = arg_parser.parse_args(sys.argv[1:])

file = namespace.file
mes = namespace.mes
pic = namespace.pic
vid = namespace.vid

file = file.encode("cp866").decode("cp1251")
mes = mes.encode("cp866").decode("cp1251")
pic = pic.encode("cp866").decode("cp1251")
vid = vid.encode("cp866").decode("cp1251")

# file = "tets.csv"
# mes = "Пробуем отправку фото и видео"
# pic = "PickAim_Dark_Wallpapers3.jpg"
# vid = "tets.mp4"

parser = ChatParser()


async def main():
    await parser.send_message_to_all(file, mes, pic, vid)
    print("done")


with parser.client:
    parser.client.loop.run_until_complete(main())
