#!/usr/bin/env python

import subprocess
from time import time

def run_command(command : str, times : int, silent : bool) -> bool:
    success_count = 0
    failure_count = 0

    if times <= 0:
        raise ValueError(f"{times} must be greater than 0")

    print(f"Running command \"{command}\" {times} times")

    # TODO: add progress bar
    start_time = time()
    for i in range(1, times + 1):
        try:
            if silent:
                # TODO: don't actually send the result to /dev/null
                result = subprocess.run(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            else:
                result = subprocess.run(command, shell=True)
            
            if result.returncode == 0:
                success_count += 1
            else:
                print(f"Command failed on attempt {i}: {command}")
                failure_count += 1

        except Exception as e:
            print(f"Exception occurred on attempt {i}: {e}")
            failure_count += 1

    end_time = time()
    total_time = end_time - start_time
    average_time = total_time / times

    print("Summary:")
    print(f"\tTotal attempts: {times}")
    print(f"\tSuccesses: {success_count}")
    print(f"\tFailures: {failure_count}")
    print(f"\tTook {total_time:.6f} seconds")
    print(f"\tAverage attempt took {average_time:.6f} seconds")

    return failure_count == 0

def main():
    import argparse

    parser = argparse.ArgumentParser(description="Run a command multiple times and count successes and failures.")
    parser.add_argument("command", help="The command to run.")
    parser.add_argument("times", type=int, help="Number of times to run the command.")
    parser.add_argument("-s", "--silent", action="store_true", help="Suppress the command output.")

    args = parser.parse_args()

    if args.times <= 0:
        print(f"times must be greater than 0, got \"{args.times}\"")
        exit(2)

    success = run_command(args.command, args.times, args.silent)

    if success:
        exit(0)
    else:
        exit(1)

if __name__ == "__main__":
    main()

