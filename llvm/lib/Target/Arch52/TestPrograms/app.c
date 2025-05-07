#define X_SIZE 50
#define Y_SIZE 25

void app() {
    int a[X_SIZE * Y_SIZE];
    int a_next[X_SIZE * Y_SIZE];

    for (int i = 0; i < X_SIZE * Y_SIZE; ++i) {
        a[i] = 0;
        a_next[i] = 0;
    }

    // Glider pattern
    a[1 * X_SIZE + 2] = 1;
    a[2 * X_SIZE + 3] = 1;
    a[2 * X_SIZE + 4] = 1;
    a[3 * X_SIZE + 2] = 1;
    a[3 * X_SIZE + 3] = 1;

    int *alive = a;
    int *alive_next = a_next;

    for (int s = 0; s < 1000; ++s) {
        for (int y = 0; y < Y_SIZE; ++y) {
            for (int x = 0; x < X_SIZE; ++x) {
                if (alive[y * X_SIZE + x]) {
                    arch52PutDisplayPixel(x, y, 0xFF000000);
                } else {
                    arch52PutDisplayPixel(x, y, 0xFFFFFFFF);
                }
            }
        }
        arch52Flush();

        for (int y = 0; y < Y_SIZE; ++y) {
            for (int x = 0; x < X_SIZE; ++x) {
                int n = 0;
                for (int ny = y - 1; ny <= y + 1; ++ny) {
                    for (int nx = x - 1; nx <= x + 1; ++nx) {
                        if (nx == x && ny == y) continue;

                        int wrapped_x = nx;
                        int wrapped_y = ny;

                        if (wrapped_x < 0)
                            wrapped_x = X_SIZE - 1;
                        else if (wrapped_x >= X_SIZE)
                            wrapped_x = 0;

                        if (wrapped_y < 0)
                            wrapped_y = Y_SIZE - 1;
                        else if (wrapped_y >= Y_SIZE)
                            wrapped_y = 0;

                        n += alive[wrapped_y * X_SIZE + wrapped_x];
                    }
                }

                int current = alive[y * X_SIZE + x];
                if (n == 3) {
                    alive_next[y * X_SIZE + x] = 1;
                } else if (n == 2 && current) {
                    alive_next[y * X_SIZE + x] = 1;
                } else {
                    alive_next[y * X_SIZE + x] = 0;
                }
            }
        }

        int *tmp = alive;
        alive = alive_next;
        alive_next = tmp;
    }
}
