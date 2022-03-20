from ChatParser import ChatParser
import sys

url = sys.argv[1]
tel_str = sys.argv[2]
is_tel = False
# print(tel_str)
if tel_str == "True":
    is_tel = True
# print(is_tel)
parser = ChatParser()


async def main():
    #await parser.dump_all_participants("https://t.me/chat_design_russia")
    await parser.dump_all_participants(url, is_tel=is_tel)
    print("done")


with parser.client:
    parser.client.loop.run_until_complete(main())

