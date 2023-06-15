Class {
	#name : #BaselineOfGtoolkitCiExperiment,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtoolkitCiExperiment
}

{ #category : #baseline }
BaselineOfGtoolkitCiExperiment >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtoolkitCiExperiment'.
			spec package: 'GtoolkitCiExperiment-Tests'.
		]
]
