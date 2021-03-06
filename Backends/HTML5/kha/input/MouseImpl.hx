package kha.input;

import kha.SystemImpl;
import kha.input.Mouse;

class MouseImpl extends kha.input.Mouse {
	public function new() {
		super();
	}

	override public function lock(): Void {
		SystemImpl.lockMouse();
	}

	override public function unlock(): Void {
		SystemImpl.unlockMouse();
	}

	override public function canLock(): Bool {
		return SystemImpl.canLockMouse();
	}

	override public function isLocked(): Bool {
		return SystemImpl.isMouseLocked();
	}

	override public function notifyOnLockChange(func: Void -> Void, error: Void -> Void): Void {
		SystemImpl.notifyOfMouseLockChange(func, error);
	}

	override public function removeFromLockChange(func: Void -> Void, error: Void -> Void): Void{
		SystemImpl.removeFromMouseLockChange(func, error);
	}

	override public function hideSystemCursor(): Void {
		SystemImpl.khanvas.style.cursor = "none";
	}

	override public function showSystemCursor(): Void {
		SystemImpl.khanvas.style.cursor = "default";
	}

	override public function setSystemCursor(cursor: MouseCursor): Void {
		SystemImpl.khanvas.style.cursor = switch (cursor) {
		case Default: "default";
		case Pointer: "pointer";
		case Text: "text";
		case EastWestResize: "ew-resize";
		case NorthSouthResize: "ns-resize";
		case NorthEastResize: "ne-resize";
		case SouthEastResize: "se-resize";
		case NorthWestResize: "nw-resize";
		case SouthWestResize: "sw-resize";
		case Grab: "grab";
		case Grabbing: "grabbing";
		case NotAllowed: "not-allowed";
		case Wait: "wait";
		case Crosshair: "crosshair";
		default: "default";
		}
	}
}
