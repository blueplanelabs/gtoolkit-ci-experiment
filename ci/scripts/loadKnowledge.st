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

Smalltalk snapshot: true andQuit: false.
