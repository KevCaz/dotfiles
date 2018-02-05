atom.commands.add 'atom-text-editor', 'insert-a-pipe', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('%>%')

atom.commands.add 'atom-text-editor', 'insert-assignement', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<-')

atom.commands.add 'atom-text-editor', 'insert-is-element', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('%in%')

atom.commands.add 'atom-text-editor', 'insert-tee-operator', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('%T>%')

atom.commands.add 'atom-text-editor', 'insert-tee-print', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('%T>% print')

atom.commands.add 'atom-text-editor', 'insert-reassignement', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('%<>%')

atom.commands.add 'atom-text-editor', 'insert-breakline', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('<br>')

atom.commands.add 'atom-text-editor', 'insert-shortcode', ->
  if editor = atom.workspace.getActiveTextEditor()
    editor.insertText('{{<  >}}')
