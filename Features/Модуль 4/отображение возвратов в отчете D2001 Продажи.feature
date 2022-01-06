#language: ru

@tree

Функционал: отображение возвратов в отчете D2001 Продажи

я хочу
протестировать отображение возвратов в отчете D2001 Продажи
чтобы выполнить практическое задание к Модулю 4

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: 0401 Экспорт данных для тестирования возвратов в отчете D2001
	Дано Экспорт основных данных
	Дано Экспорт документа возврат
	И я выполняю код встроенного языка на сервере
		|'Документы.GoodsReceipt.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.ReconciliationStatement.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturnOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|




Сценарий: 0402 тестирование возвратов в отчете D2001 Продажи
	И я закрываю все окна клиентского приложения
* Открытие отчета
	И Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
* Сброс настроек отчета
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я нажимаю на кнопку с именем 'SettingsComposerSettingsStandardSettings'
	И я нажимаю на кнопку с именем 'Button0'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр' |
		| 'Период'   |
	И в таблице "SettingsComposerSettingsDataParameters" я снимаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки	
* Отбор по регистратору 		
	И я перехожу к закладке с именем "FilterPage"
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я перехожу к строке:
		| 'Доступные поля' |
		| 'Регистратор'    |
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" я перехожу к строке:
		| 'Поле'        |
		| 'Регистратор' |
	И в таблице "SettingsComposerSettingsFilter" я нажимаю кнопку выбора у реквизита с именем "SettingsComposerSettingsFilterRightValue"
	И в таблице "" я перехожу к строке:
		| ''                              |
		| 'Возврат товаров от покупателя' |
	И в таблице "" я выбираю текущую строку
	И в таблице "List" я перехожу к строке:
		| 'Номер'|
		| '1'    |
	И в таблице "List" я выбираю текущую строку		
	И я нажимаю на кнопку с именем 'FormEndEdit'
* Сверка макета с Эталоном
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R8C1' в течение 20 секунд
	Тогда табличный документ "Result" равен по шаблону:
		| 'Отбор:'                   | '*'          | ''        | ''                  | ''             |
		| ''                         | ''           | ''        | ''                  | ''             |
		| 'Период, месяц'            | 'Итого'      | ''        | ''                  | ''             |
		| 'Номенклатура'             | ''           | ''        | ''                  | ''             |
		| 'Характеристика'           | 'Количество' | 'Сумма'   | 'Сумма без налогов' | 'Сумма скидки' |
		| 'Март 2021'                | '-1,000'     | '-190,00' | '-158,33'           | ''             |
		| 'Товар с характеристиками' | '-1,000'     | '-190,00' | '-158,33'           | ''             |
		| 'S/Красный'                | '-1,000'     | '-190,00' | '-158,33'           | ''             |
		| 'Итого'                    | '-1,000'     | '-190,00' | '-158,33'           | ''             |
	
// Сверка макета с эталоном mxl "барахлит", возможно связано с версией VA, возможно с версией платформы.	

* Сброс настроек отчета
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я нажимаю на кнопку с именем 'SettingsComposerSettingsStandardSettings'
	И я нажимаю на кнопку с именем 'Button0'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр' |
		| 'Период'   |
	И в таблице "SettingsComposerSettingsDataParameters" я снимаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки		
	И я нажимаю на кнопку с именем 'FormEndEdit'
* Поиск строк в таблице
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R8C1' в течение 20 секунд
	И табличный документ "Result" содержит строки по шаблону:
		| 'Март 2021'                | '-1,000' | '-190,00' | '-158,33' | '*' |
		| 'Товар с характеристиками' | '-1,000' | '-190,00' | '-158,33' | '*' |
		| 'S/Красный'                | '-1,000' | '-190,00' | '-158,33' | '*' |
* Сброс настроек отчета
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я нажимаю на кнопку с именем 'SettingsComposerSettingsStandardSettings'
	И я нажимаю на кнопку с именем 'Button0'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр' |
		| 'Период'   |
	И в таблице "SettingsComposerSettingsDataParameters" я снимаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'	
* Заполнение параметров "Начало периода" и "Конец периода"
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр'       |
		| 'Начало периода' |
	И в таблице "SettingsComposerSettingsDataParameters" я устанавливаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersDate' я ввожу текст '02.03.2021  0:00:00'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр'      |
		| 'Конец периода' |
	И в таблице "SettingsComposerSettingsDataParameters" я устанавливаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersDate' я ввожу текст '02.03.2021 23:59:59'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
* Поиск строк в табличном документе
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R8C1' в течение 20 секунд
	И табличный документ "Result" содержит строки по шаблону:
		| 'Март 2021'                | '-1,000' | '-190,00' | '-158,33' | '*' |
		| 'Товар с характеристиками' | '-1,000' | '-190,00' | '-158,33' | '*' |
		| 'S/Красный'                | '-1,000' | '-190,00' | '-158,33' | '*' |			
* Изменение параметров "Начало периода" и "Конец периода"
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр'       |
		| 'Начало периода' |
	И в таблице "SettingsComposerSettingsDataParameters" я устанавливаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersDate' я ввожу текст '03.03.2021  0:00:00'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Параметр'      |
		| 'Конец периода' |
	И в таблице "SettingsComposerSettingsDataParameters" я снимаю флаг с именем 'SettingsComposerSettingsDataParametersUse'
	И я нажимаю на кнопку с именем 'FormEndEdit'
* Проверка, что строк в табличном документе нету
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R5C1' в течение 20 секунд
	Тогда табличный документ "Result" равен по шаблону:
		| 'Параметры:'     | '*'          | ''      | ''                  | ''             |
		| 'Отбор:'         | '*"'         | ''      | ''                  | ''             |
		| ''               | ''           | ''      | ''                  | ''             |
		| 'Период, месяц'  | 'Итого'      | ''      | ''                  | ''             |
		| 'Номенклатура'   | ''           | ''      | ''                  | ''             |
		| 'Характеристика' | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' |
		| 'Итого'          | ''           | ''      | ''                  | ''             |
	
		
	
				