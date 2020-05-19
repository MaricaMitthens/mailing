

&НаКлиенте
Процедура ПроверитьРегулярку(Команда)
	Сообщить(ПроверитьРегуляркуНаСервере());
КонецПроцедуры

&НаСервере
Функция ПроверитьРегуляркуНаСервере()
//	Шаблон = ".+@.+\..+";
	Шаблон = "[a-z].[a-z]+@.[a-z]+\.[a-z].[a-z]+";
	Текст = "вчер";
	Возврат НайтиПодстроки(Шаблон, Текст);
КонецФункции


Функция НайтиПодстроки(Шаблон, Текст)

	RegExp = Новый COMОбъект("VBScript.RegExp");
	
	//Поиск всех вхождений шаблона	
	RegExp.Global = Ложь;	

	//Игнорировать регистр символов
	RegExp.IgnoreCase = Истина; 
	
	//Многострочный режим	
	RegExp.MultiLine = Истина; 
	RegExp.Pattern = Шаблон;
	Matches = RegExp.Execute(Текст);
	МассивЗначений = Новый Массив();
	
	Для каждого StrMatches Из Matches Цикл		
		МассивЗначений.Добавить(StrMatches.Value);		
	КонецЦикла;
	
	Возврат МассивЗначений[0];
	
КонецФункции 