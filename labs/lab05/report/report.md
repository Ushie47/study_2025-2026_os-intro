
#  **Лаборатору Отчет No5**

**ДЭВИД МАЙКЛ ФРАНСИС**

## Цель работы
**Цель данной лабораторной работы — научиться пользоваться менеджером паролей и Chezmoi**

### **Описание задачи**
1. **сначала я установил gopass и pass с помощью команды**
```
dnf install pass pass-otp
dnf install gopass
```
![Screenshot1](images/Screenshot1.jpeg)
![Screenshot2](images/Screenshot2.jpeg)

2. **Я просмотрел список имеющихся у меня ключей gpg с помощью команды**
```
gpg --list-secret-keys
```
![Screenshot3](images/Screenshot3.jpeg)

3. **Я инициализировал хранилище и синхронизировался с git, а также установил адрес размещенного хранилища с помощью команд**
```
pass init omotole47@gmail.com
pass git init
pass git remote add origin git@github.com:Ushie47/study_2024-2025_os-intro.git
```
![Screenshot4](images/Screenshot4.jpeg)

**Для синхронизации выполняется следующая команда:**
```
pass git pull
pass git push
```
![Screenshot5](images/Screenshot5.jpeg)

4. **Если изменения вносятся непосредственно в файловую систему, вам необходимо вручную зафиксировать и загрузить изменения:**
```
cd ~/.password-store/
git add .
git commit -am 'edit manually'
git push
```
![Screenshot6](images/Screenshot6.jpeg)

# Настройка интерфейса с помощью браузера
**Сначала мне нужно скачать плагин BrowserPass в браузере, затем скачать интерфейс для взаимодействия с браузером в терминале с помощью команды**
```
dnf copr enable maximbaz/browserpass
dnf install browserpass
```
![Screenshot7](images/Screenshot7.jpeg)

## Сохранение пароля
**Нам нужно создать пароль, а затем отобразить пароль для конкретного файла в терминале с помощью команды**
```
pass insert [study]/[github]
pass [study]/[github]
```
![Screenshot8](images/Screenshot8.jpeg)

### Управление конфигурационными файлами
**Я установил дополнительное программное обеспечение**

![Screenshot9](images/Screenshot9.jpeg)

**Установка бинарного файла. Скрипт определяет архитектуру процессора и операционную систему и загружает необходимый файл с помощью wget**
```
sh -c "$(wget -qO- chezmoi.io/get)"
```
**Я создал свой собственный репозиторий для конфигурационных файлов на основе шаблона:**
```
gh repo create dotfiles --template="yamadharma/dotfiles-template" --private
```
**Я инициализировал его с помощью своего github**
```
chezmoi init git@github.com:Ushie47/dotfiles.git
```
![Screenshot10](images/Screenshot10.jpeg)

**Извлекать изменения из репозитория и применять их с помощью одной команды**
```
chezmoi update
```
**Чтобы извлечь последние изменения из репозитория и увидеть, какие изменения не применяются фактически**
```
chezmoi git pull -- --autostash --rebase && chezmoi diff
```
**Чтобы применить изменения, мы используем команду**
```
chezmoi apply
```
**Вы можете автоматически фиксировать и отправлять изменения в исходный каталог в репозитории.По умолчанию эта функция отключена.Чтобы включить его, добавьте в файл конфигурации следующее:~/.config/chezmoi/chezmoi.toml**
 ```
[git]
    autoCommit = true
    autoPush = true
```
![Screenshot11](images/Screenshot11.jpeg)

![Screenshot12](images/Screenshot12.jpeg)

**Вывод: из этой лабораторной работы я узнал, как использовать chezmoi для создания файла конфигурации и как использовать менеджер паролей**



