import curses
import subprocess

def print_logo(stdscr):
    logo = """
 ____      _  _____ 
|  _ \    / \|_   _|
| |_) |  / _ \ | |  
|  _ <  / ___ \| |  
|_| \_\/_/   \_\_|
"""
    height, width = stdscr.getmaxyx()
    x = width // 2 - len(logo.split("\n")[0]) // 2
    y = height // 2 - len(logo.splitlines()) // 2
    stdscr.addstr(y, x, logo)

def print_menu(stdscr, selected_row, options):
    stdscr.clear()
    print_logo(stdscr)
    for i, option in enumerate(options):
        x = curses.COLS // 2 - len(option) // 2
        y = curses.LINES // 2 - len(options) // 2 + i
        if 0 <= y < curses.LINES and 0 <= x < curses.COLS:
            if i == selected_row:
                stdscr.attron(curses.color_pair(1))
                stdscr.addstr(y, x, option)
                stdscr.attroff(curses.color_pair(1))
            else:
                stdscr.addstr(y, x, option)
    stdscr.refresh()

def connect_to_ssh(stdscr, ip_address):
    username = "Jarbouu3"
    password = "Jarbouu3"
    stdscr.addstr(curses.LINES // 2 + 2, curses.COLS // 2 - 10, "Connecting...")
    stdscr.refresh()
    try:
        subprocess.run(["sshpass", "-p", password, "ssh", f"{username}@{ip_address}", "-o", "StrictHostKeyChecking=no"], check=True)
    except subprocess.CalledProcessError:
        stdscr.addstr(curses.LINES // 2 + 3, curses.COLS // 2 - 10, "Connection failed. Press any key to continue.")
        stdscr.refresh()
        stdscr.getch()
        return False
    return True

def main(stdscr):
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)
    
    # Initial options
    initial_options = ["1. Connect", "2. Exit"]
    current_row = 0
    print_menu(stdscr, current_row, initial_options)
    stdscr.refresh()
    
    while True:
        key = stdscr.getch()
        stdscr.clear()

        if key == curses.KEY_UP:
            current_row = (current_row - 1) % len(initial_options)
        elif key == curses.KEY_DOWN:
            current_row = (current_row + 1) % len(initial_options)
        elif key == curses.KEY_ENTER or key in [10, 13]:
            stdscr.clear()
            stdscr.refresh()
            if current_row == 0:
                stdscr.addstr(curses.LINES // 2, curses.COLS // 2 - 10, "Enter IP Address:")
                stdscr.refresh()
                ip_address = stdscr.getstr(curses.LINES // 2 + 1, curses.COLS // 2 - 10, 15)
                if not connect_to_ssh(stdscr, ip_address.decode('utf-8')):
                    stdscr.clear()
                    print_menu(stdscr, current_row, initial_options)
                else:
                    stdscr.clear()
                    # Update menu with additional options
                    options = ["1. Take Screenshot", "2. Open Webcam", "3. Log Keys", "4. Exit"]
                    current_row = 0
                    print_menu(stdscr, current_row, options)
                    while True:
                        key = stdscr.getch()
                        stdscr.clear()
                        if key == curses.KEY_UP:
                            current_row = (current_row - 1) % len(options)
                        elif key == curses.KEY_DOWN:
                            current_row = (current_row + 1) % len(options)
                        elif key == curses.KEY_ENTER or key in [10, 13]:
                            if current_row == len(options) - 1:
                                break
                        elif key == 27:  # ESC key
                            break

                        stdscr.refresh()
                        print_menu(stdscr, current_row, options)
        elif key == 27:  # ESC key
            break

        stdscr.refresh()

    curses.endwin()

curses.wrapper(main)
