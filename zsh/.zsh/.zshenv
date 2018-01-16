# zshenv

PATH=${PATH}:/usr/sbin:/sbin:${HOME}/bin:${HOME}/scripts:${HOME}/.cargo/bin
PROMPT='%F{1}%B%M%b %F{4}%~%F{15} ─ '
if [[ -n ${LAUNCHER} ]]; then
	PROMPT='%F{1}run%F{15} ~ '
	bindkey -s "^M" "& \n"
	return
fi

