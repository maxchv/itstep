
.. _tut-strings:

Строки
------

..
    Besides numbers, Python can also manipulate strings, which can be expressed
    in several ways.  They can be enclosed in single quotes (``'...'``) or
    double quotes (``"..."``) with the same result [#]_.  ``\`` can be used
    to escape quotes::

Кроме чисел Python может также работать со строками, которые могут быть выражены
несколькими способами. Они могут быть заключены в одинарные кавычки (``'...'``) или
двойные кавычки (``"..."``).  Символ ``\`` (обратный слеш) может быть использован 
для экранирования ковычек:

.. activecode:: stringex01
   :caption:    Создание строк
   :nocodelens:

   print('spam eggs')  # одинарные кавычки
   print('doesn\'t')   # используется \' для экранирования одинарной кавычки...
   print("doesn't")    # ...вместо экранирования можно использовать двойные кавычки
   print("\"Yes,\" he said.")
   print('"Isn\'t," she said.')

..
    If you don't want characters prefaced by ``\`` to be interpreted as
    special characters, you can use *raw strings* by adding an ``r`` before
    the first quote::

Если вы не хотите что бы символ ``\`` интерпретировался как специальный символ,
вы можете использовать использовать неформатированные строки (*raw strings*) путем добавления символа ``r`` 
перед первой кавычкой:

.. activecode:: stringex02
   :caption:   неформатированные строки
   :nocodelens:

   print('C:\some\name')   # \n значит новая строка!

..
    String literals can span multiple lines.  One way is using triple-quotes:
    ``"""..."""`` or ``'''...'''``.  End of lines are automatically
    included in the string, but it's possible to prevent this by adding a ``\`` at
    the end of the line.  The following example::

Строковые литералы могут быть разбиты на несколько строк. Один из способов это
использование тройных кавычек: ``"""..."""`` или ``'''...'''``.  
Конец строки добавляется автоматически, но возможно предотвартить добавление
через включение символа ``\`` в конце строки.  Это демонстрирует следующий пример:

.. activecode:: stringex03
   :caption:   многострочные строковые литералы
   :nocodelens:

   print("""\
   Usage: thingy [OPTIONS]
        -h                        Display this usage message
        -H hostname               Hostname to connect to
   """)

.. 
    Strings can be concatenated (glued together) with the ``+`` operator, and
    repeated with ``*``

Конкатенация строк (соединение вместе) может быть выполнена при помощи оператора ``+``,
а повторение строк при помощи оператора ``*``:

.. activecode:: stringex04
   :nocodelens:
   :caption:   конкатенация и повторение строк

   print(3 * 'un' + 'ium')

..
    Two or more *string literals* (i.e. the ones enclosed between quotes) next
    to each other are automatically concatenated. ::

Для двух или более *строковых литералов* (т.е. символов заключенных в кавычки) следующих
один за другим конкатенация выполняется автоматически:

.. activecode:: stringex05
   :nocodelens:
   :caption:  автоматическая конкатенация строковых литералов

   print('Py' 'thon' "!")

.. This only works with two literals though, not with variables or expressions::

Это работает только с двумя литералами подряд, но не с переменными или выражениями.

.. If you want to concatenate variables or a variable and a literal, use ``+``::

Если вам необходимо соединить переменные или переменную и литерал, используйте оператор ``+``:

.. activecode:: stringex06
   :nocodelens:

   prefix = 'Py'
   print(prefix 'thon') # ошибка


This feature is particularly useful when you want to break long strings::

   >>> text = ('Put several strings within parentheses '
               'to have them joined together.')
   >>> text
   'Put several strings within parentheses to have them joined together.'

Strings can be *indexed* (subscripted), with the first character having index 0.
There is no separate character type; a character is simply a string of size
one::

   >>> word = 'Python'
   >>> word[0]  # character in position 0
   'P'
   >>> word[5]  # character in position 5
   'n'

Indices may also be negative numbers, to start counting from the right::

   >>> word[-1]  # last character
   'n'
   >>> word[-2]  # second-last character
   'o'
   >>> word[-6]
   'P'

Note that since -0 is the same as 0, negative indices start from -1.

In addition to indexing, *slicing* is also supported.  While indexing is used
to obtain individual characters, *slicing* allows you to obtain substring::

   >>> word[0:2]  # characters from position 0 (included) to 2 (excluded)
   'Py'
   >>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
   'tho'

Note how the start is always included, and the end always excluded.  This
makes sure that ``s[:i] + s[i:]`` is always equal to ``s``::

   >>> word[:2] + word[2:]
   'Python'
   >>> word[:4] + word[4:]
   'Python'

Slice indices have useful defaults; an omitted first index defaults to zero, an
omitted second index defaults to the size of the string being sliced. ::

   >>> word[:2]  # character from the beginning to position 2 (excluded)
   'Py'
   >>> word[4:]  # characters from position 4 (included) to the end
   'on'
   >>> word[-2:] # characters from the second-last (included) to the end
   'on'

One way to remember how slices work is to think of the indices as pointing
*between* characters, with the left edge of the first character numbered 0.
Then the right edge of the last character of a string of *n* characters has
index *n*, for example::

    +---+---+---+---+---+---+
    | P | y | t | h | o | n |
    +---+---+---+---+---+---+
    0   1   2   3   4   5   6
   -6  -5  -4  -3  -2  -1

The first row of numbers gives the position of the indices 0...6 in the string;
the second row gives the corresponding negative indices. The slice from *i* to
*j* consists of all characters between the edges labeled *i* and *j*,
respectively.

For non-negative indices, the length of a slice is the difference of the
indices, if both are within bounds.  For example, the length of ``word[1:3]`` is
2.

Attempting to use an index that is too large will result in an error::

   >>> word[42]  # the word only has 6 characters
   Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
   IndexError: string index out of range

However, out of range slice indexes are handled gracefully when used for
slicing::

   >>> word[4:42]
   'on'
   >>> word[42:]
   ''

Python strings cannot be changed --- they are :term:`immutable`.
Therefore, assigning to an indexed position in the string results in an error::

   >>> word[0] = 'J'
     ...
   TypeError: 'str' object does not support item assignment
   >>> word[2:] = 'py'
     ...
   TypeError: 'str' object does not support item assignment

If you need a different string, you should create a new one::

   >>> 'J' + word[1:]
   'Jython'
   >>> word[:2] + 'py'
   'Pypy'

The built-in function :func:`len` returns the length of a string::

   >>> s = 'supercalifragilisticexpialidocious'
   >>> len(s)
   34

Методы строк
------------

len(S)	Длина строки

S.find(str, [start],[end])	Поиск подстроки в строке. Возвращает номер первого вхождения или -1

S.rfind(str, [start],[end])	Поиск подстроки в строке. Возвращает номер последнего вхождения или -1

S.index(str, [start],[end])	Поиск подстроки в строке. Возвращает номер первого вхождения или вызывает ValueError

S.rindex(str, [start],[end])	Поиск подстроки в строке. Возвращает номер последнего вхождения или вызывает ValueError

S.replace(шаблон, замена)	Замена шаблона

S.split(символ)	Разбиение строки по разделителю

S.isdigit()	Состоит ли строка из цифр

S.isalpha()	Состоит ли строка из букв

S.isalnum()	Состоит ли строка из цифр или букв

S.islower()	Состоит ли строка из символов в нижнем регистре

S.isupper()	Состоит ли строка из символов в верхнем регистре

S.isspace()	Состоит ли строка из неотображаемых символов (пробел, символ перевода страницы ('\f'), "новая строка" ('\n'), "перевод каретки" ('\r'), "горизонтальная табуляция" ('\t') и "вертикальная табуляция" ('\v'))

S.istitle()	Начинаются ли слова в строке с заглавной буквы

S.upper()	Преобразование строки к верхнему регистру

S.lower()	Преобразование строки к нижнему регистру

S.startswith(str)	Начинается ли строка S с шаблона str

S.endswith(str)	Заканчивается ли строка S шаблоном str

S.join(список)	Сборка строки из списка с разделителем S

ord(символ)	Символ в его код ASCII

chr(число)	Код ASCII в символ

S.capitalize()	Переводит первый символ строки в верхний регистр, а все остальные в нижний

S.center(width, [fill])	Возвращает отцентрованную строку, по краям которой стоит символ fill (пробел по умолчанию)

S.count(str, [start],[end])	Возвращает количество непересекающихся вхождений подстроки в диапазоне [начало, конец] (0 и длина строки по умолчанию)

S.expandtabs([tabsize])	Возвращает копию строки, в которой все символы табуляции заменяются одним или несколькими пробелами, в зависимости от текущего столбца. Если TabSize не указан, размер табуляции полагается равным 8 пробелам

S.lstrip([chars])	Удаление пробельных символов в начале строки

S.rstrip([chars])	Удаление пробельных символов в конце строки

S.strip([chars])	Удаление пробельных символов в начале и в конце строки

S.partition(шаблон)	Возвращает кортеж, содержащий часть перед первым шаблоном, сам шаблон, и часть после шаблона. Если шаблон не найден, возвращается кортеж, содержащий саму строку, а затем две пустых строки

S.rpartition(sep)	Возвращает кортеж, содержащий часть перед последним шаблоном, сам шаблон, и часть после шаблона. Если шаблон не найден, возвращается кортеж, содержащий две пустых строки, а затем саму строку

S.swapcase()	Переводит символы нижнего регистра в верхний, а верхнего – в нижний

S.title()	Первую букву каждого слова переводит в верхний регистр, а все остальные в нижний

S.zfill(width)	Делает длину строки не меньшей width, по необходимости заполняя первые символы нулями

S.ljust(width, fillchar=" ")	Делает длину строки не меньшей width, по необходимости заполняя последние символы символом fillchar

S.rjust(width, fillchar=" ")	Делает длину строки не меньшей width, по необходимости заполняя первые символы символом fillchar

S.format(*args, **kwargs)	Форматирование строки

.. http://pythonworld.ru/osnovy/formatirovanie-strok-metod-format.html

Форматирование строк с помощью метода format
::::::::::::::::::::::::::::::::::::::::::::


