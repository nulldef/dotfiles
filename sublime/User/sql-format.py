import sublime
import sublime_plugin
import subprocess

class SqlFormatCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    file_size = self.view.size()
    region = sublime.Region(0, file_size)
    content = self.view.substr(region)

    command = ["sqlfmt"]
    command.extend(["--print-width", "100"])
    command.extend(["--tab-width", "2"])
    command.extend(["--use-spaces"])

    result = subprocess.run(command, text=True, input=content, capture_output=True)
    result.check_returncode()

    self.view.replace(edit, region, result.stdout)
