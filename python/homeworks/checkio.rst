The Flat Dictionary
===================

.. simple
.. tag: bugs

Task
----

Никола обожает классифицировать все, что видит вокруг. Однажды Стефан подарил ему устройство для ярлыков на день рождение, и затем они неделями отдирали наклейки со всех поверхностей и вещей на корабле. Он категоризировал все реагенты в своей лаборатории, книги в библиотеке и даже заметки на столе. Но когда он узнал о том, что в Python есть тип данных словарь, он категоризировал все конфигурационные файлы дронов Софии. Теперь эти файлы организованы в сложную вложенную структуру, что очень не нравится Софии. Помогите ей упростить эти словари словарей.

Словари - это удобный тип данных для хранения и обработки различных конфигураций. Они позволяют хранить данные по ключам и создавать вложенные структуры. Дан словарь, в котором в качестве ключей используются строки, а в качестве значений строки или словари. Необходимо сделать этот словарь "плоским", но сохранить структуру в ключах. Результатом будет словарь без вложенных словарей. Ключи должны содержать путь, составленный из родительских ключей из начального словаря, разделенных "/". Если значение ключа есть пустой словарь, тогда оно должно быть заменено пустой строкой (""). Взглянем на пример:

.. code-block:: python

    {
        "name": {
            "first": "One",
            "last": "Drone"
        },
        "job": "scout",
        "recent": {},
        "additional": {
            "place": {
                "zone": "1",
                "cell": "2"}
        }
    }

Результатом будет:

.. code-block:: python

    {   
        "name/first": "One",           #один прародитель
        "name/last": "Drone",
        "job": "scout",                #ключ корневого уровня
        "recent": "",                  #пустой словарь
        "additional/place/zone": "1",  #третий уровень
        "additional/place/cell": "2"
    }

София уже написала код для этой задачи, но в нем есть ошибка. Вам достаточно найти и исправить эту ошибку.

.. code-block:: python

    def flatten(dictionary):
        stack = [((), dictionary)]
        result = {}
        while stack:
            path, current = stack.pop()
            for k, v in current.items():
                if isinstance(v, dict):
                    stack.append((path + (k,), v))
                else:
                    result["/".join((path + (k,)))] = v
        return result

Входные данные: Оригинальный словарь (dict).

Выходные данные: "Плоский" словарь (dict).

Примеры:

flatten({"key": "value"}) == {"key": "value"}
flatten({"key": {"deeper": {"more": {"enough": "value"}}}}) == {"key/deeper/more/enough": "value"}
flatten({"empty": {}}) == {"empty": ""}
    
Связь с реальной жизнью: Методы из этой задачи будут полезны, чтобы разобрать и упростить структуры конфигураций или файлов. Вы легко можете улучшить данную концепцию для ваших конкретных задач. А также, чтение чужого кода и поиск ошибок - это очень полезный навык.

Предусловия:
Ключи в словаре - не пустые строки.
Значения в словаре - строки или другие словари.
root_dictionary != {}


Solution
--------

.. code-block:: python

    def flatten(dictionary):
        stack = [((), dictionary)]
        result = {}
        while stack:
            path, current = stack.pop()
            for k, v in current.items():
                if isinstance(v, dict) and v:
                    stack.append((path + (k,), v))
                else:
                    result["/".join((path + (k,)))] = v if v else ""
        print(result)
        return result


    if __name__ == '__main__':
        #These "asserts" using only for self-checking and not necessary for auto-testing
        assert flatten({"key": "value"}) == {"key": "value"}, "Simple"
        assert flatten(
            {"key": {"deeper": {"more": {"enough": "value"}}}}
        ) == {"key/deeper/more/enough": "value"}, "Nested"
        assert flatten({"empty": {}}) == {"empty": ""}, "Empty value"
        assert flatten({"name": {
                            "first": "One",
                            "last": "Drone"},
                        "job": "scout",
                        "recent": {},
                        "additional": {
                            "place": {
                                "zone": "1",
                                "cell": "2"}}}
        ) == {"name/first": "One",
              "name/last": "Drone",
              "job": "scout",
              "recent": "",
              "additional/place/zone": "1",
              "additional/place/cell": "2"}

Three words
===========

Task
----

Давайте научим наших роботов отличать слова от чисел.

Дана строка со словами и числами, разделенными пробелами (один пробел между словами и/или числами). Слова состоят только из букв. Вам нужно проверить есть ли в исходной строке три слова подряд. Для примера, в строке "start 5 one two three 7 end" есть три слова подряд.

Входные данные: Строка со словами (str).

Выходные данные: Ответ как логическое выражение (bool), True или False.

Зачем это нужно: Эта задача подскажет вам как работать со строками и покажет некоторые полезные функции.

Предусловия: Исходная строка содержит только слова и/или числа. Смешанных слов нет (перемешанные цифры и буквы).
0 < len(words) < 100

Solution
--------

.. code-block:: python

    def checkio(words):
        words = words.split(' ')
        return  any (sum(map(str.isalpha, words[i:i+3])) == 3  for i in range(0, len(words)))

    #These "asserts" using only for self-checking and not necessary for auto-testing
    if __name__ == '__main__':
        assert checkio("Hello World hello") == True, "Hello"
        assert checkio("He is 123 man") == False, "123 man"
        assert checkio("1 2 3 4") == False, "Digits"
        assert checkio("bla bla bla bla") == True, "Bla Bla"
        assert checkio("Hi") == False, "Hi"
