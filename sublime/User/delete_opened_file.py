import sublime
import sublime_plugin
import os

class DeleteOpenedFileCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    file_path = self.view.file_name()
    ok = sublime.ok_cancel_dialog("Really remove?", "Yeah, baby!")
    if ok:
      self.view.close()
      os.remove(file_path)
