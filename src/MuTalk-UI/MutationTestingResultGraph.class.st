Class {
	#name : #MutationTestingResultGraph,
	#superclass : #Object,
	#instVars : [
		'timesColl',
		'scoresColl',
		'timeBoxPlot',
		'scoreBoxPlot',
		'timeLinePlot',
		'scoreLinePlot'
	],
	#category : #'MuTalk-UI'
}

{ #category : #rendering }
MutationTestingResultGraph >> drawScoreBoxPlot [

	self initializeScoreBoxPlot.
	scoreBoxPlot open
]

{ #category : #rendering }
MutationTestingResultGraph >> drawScoreLinePlot [

	self initializeScoreLinePlot.
	scoreLinePlot open
]

{ #category : #rendering }
MutationTestingResultGraph >> drawTimeBoxPlot [

	self initializeTimeBoxPlot.
	timeBoxPlot open
]

{ #category : #rendering }
MutationTestingResultGraph >> drawTimeLinePlot [

	self initializeTimeLinePlot.
	timeLinePlot open
]

{ #category : #rendering }
MutationTestingResultGraph >> drawTimeScoreBoxPlot [

	self initializeTimeScoreBoxPlot open
]

{ #category : #rendering }
MutationTestingResultGraph >> drawTimeScoreLinePlot [

	self initializeTimeScoreLinePlot open
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeScoreBoxPlot [

	scoreBoxPlot := RSBoxPlot data: scoresColl
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeScoreLinePlot [

	scoreLinePlot := RSLinePlot y:
		                 (scoresColl collect: [ :each | each average ])
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeTimeBoxPlot [

	timeBoxPlot := RSBoxPlot data: timesColl
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeTimeLinePlot [

	timeLinePlot := RSLinePlot y:
		                (timesColl collect: [ :each | each average ])
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeTimeScoreBoxPlot [

	self initializeTimeBoxPlot.
	self initializeScoreBoxPlot.
	^ timeBoxPlot + scoreBoxPlot colors: NSScale google20
]

{ #category : #initialization }
MutationTestingResultGraph >> initializeTimeScoreLinePlot [

	self initializeTimeLinePlot.
	self initializeScoreLinePlot.
	^ timeLinePlot + scoreLinePlot colors: NSScale google20
]

{ #category : #accessing }
MutationTestingResultGraph >> scores [

	^ scoresColl
]

{ #category : #accessing }
MutationTestingResultGraph >> scores: aColl [

	scoresColl := aColl
]

{ #category : #accessing }
MutationTestingResultGraph >> times [

	^ timesColl
]

{ #category : #accessing }
MutationTestingResultGraph >> times: aColl [

	timesColl := aColl
]
