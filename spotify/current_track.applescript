if application "Spotify" is running then
	tell application "Spotify"
		set songName to (get name of current track)
		set songArtist to (get artist of current track)
		set songAlbum to (get album of current track)
		
		if (get player state) is playing then
			set state to "playing"
		else
			set state to "paused"
		end if
		
		return state & "|" & songName & "|" & songArtist & "|" & songAlbum
	end tell
else
	return "stopped|||"
end if
