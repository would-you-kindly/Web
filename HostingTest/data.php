<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<div>
			<?php
			// Подключаем скрипт с информацией о базе данных
			require_once 'connection.php';
			
			// Подключаемся к серверу
			$link = mysqli_connect($host, $user, $password, $database) 
				or die("Ошибка link" . mysqli_error($link)); 
			
			$query = "SELECT * FROM purchase";
			$result = mysqli_query($link, $query) 
				or die("Ошибка result" . mysqli_error($link));
				
			if ($result)
			{
				$rowsCount = mysqli_num_rows($result); // Количество полученных строк
		 
				echo "<table border='1'><caption>Информация о покупках</caption><tr><th>Номер заказа</th><th>Стоимость</th>" .
					"<th>Валюта</th><th>Номер карты</th><th>Владелец</th><th>Expiration date</th><th>CVV</th></tr>";
				for ($i = 0 ; $i < $rowsCount ; ++$i)
				{
					/* Чтобы извлечь отдельную строку, используется функция mysqli_fetch_row(). 
					После вызова этой функции указатель в наборе $result переходит к новой строке, 
					поэтому с каждым новым вызовом мы извлекаем новую строку */
					$row = mysqli_fetch_row($result);
					echo "<tr>";
						for ($j = 0 ; $j < 7 ; ++$j) echo "<td>$row[$j]</td>";
					echo "</tr>";
				}
				echo "</table>";
				
				// Очищаем результат от ненужных данных
				mysqli_free_result($result);
			}
			
			// Закрываем подключение
			mysqli_close($link);	
			?>
		</div>
	</body>
</html>