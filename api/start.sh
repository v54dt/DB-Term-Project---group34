sudo forever start -l forever80 -a --uid webapi80 --minUptime 1000 --spinSleepTime 1000 app.js