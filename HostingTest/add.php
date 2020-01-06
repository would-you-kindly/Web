<!DOCTYPE html>
<html>
<head>
<title>Первый сайт на PHP</title>
<meta charset="utf-8">
</head>
<body>
<div>
			<?php
			// Подключаем скрипт с информацией о базе данных
			require_once 'connection.php';
			
			if(isset($_POST['cost']) && isset($_POST['currency']) && isset($_POST['cardNumber']) 
				&& isset($_POST['owner']) && isset($_POST['expirationDate']) && isset($_POST['cvv']))
			{
				// Подключаемся к серверу
				$link = mysqli_connect($host, $user, $password, $database) 
					or die("Ошибка " . mysqli_error($link)); 
				
				// Запоминаем значения полей в переменных
				$cost = htmlentities(mysqli_real_escape_string($link, $_POST['cost']));
				$currency = htmlentities(mysqli_real_escape_string($link, $_POST['currency']));
				$cardNumber = htmlentities(mysqli_real_escape_string($link, $_POST['cardNumber']));
				$owner = htmlentities(mysqli_real_escape_string($link, $_POST['owner']));
				$expirationDate = htmlentities(mysqli_real_escape_string($link, $_POST['expirationDate']));
				$cvv = htmlentities(mysqli_real_escape_string($link, $_POST['cvv']));
				
				// Создаем и выполняем запрос на добавление покупки
				$query = "INSERT INTO purchase VALUES(NULL, '$cost', '$currency', '$cardNumber', '$owner', '$expirationDate', '$cvv')";
				$result = mysqli_query($link, $query) 
					or die("Ошибка " . mysqli_error($link));
				echo 'success';
				// Закрываем подключение
				mysqli_close($link);
			}
			?>
		</div>
		</body>
</html>