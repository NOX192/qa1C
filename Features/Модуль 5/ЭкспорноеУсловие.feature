﻿#language: ru

@tree
@ExportScenarios

Функционал: Экспортное условие

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: Экспортное условие для организации "НазваниеКомпании"
	Если элемент формы с именем 'Company' стал равен '' Тогда
		И в поле с именем "Company" я ввожу текст 'НазваниеКомпании'
		И я перехожу к следующему реквизиту