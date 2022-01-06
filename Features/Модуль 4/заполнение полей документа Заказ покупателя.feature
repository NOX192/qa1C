﻿#language: ru

@tree

Функционал: заполнение полей документа Заказ покупателя

я хочу
протестировать заполнение полей: Партнер, Соглашение и 
блокировку поля Контрагент – в случае, если не выбран Партнер
чтобы выполнить практическое задание к Модулю 4

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Экспорт данных для тестирования полей документа Заказ покупателя
	Дано Экспорт основных данных


Сценарий: тестирование полей документа Заказ покупателя
	И я закрываю все окна клиентского приложения
* Открытие документа "Заказ покупателя"
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
* Тестирование полей
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Наименование'            |
		| 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем 'Agreement' стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	И элемент формы с именем 'LegalName' стал равен 'Клиент 1'
	И в поле с именем 'Partner' я ввожу текст ''
	И я перехожу к следующему реквизиту
	Тогда элемент формы с именем 'Agreement' стал равен ''
	И элемент формы с именем 'LegalName' стал равен ''
	И в поле с именем 'Partner' я ввожу текст 'Клиент 2 (2 соглашения)'
	И я перехожу к следующему реквизиту	
	И элемент формы с именем 'LegalName' стал равен 'Клиент 2'
	Тогда элемент формы с именем 'Agreement' стал равен ''
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Наименование'                                        |
		| 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'FormOK'
	И представление элемента с именем 'Agreement' стало равно 'Индивидуальное соглашение 1 (расчет по соглашениям)'
	И я нажимаю кнопку выбора у поля с именем "Agreement"	
	И таблица "List" не содержит строки:
		| 'Наименование'                                                    |
		| 'Соглашение с клиентами (расчет по документам + кредитный лимит)' |
		| 'Розничное'                                                       |
		| 'Розничный клиент 1'                                              |
	И в таблице "List" я перехожу к строке:
		| 'Наименование'                                        |
		| 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
	И в таблице "List" я выбираю текущую строку	
// Не знаю ТЗ, но возможно, что тут ошибка, соглашение поменялось, система не предлагает пересчитать табличную часть...		
	И представление элемента с именем 'Agreement' стало равно 'Индивидуальное соглашение 2 (расчет по соглашениям)'		
	И в поле с именем 'Partner' я ввожу текст ''
	И я перехожу к следующему реквизиту
// Судя по названию для тестирования у клиента должно быть 2 договора (проверить, что подтянется клиентский),
// но в базе 1 договор и по идее в таком случае на нем тестировать не требовалось
	И в поле с именем 'Partner' я ввожу текст 'Клиент и поставщик'
	И я перехожу к следующему реквизиту
	И представление элемента с именем 'Partner' стало равно 'Клиент и поставщик'
	И представление элемента с именем 'Agreement' стало равно 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	И в поле с именем 'Partner' я ввожу текст ''	
	И я перехожу к следующему реквизиту
	Когда Проверяю шаги на Исключение:
		|'И из выпадающего списка с именем "LegalName" я выбираю по строке "Клиент 2"'|
//	Когда Проверяю шаги на Исключение:
//		|'И я нажимаю кнопку выбора у поля с именем "LegalName"'|		
// Шаг с нажатием кнопки срабатывает, но фактически кнопка не нажимается, думаю это проблема API	
	И я закрываю все окна клиентского приложения	
	
	
						
		
			
			











