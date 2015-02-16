module.exports =
  subscription: null

  activate: ->
    @subscription = atom.commands.add 'atom-workspace', 'duplicate-selection:toggle': => @toggle()

  deactivate: ->
    @subscription?.dispose()

  toggle: ->
    Editor = atom.workspace.getActiveEditor()
    return unless Editor.getPath()
    Buffer = Editor.getBuffer()
    Editor.getSelections().forEach (Selection)->
      Text = Selection.getText()
      Range = Selection.getBufferRange()
      if Text is ''
        # Ignore it for once
      else
        Buffer.setTextInRange(Range,Text+Text)
