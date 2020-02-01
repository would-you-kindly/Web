<?php
defined('BASEPATH') or exit('No direct script access allowed');

class News extends MY_Controller {
    public function __construct() {
        parent::__construct();

        $this->load->model('NewsModel');
    }

    public function index() {
        $this->data['title'] = "Все новости"; // В html обращаемся php echo $title; (с тегами php)
        $this->data['news'] = $this->NewsModel->getNews();

        $this->load->view('templates/header', $this->data);
        $this->load->view('news/index', $this->data);
        $this->load->view('templates/footer');
    }

    // Функция вызывается при обращении через url /view
    public function view($slug = null) {
        $this->data['news_item'] = $this->NewsModel->getNews($slug);

        if (empty($data['news_item'])) {
            show_404();
        }

        $this->data['title'] = $this->data['news_item']['title'];
        $this->data['content'] = $this->data['news_item']['text'];

        $this->load->view('templates/header', $this->data);
        $this->load->view('news/view', $this->data);
        $this->load->view('templates/footer');
    }

    public function create() {
        if (!$this->dx_auth->is_admin()) {
            // show_404();
            $this->load->helper('url_helper');
            redirect('/', 'location');
        }

        $this->data['title'] = "Добавить новость";

        // name элемента из view create
        if ($this->input->post('slug') && $this->input->post('title') && $this->input->post('text')) {
            $slug = $this->input->post('slug');
            $title = $this->input->post('title');
            $text = $this->input->post('text');

            if ($this->NewsModel->setNews($slug, $title, $text)) {
                // Если добавили новость, то показываем страницу успеха
                $this->load->view('templates/header', $this->data);
                $this->load->view('news/success', $this->data);
                $this->load->view('templates/footer');
            }
        } else {
            // Если просто открыли страницу с формой добавления, то ее и открываем
            $this->load->view('templates/header', $this->data);
            $this->load->view('news/create', $this->data);
            $this->load->view('templates/footer');
        }
    }

    public function edit($slug = null) {
        $this->data['title'] = "Редактировать новость";
        $this->data['news_item'] = $this->NewsModel->getNews($slug);

        if (empty($this->data['news_item'])) {
            show_404();
        }

        $this->data['title_news'] = $this->data['news_item']['title'];
        $this->data['content_news'] = $this->data['news_item']['text'];
        $this->data['slug_news'] = $this->data['news_item']['slug'];

        if ($this->input->post('slug') && $this->input->post('title') && $this->input->post('text')) {
            $slug = $this->input->post('slug');
            $title = $this->input->post('title');
            $text = $this->input->post('text');

            if ($this->NewsModel->updateNews($slug, $title, $text)) {
                echo "Новость отредактирована";
            }
        }

        $this->load->view('templates/header', $this->data);
        $this->load->view('news/edit', $this->data);
        $this->load->view('templates/footer');
    }

    public function delete($slug = null) {
        $this->data['news_item'] = $this->NewsModel->getNews($slug);

        if (empty($this->data['news_item'])) {
            show_404();
        }

        $this->data['title'] = "Удалить новость";
        $this->data['result'] = "Ошибка удаления " . $this->data['news_item']['title'];

        if ($this->NewsModel->deleteNews($slug)) {
            $this->data['result'] = $this->data['news_item']['title'] . " успешно добавлена";
        }

        $this->load->view('templates/header', $this->data);
        $this->load->view('news/delete', $this->data);
        $this->load->view('templates/footer');
    }
}
