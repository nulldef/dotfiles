import sublime
import sublime_plugin
import subprocess

class SqlFormatCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    file_size = self.view.size()
    region = sublime.Region(0, file_size)
    content = self.view.substr(region)

    # brew install sqlfmt
    # command = ["sqlfmt"]
    # command.extend(["--print-width", "100"])
    # command.extend(["--tab-width", "2"])
    # command.extend(["--use-spaces"])

    # brew install pgformatter
    command = ["pg_format"]
    command.extend(["--comma-break"])
    command.extend(["--comma-end"])
    command.extend(["--spaces=2"])
    command.extend(["--wrap-limit=120"])
    command.extend(["-"])

    print("Formatting SQL:", ' '.join(command))

    result = subprocess.run(command, text=True, input=content, capture_output=True)
    result.check_returncode()

    self.view.replace(edit, region, result.stdout)
