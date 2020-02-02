<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Movie extends MY_Controller {
    public function __construct() {
        parent::__construct();
    }

    public function view($slug = null) {
        $movie_slug = $this->FilmModel->getFilms($slug, false, false);

        if (empty($movie_slug)) {
            show_404();
        }
        $this->load->model('CommentModel');
        $this->data['comments'] = $this->CommentModel->getComments($movie_slug['id'], 100);

        $this->data['title'] = $movie_slug['name'];
        $this->data['year'] = $movie_slug['year'];
        $this->data['rating'] = $movie_slug['rating'];
        $this->data['descriptions'] = $movie_slug['descriptions'];
        $this->data['player_code'] = $movie_slug['player_code'];

        $this->load->view('templates/header', $this->data);
        $this->load->view('movie/view', $this->data);
        $this->load->view('templates/footer');
    }

    public function type($slug = null) {
        $this->load->library('pagination');

        $this->data['movie_data'] = null;

        $offset = (int) $this->uri->segment(4);
        $row_count = 2;
        $count = 0;

        if ($slug == "films") {
            $count = count($this->FilmModel->getFilms(0, 1));
            $p_config['base_url'] = '/movie/type/films/';
            $this->data['title'] = "Фильмы";
            // $this->data['movie_data'] = $this->FilmModel->getFilms(false, 10, 1);
            $this->data['movie_data'] = $this->FilmModel->getMoviesOnPage($row_count, $offset, 1);
        }

        if ($slug == "serials") {
            $count = count($this->FilmModel->getFilms(0, 2));
            $p_config['base_url'] = '/movie/type/serials/';
            $this->data['title'] = "Сериалы";
            // $this->data['movie_data'] = $this->FilmModel->getFilms(false, 10, 2);
            $this->data['movie_data'] = $this->FilmModel->getMoviesOnPage($row_count, $offset, 2);
        }

        if ($this->data['movie_data'] == null) {
            show_404();
        }

        // Pagination config
        $p_config['total_rows'] = $count;
        $p_config['per_page'] = $row_count;

        $p_config['full_tag_open'] = "<ul class='pagination'>";
		$p_config['full_tag_close'] ="</ul>";
		$p_config['num_tag_open'] = '<li>';
		$p_config['num_tag_close'] = '</li>';
		$p_config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
		$p_config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
		$p_config['next_tag_open'] = "<li>";
		$p_config['next_tagl_close'] = "</li>";
		$p_config['prev_tag_open'] = "<li>";
		$p_config['prev_tagl_close'] = "</li>";
		$p_config['first_tag_open'] = "<li>";
		$p_config['first_tagl_close'] = "</li>";
		$p_config['last_tag_open'] = "<li>";
		$p_config['last_tagl_close'] = "</li>";

        // Init pagination
        $this->pagination->initialize($p_config);
        $this->data['pagination'] = $this->pagination->create_links();

        $this->load->view('templates/header', $this->data);
        $this->load->view('movie/type', $this->data);
        $this->load->view('templates/footer');
    }
}
