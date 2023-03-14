# MSSQL Server + Kafka + Kafdrop + Debezium Connect

## Инструкция

1. Клонируем этот репозиторий и переходим в скачанную папку:

```bash
git clone https://github.com/catinwarmhands/mssql_debezium.git && cd mssql_debezium
```

2. Запуск / перезапуск сервисов:

```bash
docker-compose down && docker-compose build --no-cache && docker-compose up

```

3. Остановка сервисов:

```bash
docker-compose down
```

