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
