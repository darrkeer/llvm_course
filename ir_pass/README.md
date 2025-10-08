## Сборка *game-of-life* с трассой:

достаточно просто запустить `build.sh`

приложение появится по пути `ir_pass/build/app`, **не рекомендуется запускать его на долго**, пары секунд работы достаточно для того, чтобы лог вырос до размера 0.5 гб)))

## Вывод `analyze.py`:

Сперва написан паттерн (несколько пар инструкций через запятую), затем количество встреч в первых `10^6` строках лога.

    Top result for pattern_len=1
    load -> alloca, 124629
    br -> icmp, 122321
    store -> alloca, 117169
    icmp -> load, 111018
    add -> load, 108584

    Top result for pattern_len=2
    store -> alloca, load -> alloca, 109717
    icmp -> load, br -> icmp, 96537
    load -> alloca, store -> alloca, 77730
    add -> load, store -> add, 59246
    call -> load, call -> load, 56526

    Top result for pattern_len=3
    load -> alloca, store -> alloca, load -> alloca, 74004
    store -> alloca, load -> alloca, store -> alloca, 72763
    icmp -> load, br -> icmp, icmp -> load, 51620
    add -> load, store -> add, icmp -> load, 42435
    store -> add, icmp -> load, br -> icmp, 42435

    Top result for pattern_len=4
    store -> alloca, load -> alloca, store -> alloca, load -> alloca, 71523
    load -> alloca, store -> alloca, load -> alloca, store -> alloca, 43261
    add -> load, store -> add, icmp -> load, br -> icmp, 42435
    icmp -> load, br -> icmp, icmp -> load, br -> icmp, 37140
    br -> icmp, icmp -> load, br -> icmp, icmp -> load, 33184

    Top result for pattern_len=5
    store -> alloca, load -> alloca, store -> alloca, load -> alloca, store -> alloca, 43261
    load -> alloca, store -> alloca, load -> alloca, store -> alloca, load -> alloca, 43261
    icmp -> load, br -> icmp, icmp -> load, br -> icmp, icmp -> load, 32461
    call -> load, call -> load, call -> load, store -> alloca, load -> alloca, 28262
    br -> icmp, call -> load, call -> load, call -> load, store -> alloca, 27023