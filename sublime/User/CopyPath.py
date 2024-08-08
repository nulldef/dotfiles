import os
import sublime
import sublime_plugin

def get_relative_path(window):
  folders = window.folders() or []
  absolute_path = window.active_sheet().file_name() or ""

  for folder in folders:
    if folder in absolute_path:
      return absolute_path.replace(folder + "/", "")

  return None

class CopyPathCommand(sublime_plugin.WindowCommand):
  def run(self):
    relative_path = get_relative_path(self.window)

    if relative_path:
      sublime.set_clipboard(relative_path)
      sublime.status_message("Relative path of the file is copied!")
    else:
      sublime.status_message("This file is outside of opened folders, can't get relative path")

class CopyPathWithLineCommand(sublime_plugin.WindowCommand):
  def run(self):
    relative_path = get_relative_path(self.window)
    view = self.window.active_view()
    selection = view.sel()
    (row, _col) = view.rowcol(selection[0].begin())
    line_number = row + 1

    if relative_path:
      sublime.set_clipboard(relative_path + ":" + str(line_number))
      sublime.status_message("Path:line of the file is copied!")
    else:
      sublime.status_message("This file is outside of opened folders, can't get relative path")

class CopyFilenameCommand(sublime_plugin.WindowCommand):
  def run(self):
    absolute_path = self.window.active_sheet().file_name()
    filename = os.path.basename(absolute_path)
    sublime.set_clipboard(filename)
    sublime.status_message("Relative path of the file is copied!")

