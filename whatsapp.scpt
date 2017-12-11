on is_running(app_name)
    tell application "System Events" to (name of processes) contains app_name
end is_running

on execute_javascript(browser, jquery, whatsapp, conversation_title, message)
	using terms from application "Google Chrome"
		set app_is_running to is_running(browser)
		if not app_is_running then
			return
		end if

		tell application browser
			repeat with w in windows
				repeat with t in tabs of w
					if URL of t starts with "https://web.whatsapp.com/" then
						execute t javascript ("var conversation_title = \"" & conversation_title & "\";")
						execute t javascript ("var message = \"" & message & "\";")
						execute t javascript jquery
						execute t javascript whatsapp
                        set msgs to execute t javascript "msgs" 
                        if msgs is not "" then return msgs
					end if
				end repeat
			end repeat
		end tell
	end using terms from
end execute_javascript

on run(arguments)
	set javascript_folder to POSIX path of ((the path to me as text) & "::")
	set jquery_file to (POSIX file (javascript_folder & "js/jquery.min.js"))
	set whatsapp_file to (POSIX file (javascript_folder & "js/whatsapp.js"))

	open for access jquery_file
	set jquery to (read jquery_file)
	close access jquery_file

	open for access whatsapp_file
	set whatsapp to (read whatsapp_file)
	close access whatsapp_file

	set conversation_title to first item of arguments

    set rest_arguments to {}
    repeat with i from 2 to length of arguments
        copy item i of arguments to the end of rest_arguments
    end repeat
    set AppleScript's text item delimiters to space
	set message to rest_arguments as string

	set browsers to {"Google Chrome", "Google Chrome Canary"}
	repeat with browser in browsers
		return execute_javascript(browser, jquery, whatsapp, conversation_title, message)
	end repeat

end run
