filename = "./game_of_life_test/instruction_log.txt"
line_limit = 10 ** 6
max_pattern_len = 5
show_top = 5

patterns = [dict() for _ in range(max_pattern_len + 1)]

with open(filename, mode="r", encoding="utf8") as f:
    lines = [f.readline() for _ in range(line_limit)]
    for pattern_len in range(1, max_pattern_len + 1):
        for i in range(0, len(lines) - pattern_len + 1):
            cur = tuple(lines[i - pattern_len:i])
            patterns[pattern_len][cur] = patterns[pattern_len].get(cur, 0) + 1

for len, d in enumerate(patterns):
    if len == 0:
        continue
    print(f"Top result for pattern_len={len}")
    best = list(sorted(list(d.items()), key=lambda x: x[1], reverse=True)[:show_top])
    for values, cnt in best:
        print(*map(str.strip, values), cnt, sep=', ')
