# MSSQL Server + Kafka + Kafdrop + Debezium Connect

## Инструкция

1. Клонируем этот репозиторий и переходим в скачанную папку:

```bash
git clone https://github.com/catinwarmhands/mssql_debezium.git && cd mssql_debezium
```

2. Запуск / перезапуск сервисов (занимает несколько минут):

```bash
docker-compose down && docker-compose build --no-cache && docker-compose up

```

3. Если в логах есть ошибки о нехватке ресурсов, или наоборот контейнеры забрали вообще все доступные ресурсы, то нужно вручную задать ресурсы, доступные WSL. Для этого создаем файл `.wslconfig` в папке текущего пользователя (`%userprofile%`) со соледующим содержимым:

```
[wsl2]
memory=4GB
processors=2
```

после этого нужно убить WSL командой:

```bash
taskkill /f /im wslservice.exe
```

и перезапустить Docker Desktop

4. После запуска всех сервисов, можно подключиться к MSSQL через DBeaver:
    - host: localhost
    - port: 1433
    - user: sa
    - pass: c37kW6MB

Сообщения в Kafka можно посмотреть через Kafdrop, он доступен в браузере по адресу http://localhost:9000/

5. Остановка сервисов:

```bash
docker-compose down
```
