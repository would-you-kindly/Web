<?php

class NewsModel extends CI_Model {
    public function __construct() {
        $this->load->database();
    }

    public function getNews($slug = false) {
        if ($slug === false) {
            // Возвращает все новости
            $query = $this->db->get('news'); // Название таблицы в БД
            return $query->result_array();
        }

        // Возвращает конкретную новость, где заполнено поле slug
        $query = $this->db->get_where('news', array('slug' => $slug));
        return $query->row_array();
    }

    public function setNews($slug, $title, $text) {
        $data = array(
            'slug' => $slug,
            'title' => $title,
            'text' => $text
        );

        return $this->db->insert('news', $data);
    }

    public function updateNews($slug, $title, $text) {
        $data = array(
            'slug' => $slug,
            'title' => $title,
            'text' => $text
        );

        // Таблица news, обновляем только те данные, которые соответствуют условию (запись в БД существует)
        return $this->db->update('news', $data, array('slug' => $slug));
    }

    public function deleteNews($slug) {
        return $this->db->delete('news', array('slug' => $slug));
    }
}
