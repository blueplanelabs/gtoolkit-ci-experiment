EpMonitor current disable.
Metacello new
	repository: 'github://blueplanelabs/gtoolkit-ci-experiment:main/src';
	baseline: 'GtoolkitCiExperiment';
	load.
EpMonitor current enable.

spartaBuilders := BlSpartaCanvasBuilder allSubclasses.

Transcript show: 'Sparta Builders: ', spartaBuilders asString; cr.

Transcript show: 'Forcing reload of the default logical database...'; cr.

LeDatabasesRegistry default defaultLogicalDatabase reload.

Transcript show: 'Loading knowledge database...'; cr.

BaselineOfGtoolkitCiExperiment loadKnowledge.

databaseNames := LeDatabasesRegistry defaultLogicalDatabase databases collect: #databaseName.

Transcript show: 'Databases: ', databaseNames asString; cr.

Transcript show: 'Applying knowledge snippets...'; cr.

testPage := (LeDatabasesRegistry defaultLogicalDatabase databaseNamed: 'gtoolkit-ci-experiment/gtoolkit-ci-experiment/lepiter') pages first.

Transcript show: 'Found Test Page'; cr.

snippets := testPage allChildrenSnippetsMatching: [ :aSnippet |
    aSnippet isKindOf: LePharoSnippet].

Transcript show: 'Found ', (snippets size) asString , ' Pharo snippets to be applied.'; cr.

snippets do: [ :aSnippet |
    aSnippet coder doItAll ].

Transcript show: 'Exists LepiterDefinedClass? ', (Smalltalk at: #LepiterDefinedClass) isNotNil asString; cr.

Smalltalk snapshot: true andQuit: false.
