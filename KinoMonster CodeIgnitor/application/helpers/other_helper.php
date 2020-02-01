<?php
if (!function_exists('show_active_menu')) {
    function show_active_menu($slug) {
        $ci=& get_instance(); // Super object codeingnitor
        $result = "";
        // print_r($ci->uri->segment(3, 0)); // Номер сегмента (url'а), 3-й в /movie/type/films = films
        // Для главной страницы
        if ($ci->uri->segment(1, 0) === $slug) {
            $result = "class='active'";
        }
        // Для страницы фильмов
        if ($ci->uri->segment(3, 0) === $slug) {
            $result = "class='active'";
        }

        if ($slug === 'films' && $ci->uri->segment(1, 0) === 'movie' && $ci->uri->segment(2, 0) === 'view') {
            $result = "class='active'";
        }

        return $result;
    }
}

if (!function_exists('getUsernameById')) {
    function getUsernameById($user_id) {
        $ci=& get_instance();
        $ci->load->model('dx_auth/users');
        $query = $ci->users->get_user_by_id($user_id);
        $result = $query->row();

        return $result;
    }
}
