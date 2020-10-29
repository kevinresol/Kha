package;

import Sys.*;
import haxe.io.Path;

class Make {
	static function main() {
		final args = args();
		final libDir = getCwd();
		if(getEnv('HAXELIB_RUN') == '1') setCwd(args.pop());
		exit(command('node', [Path.join([libDir, 'make.js'])].concat(args)));
	}
}