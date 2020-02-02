При настройке окружения:

    1. Для PhpStorm изменяем интерпретатор php на тот, что лежит в xampp
    2. В конфигурационном файле сервера httpd.conf изменяем последние строки на следующие (чтобы не было проблемы с index.php в url и для изменения папки с сайтом):

    <VirtualHost kinomonster.com:8000>
     DocumentRoot D:\YandexDisk\Studying\_Courses\FructCode\KinoMonster
     ServerName kinomonster.com
     ServerAdmin admin@kinomonster.com
     <Directory "D:\YandexDisk\Studying\_Courses\FructCode\KinoMonster">
      Options Indexes FollowSymLinks
      Allow from all
      Require all granted
      IndexIgnore /
      RewriteEngine on
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteRule ^(.*)$ index.php/$1 [L,QSA]
     </Directory>
    </VirtualHost>

При создании нового проекта:

    1. Задаем параметры базы данных в config/database.php
    2. Создаем базовый контроллер MY_Controller в папке core вида:

    <?php
    class MY_Controller extends CI_Controller {
        public function __construct() {
            parent::__construct();

            $this->data['title'] = "КиноМонстр - сайт о кино";

            $this->load->model('NewsModel');
            $this->data['news'] = $this->NewsModel->getNews();

            $this->load->model('FilmModel');
            $this->data['films'] = $this->FilmModel->getFilmsByRating(8);
        }
    }

Для создания новой страницы сайта:

    1. Добавляем URL в файле config/routes.php
    2. Создаем контроллер в папке controllers (с большой буквы, [без слова Controller], так же как название файла), отнаследуем от CI_Controller (или лучше MY_Controller), добавляем методы, которые будут использоваться в URL сайта:
        метод index в контроллере News -> .../news/
        метод view в контроллере News -> .../news/view
        метод show в контроллере News -> .../news/show
    3. В конструкторе контроллера загружаем модель, в методах задаем параметры в переменной data, обращаясь к методам модели, загружаем view (header, основной вид, footer), передаем им data
    4. Создаем модель в папке models, отнаследуем от CI_Model, в конструкторе загружаем database, создаем методы загрузки данных
    5. Создаем вид в папке view, используя переменные из data, выводим их на страницу
