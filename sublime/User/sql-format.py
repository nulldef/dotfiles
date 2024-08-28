import sublime
import sublime_plugin
import subprocess

class SqlFormatCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    file_size = self.view.size()
    region = sublime.Region(0, file_size)
    content = self.view.substr(region)

    command = ["cli-sql-formatter"]
    command.extend(["-d", "sql"])
    command.extend(["-i", "2"])

    result = subprocess.run(command, text=True, input=content, capture_output=True)
    result.check_returncode()

    self.view.replace(edit, region, result.stdout)
