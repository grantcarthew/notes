# Bash Scripting

## std Streams

Redirecting std streams:

* `>` redirects stdout to a file.
* `2>` redirects stderr.
* `&>` redirects both stdout and stderr.
* Use a target of `/dev/null` as a data sink.

## Parameter Expansion

With this parameter expansion, `${parameter}`, the value of `parameter` is substituted.

${parameter:-word} - If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.

${parameter:=word} - If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.

${parameter:?word} - If parameter is null or unset, the expansion of word (or a message to that effect if word is not present) is written to the standard error and the shell, if it is not interactive, exits. Otherwise, the value of parameter is substituted.

${parameter:+word} - If parameter is null or unset, nothing is substituted, otherwise the expansion of word is substituted.

${parameter:offset}
${parameter:offset:length} - This is referred to as Substring Expansion. It expands to up to length characters of the value of parameter starting at the character specified by offset.