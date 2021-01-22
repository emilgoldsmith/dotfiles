#!/usr/bin/python3

import sys

def minutes_to_ui(minutes):
    whole_minutes = int(minutes)
    seconds = (minutes - whole_minutes) * 60
    return "{} minute{} and {} seconds".format(whole_minutes, "" if whole_minutes == 1 else "s", seconds)

SPEED_MODE = 1
DISTANCE_MODE = 2
TIME_MODE = 3
mode = int(input('Select which mode you would like:\n\n1. Calculate Speed\n\n2. Calculate Distance\n\n3. Calculate Time\n\n'))
print()

lap_size = 400

if mode == SPEED_MODE:
    distance_string = input('How far did you run (add unit after a space such as 5.3 km, available units: 200m, 400m, m, km. Default is 400m)? ')
    print()
    try:
        length, unit = distance_string.split(' ')
        length = float(length)
    except ValueError:
        length = float(distance_string)
        unit = '400m'

    if unit == '100m':
        lap_size = 100
        meters = length * lap_size
    elif unit == '200m':
        lap_size = 200
        meters = length * lap_size
    elif unit == '400m':
        lap_size = 400
        meters = length * lap_size
    elif unit == 'km':
        meters = length * 1000
    elif unit == 'm':
        meters = length
    else:
        raise ValueError('Invalid unit passed')


    minutes, seconds = map(int, input('how many minutes and seconds did you workout (separate the two by space, so 4 minutes and 20 seconds would be 4 20)? ').split(' '))

    calced_minutes = minutes + (float(seconds) / 60.0)
    calced_hours = calced_minutes / 60.0

    km = float(meters) / 1000.0

    pace_pr_km = calced_minutes / km

    km_pr_hour = km / calced_hours

    if km_pr_hour < 5:
        print('Assumption made that this is about swimming due to speed')
        print()
        lap_size = 100

    laps = meters/lap_size
    pace_pr_lap = calced_minutes / laps


    print()
    print("Time per lap:", minutes_to_ui(pace_pr_lap))
    print()
    print("Time per km:", minutes_to_ui(pace_pr_km))
    print()
    print("Speed: {} km/hr".format(km_pr_hour))

elif mode == DISTANCE_MODE:
    is_swimming = input('Are you swimming? (y/n) ')[0] == 'y'
    print()
    if is_swimming:
        lap_size = 100
    minutes, seconds = map(int, input('how many minutes and seconds are you planning to workout (separate the two by space, so 4 minutes and 20 seconds would be 4 20)? ').split(' '))
    print()
    pace = float(input('What is your target pace in seconds per lap (lap size is {}m)? '.format(lap_size)))
    print()
    total_seconds = 60 * minutes + seconds
    total_laps = total_seconds / pace
    total_meters = total_laps * lap_size

    print('To reach your target you would have to complete {} laps which is equivalent to {} meters'.format(total_laps, total_meters))

elif mode == TIME_MODE:
    is_swimming = input('Are you swimming? (y/n) ')[0] == 'y'
    print()
    if is_swimming:
        lap_size = 100
    meters = int(input('how far are you planning to go in meters? '))
    print()
    pace_seconds = float(input('What is your target pace in seconds per lap (lap size is {}m)? '.format(lap_size)))
    print()
    seconds_per_meter = pace_seconds / lap_size
    target_time_seconds = seconds_per_meter * meters
    target_time_minutes = target_time_seconds / 60.0

    print('At your given pace you would complete {} meters in {}'.format(meters, minutes_to_ui(target_time_minutes)))


else:
    print('Incorrect mode supplied')
