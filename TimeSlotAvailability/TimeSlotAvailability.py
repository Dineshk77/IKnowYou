'''Command to execute:
python TimeSlotAvailability.py 00:30-1:30,1:30-2:30,1:20-3:30,4:50-5:50,1:30-5:50,1:20-4:00,3:20-6:00
'''

import sys

class TimeSlotAvailabity:

	def __init__(self,meetingTimeData):
		self.meetingTimeData = meetingTimeData
		self.checkTimeFormat()
		overlapDetails = self.checkOverlap()
		print ("\nTotal overlaps = "+str(len(overlapDetails))+"\n")
		self.listAvailabilty(overlapDetails)

	def checkTimeFormat(self):
		for item in self.meetingTimeData:
			if len(item.split("-")) < 2:
				raise ValueError("Time format is wrong for item - "+item+", use format HH:MM-HH:MM")
			if len((item.split("-")[0]).split(":")) < 2 or len((item.split("-")[1]).split(":")) < 2:
				raise ValueError("Time format is wrong for item - "+item+", use format HH:MM-HH:MM")
			if not ((item.split("-")[0]).split(":")[0]).isdigit() or not ((item.split("-")[0]).split(":")[1]).isdigit():
				raise ValueError("Time format is wrong for item - "+item+", use format HH:MM-HH:MM")
			if not ((item.split("-")[1]).split(":")[0]).isdigit() or not ((item.split("-")[1]).split(":")[1]).isdigit():
				raise ValueError("Time format is wrong for item - "+item+", use format HH:MM-HH:MM")
			if int((item.split("-")[0]).split(":")[0]) > 23 or int((item.split("-")[1]).split(":")[0]) > 23:
				raise ValueError("Wrong time limit for item - "+item+", hour shouldn't exceed 23")
			if int((item.split("-")[0]).split(":")[1]) > 59 or int((item.split("-")[1]).split(":")[1]) > 59:
				raise ValueError("Wrong time limit for item - "+item+", minute shouldn't exceed 59")
					
	def checkOverlap(self):
		timeOccupancy = {}
		overlapDetails = {}
		for item in self.meetingTimeData:
			startTime = item.split("-")[0]
			endTime = item.split("-")[1]
			timeInMinutesstartTime = int(startTime.split(":")[0])*60 + int(startTime.split(":")[1])
			timeInMinutesendTime = int(endTime.split(":")[0])*60 + int(endTime.split(":")[1])
			if timeInMinutesendTime < timeInMinutesstartTime:
				timeInMinutesendTime = timeInMinutesendTime + 1440
			if timeOccupancy:
				for key in timeOccupancy:
					if timeInMinutesstartTime < int(key.split("-")[1]) and timeInMinutesendTime > int(key.split("-")[0]):
						overlapDetails[item] = timeOccupancy[key]
						break
			timeOccupancy[str(timeInMinutesstartTime)+"-"+str(timeInMinutesendTime)] = item
		return overlapDetails

	def listAvailabilty(self,overlapDetails):
		for item in overlapDetails:
			print ("TimeSlot - "+item+" is overlapping with "+overlapDetails[item]+"\n")


if len(sys.argv) < 2:
	raise ValueError("No input for timeslots") 

TimeSlotAvailabity(sys.argv[1].split(","))
