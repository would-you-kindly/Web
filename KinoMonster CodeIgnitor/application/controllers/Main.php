<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Main extends MY_Controller {
    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->data['title'] = "Главная страница";

        $this->load->model('FilmModel');
        $this->data['movie'] = $this->FilmModel->getFilms(false, 8, 1);
        $this->data['serials'] = $this->FilmModel->getFilms(false, 8, 2);

        $this->load->view('templates/header', $this->data);
        $this->load->view('main/index', $this->data);
        $this->load->view('templates/footer');
    }
}
