;  Каждый процесс имеет свои регистры 

; process:
[process_ptr]
[status] - wait, idle
[stack]...[stack] - 128 (?)
[regs]...[regs] + PC

[добавить процесс]
  увеличить макс счетчик процессов
  инициализировать регистры
  установить указатель

[цикл раз в 50 сек]
  сохраням данные активного процесса
  увеличиваем указатель на следующий процесс, смотрим
  wait - пропускаем
  idle - передаем обработку

ipc - [sender_prt][recv_ptr][params]
  [запрещаем прерывания]
  [переводим процесс в wait]
  [сохраняем адрес откуда был вызов]
  [сохраняем полный набор регистров]
  [сохраняем вызов в кольцевой стек Queue]
  [разрешаем прерывания]
