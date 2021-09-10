# flutter-jsonplaceholder

A test-task
Stack: Flutter.
Using the service https://jsonplaceholder.typicode.com / implement a pseudo-application/
List of screens:
1. List of users. Output of the list obtained from the api in the form of cards of the following type 
  [
username
name
]
2. The user's page. Detailed output of user information
  [
in the AppBar - username
(further down the list)
name
email
    phone
    website
    working(company)[
      name
      bs
      catchPhrase (italics, like a quote)
]
    adress
    a list of 3 previews (title, 1 line of text...) user posts + the ability to view all (screen 3) a
list of 3 previews of the user's albums with a thumbnail + the ability to view all (screen 4)
]
3. a list of user posts. All posts in the preview format + the ability to go to the detailed (screen 5)
4. the list of user's albums
5. a detailed page of the post with a list of all comments with a name and email. also, at the bottom of the screen, add a comment button. A click opens a form with 3 fields name, email, comment text and the "send" button (to choose from: a separate screen, a modal window, a BottomSheet). Send it to the same server and save it in SharedPreferences with a pseudo-assigned id.
6. detailed information of the album. All photos of the album with a description and a slider
All received data must be cached using the SharedPreferences package, and should not be re-requested if already received.
Appearance requirements: a clear interface to suit your taste.


Стек: Flutter.
Используя сервис https://jsonplaceholder.typicode.com/ реализовать псевдо-приложение/
Список экранов:
1. Список пользователей. Вывод списка, полученного по апи в виде карточек вида 
  [
   username
    name
  ]
2. Страница пользователя. Подробный вывод информации о пользователе
  [
    в AppBar - username
    (далее по списку)
    name
    email
    phone
    website
    working(company)[
      name
      bs
      catchPhrase (курсив, как цитата)
    ]
    adress
    список из 3-х превью (заголовок, 1 строчка текста...) постов пользователя + возможность посмотреть все (экран 3)
    список из 3-х превью альбомов пользователя с миниатюрой + возможность посмотреть все (экран 4)
  ]
3. список постов пользователя. Все посты в формате превью + возможность перейти на детальную (экран 5)
4. список альбомов пользователя
5. детальная страница поста со списком всех комментариев c именем и email. так же, внизу экрана добавить кнопку добавления комментария. По клику открывается форма с 3 полями имя, email, текс комментария и кнопкой "отправить/send" (на выбор: отдельный экран, модальное окно, bottomSheet). Отправку сделать на тот же сервер и сохранить в SharedPreferences с псевдо-присвоенным id.
6. детальная альбома. Все фото альбома с описанием и слайдером
Все полученные данные необходимо кэшировать используя пакет SharedPreferences, и не должны повторно запрашиваться если уже получены.
Требования к внешнему виду: понятный интерфейс на Ваш вкус.