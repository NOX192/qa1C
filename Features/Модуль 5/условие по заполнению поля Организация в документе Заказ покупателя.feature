﻿#language: ru

@tree

Функционал: условие по заполнению поля Организация в документе Заказ покупателя

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: заполнение поля Организация
	И я закрываю все окна клиентского приложения
* Откытие создания Заказа покупателя
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
* Выбор контрагента
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
* Условие
	Дано Экспортное условие для организации "Собственная компания 2"
* Переоткрытие окна
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'		
* Выбор контрагента
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке
			| 'Наименование'       |
			| 'Розничный клиент 1' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
* Условие
	Дано Экспортное условие для организации "Собственная компания 2"
	И я закрываю все окна клиентского приложения