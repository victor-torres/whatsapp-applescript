set current_folder to POSIX path of ((the path to me as text) & "::")
set javascript_file to (POSIX file (current_folder & "whatsapp.js"))

open for access javascript_file
set javascript_content to (read javascript_file)
close access javascript_file

tell application "Google Chrome"
	repeat with w in windows
		repeat with t in tabs of w
			if URL of t starts with "https://web.whatsapp.com/" then
				execute t javascript javascript_content
				return
			end if
		end repeat
	end repeat
end tell
