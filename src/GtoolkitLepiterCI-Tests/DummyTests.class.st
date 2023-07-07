Class {
	#name : #DummyTests,
	#superclass : #TestCase,
	#category : #'GtoolkitLepiterCI-Tests'
}

{ #category : #accessing }
DummyTests >> testAnswer [
    | dummy |
	dummy := Dummy new.
	self assert: dummy answer equals: 42
]
