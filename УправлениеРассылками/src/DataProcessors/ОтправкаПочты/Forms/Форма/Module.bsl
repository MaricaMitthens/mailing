

&НаКлиенте
Процедура ОтправитьПисьмо(Команда)
	ОтправитьПисьмоНаСервере();
КонецПроцедуры

&НаСервере

Функция ПолучитьПрофиль()
Профиль = Новый ИнтернетПочтовыйПрофиль;
Профиль.АдресСервераSMTP = "smtp.gmail.com";
Профиль.ПортSMTP = 465;
Профиль.ИспользоватьSSLSMTP = Истина;
Профиль.Пользователь = "1cservicesspb@gmail.com";
Профиль.Пароль = "Maridiplom2";
Профиль.ПользовательSMTP = "1cservicesspb@gmail.com";
Профиль.ПарольSMTP = "Maridiplom2";
Профиль.АутентификацияSMTP = СпособSMTPАутентификации.ПоУмолчанию;
Профиль.ВремяОжидания = 50; 

Возврат Профиль;
КонецФункции

Процедура ОтправитьПисьмоНаСервере()
	
	Почта = Новый ИнтернетПочта;
	Попытка
	Почта.Подключиться(ПолучитьПрофиль());
	Сообщить("Подключение к профилю прошло успешно");
	Исключение
	Сообщить(ОписаниеОшибки()); 
	Возврат;
	КонецПопытки;
	Сообщение = Новый ИнтернетПочтовоеСообщение();
	Сообщение.Отправитель = "1cservicesspb@gmail.com";
	Сообщение.ИмяОтправителя = "Maria";
	Сообщение.Получатели.Добавить("lawinov2010@yandex.ru");
	//Сообщение.Получатели.Добавить("mari.aleo@yandex.ru");
	//Сообщение.Получатели.Добавить("your@mailbox.com");
	Сообщение.Тема = "Важное сообщение";
	//Сообщение.Тексты.Добавить("Привет, получилось отправить письмо");
	ТекстСообщения = Сообщение.Тексты.Добавить();
	ТекстСообщения.Текст = "<a href=""mailto:1cservicesspb@gmail.com"">Отправьте для отписки от рассылки</a>";
	ТекстСообщения.ТипТекста = ТипТекстаПочтовогоСообщения.HTML;

	Попытка
	Почта.Послать(Сообщение);
	Исключение
	Сообщить(ОписаниеОшибки()); 
	Возврат;
	КонецПопытки;
	Почта.Отключиться(); 
	
	Сообщ = новый СообщениеПользователю();
	Сообщ.Текст = "Процедура на сервере завершена";
	Сообщ.Сообщить();
КонецПроцедуры


