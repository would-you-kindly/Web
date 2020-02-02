<h1>Все новости</h1>
<p>
    <a href="create">Добавить новость</a>
</p>
<?php foreach ($news as $key => $value): ?>
    <h2>
        <a href="view/<?php echo $value['slug']; ?>"><?php echo $value['title']; ?></a> |
        <a href="edit/<?php echo $value['slug']; ?>">edit</a> |
        <a href="delete/<?php echo $value['slug']; ?>">delete</a>
    </h2>
<?php endforeach; ?>
