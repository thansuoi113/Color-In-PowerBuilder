$PBExportHeader$n_pixelcolor.sru
forward
global type n_pixelcolor from nonvisualobject
end type
end forward

global type n_pixelcolor from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION ulong GetPixel(ulong hwnd, long xpos, long ypos) LIBRARY "Gdi32.dll"
// get device context - required for graphic stuff
FUNCTION ulong GetDC(long hwnd) LIBRARY "user32.dll"
FUNCTION long ReleaseDC (long hwnd, ulong hDC) LIBRARY "user32.dll"

//FUNCTION boolean GetCursorPos(ref mousepos mousepos2) LIBRARY "User32.dll"
//FUNCTION long GetWindowRect( long hwnd, ref rect rect2) LIBRARY "User32.dll"

FUNCTION boolean SetCursorPos(int cx, int cy)  LIBRARY "User32.dll"
FUNCTION boolean GetCursorPos(ref str_point POINT)  LIBRARY "User32.dll"


end prototypes
forward prototypes
public function unsignedlong of_get_color (ref dragobject a_object)
public function integer of_getcolor (window a_object)
end prototypes

public function unsignedlong of_get_color (ref dragobject a_object);long ll_xpos, ll_ypos
ulong ul_rtn
ulong ul_handle, ul_device
// get handle
ul_handle = handle(a_object)
ul_device = GetDC(ul_handle)
ll_xpos = UnitsToPixels(a_object.PointerX(), XUnitsToPixels!)
ll_ypos = UnitsToPixels(a_object.PointerY(), YUnitsToPixels!)

ul_rtn = GetPixel(ul_device, ll_xpos, ll_ypos)
ReleaseDC( ul_handle, ul_device)

RETURN ul_rtn
end function

public function integer of_getcolor (window a_object);long ll_xpos, ll_ypos
ulong ul_rtn
ulong ul_handle, ul_device
// get handle
ul_handle = handle(a_object)
ul_device = GetDC(ul_handle)
ll_xpos = UnitsToPixels(a_object.PointerX(), XUnitsToPixels!)
ll_ypos = UnitsToPixels(a_object.PointerY(), YUnitsToPixels!)

ul_rtn = GetPixel(ul_device, ll_xpos, ll_ypos)
ReleaseDC( ul_handle, ul_device)

RETURN ul_rtn
end function

on n_pixelcolor.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pixelcolor.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

