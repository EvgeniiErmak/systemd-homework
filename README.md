# Домашнее задание: Инициализация системы. Systemd — создание unit-файла

Курс "Администратор Linux. Professional" (OTUS). Развёртывание каждого задания выполняется через **Vagrant** с **shell provisioner** (`vagrant up` автоматически поднимает VM и настраивает сервис).

## Структура репозитория

| Папка | Задание |
|---|---|
| [task1-watchlog](./task1-watchlog) | Сервис + таймер, мониторящий лог на ключевое слово раз в 30 секунд (параметры — в `/etc/default`) |
| [task2-spawn-fcgi](./task2-spawn-fcgi) | Установка spawn-fcgi и unit-файл, переделанный из SysV init-скрипта |
| [task3-nginx-multi](./task3-nginx-multi) | Шаблонный unit-файл `nginx@.service` для запуска нескольких инстансов Nginx с разными конфигами |

Скриншоты выполнения всех заданий — в общей папке [screenshots](./screenshots).

## Как запустить любое задание

\`\`\`bash
cd task1-watchlog   # либо task2-spawn-fcgi, либо task3-nginx-multi
vagrant up
vagrant ssh
\`\`\`

Внутри VM все unit-файлы уже установлены и запущены provisioner-ом. Проверка результата описана в конце каждого `provision.sh`.

## Состав каждой папки задания

- `Vagrantfile` — описание VM и provisioner.
- `provision.sh` — shell-скрипт, который выполняет всю настройку (установка пакетов, копирование unit-файлов, `systemctl daemon-reload`, `systemctl enable --now ...`).
- `files/` — исходные unit-файлы и конфиги, которые копируются внутрь VM.
