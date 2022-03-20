import configparser
import codecs
import csv

from telethon.sync import TelegramClient

# классы для работы с каналами
from telethon.tl.functions.channels import GetParticipantsRequest
from telethon.tl.functions.users import GetFullUserRequest
from telethon.tl.types import ChannelParticipantsSearch, MessageMediaPhoto

# класс для работы с сообщениями
from telethon.tl.functions.messages import GetHistoryRequest


class ChatParser:
    def __init__(self):
        # Считываем учетные данные
        self.config = configparser.ConfigParser()
        self.config.read("config.ini")

        # Присваиваем значения внутренним переменным
        self.api_id = self.config['Telegram']['api_id']
        self.api_hash = self.config['Telegram']['api_hash']
        self.username = self.config['Telegram']['username']
        self.client = TelegramClient(self.username, self.api_id, self.api_hash)
        self.client.start()

    async def dump_all_participants(self, url, is_tel: bool = False):
        self.channel = await self.client.get_entity(url)
        """Записывает json-файл с информацией о всех участниках канала/чата"""
        offset_user = 0  # номер участника, с которого начинается считывание
        limit_user = 100  # максимальное число записей, передаваемых за один раз

        all_participants = []  # список всех участников канала
        filter_user = ChannelParticipantsSearch('')

        while True:
            participants = await self.client(GetParticipantsRequest(self.channel,
                                                                    filter_user, offset_user, limit_user, hash=0))
            if not participants.users:
                break
            all_participants.extend(participants.users)
            offset_user += len(participants.users)

        all_users_details = []
        if not is_tel:
            for participant in all_participants:
                all_users_details.append([str(participant.username),
                                          str(participant.first_name),
                                          str(participant.last_name),
                                          str(participant.phone),
                                          str(participant.id)])
        else:
            for participant in all_participants:
                if participant.phone:
                    all_users_details.append([str(participant.username),
                                              str(participant.first_name),
                                              str(participant.last_name),
                                              str(participant.phone),
                                              str(participant.id)])
        # entity = self.client.get_entity('Pelidyai')
        # mess = await self.client.send_message(840812734, message="Halo, I'm testing telethon!")
        # print(mess)
        with open('out_files/' + self.channel.title + '.csv', 'w', encoding='utf16', newline='') as outfile:
            wr = csv.writer(outfile, delimiter='\t')
            wr.writerow(["username", "first_name", "last_name", "phone", "id"])
            wr.writerows(all_users_details)

    async def send_message_to_all(self, users_file, message, picture, video):
        wr = csv.reader(codecs.open(users_file, 'rU', 'utf-16'))
        user = ""
        for row in wr:
            for symbol in row[0]:
                if symbol == '\t':
                    break
                user += symbol
            if user != "username" and user != "None":
                await self.client.send_message(user, message=message)
                if picture != "":
                    await self.client.send_file(user, picture)
                if video != "":
                    await self.client.send_file(user, video)
            user = ""

