<?php

if (! function_exists('env')) {
	function env(string $name, mixed $default): mixed
	{
		return getenv($name) !== false
			? getenv($name)
			: $default;
	}
}
