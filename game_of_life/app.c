#include "game.h"
// #include <stdio.h>

#define ALIVE 0xFFFFFFFF
#define DEAD  0xFF000000

char is_alive(int x, int y, char* data) {
    return data[y * WINDOW_H + x];
}

void set_alive(int x, int y, char alive, char* data) {
    data[y * WINDOW_H + x] = alive;
}

void generate_field(char* data) {
    for (int x=0; x<WINDOW_W; ++x) {
        for (int y=0; y<WINDOW_H; ++y) {
            if (sim_get_rand() % 5 > 1) {
                set_alive(x, y, 1, data);
            } else {
                set_alive(x, y, 0, data);
            }
        }
    }
}

int calc_siblings(int x, int y, char* data) {
    int cnt = 0;
    for (int dx=-1; dx<=1; ++dx) {
        for (int dy=-1; dy<=1; ++dy) {
            int nx = x + dx;
            int ny = y + dy;
            if(!(0 <= nx && nx < WINDOW_W) || !(0 <= ny && ny < WINDOW_H) || nx == x && ny == y) {
                continue;
            }
            if(is_alive(nx, ny, data)) {
                ++cnt;
            }
        }
    }
    return cnt;
}

void update_field(char* data1, char* data2) {
    for(int x=0; x<WINDOW_W; ++x) {
        for(int y=0; y<WINDOW_H; ++y) {
            int cnt = calc_siblings(x, y, data1);
            if(is_alive(x, y, data1) == 1) {
                if(2 <= cnt && cnt <= 3) {
                    set_alive(x, y, 1, data2);
                } else {
                    set_alive(x, y, 0, data2);
                }
            } else {
                if(cnt == 3) {
                    set_alive(x, y, 1, data2);
                } else {
                    set_alive(x, y, 0, data2);
                }
            }
        }
    }
}

void paint_field(char* data) {
    for(int x=0; x<WINDOW_W; ++x) {
        for(int y=0; y<WINDOW_H; ++y) {
            if(is_alive(x, y, data)) {
                sim_draw_color(x, y, ALIVE);
            } else {
                sim_draw_color(x, y, DEAD);
            }
        }
    }
}

void app() {
    char data1[WINDOW_H * WINDOW_W];
    char data2[WINDOW_H * WINDOW_W];
    char* old_data = data1;
    char* new_data = data2;
    int t = 0;

    generate_field(old_data);
    while(1) {
        update_field(old_data, new_data);
        paint_field(new_data);
        sim_flush();

        char* tmp = old_data;
        old_data = new_data;
        new_data = tmp;
    }
}