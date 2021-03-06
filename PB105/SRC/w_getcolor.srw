$PBExportHeader$w_getcolor.srw
forward
global type w_getcolor from window
end type
type p_1 from picture within w_getcolor
end type
type sle_crayolacolors from singlelineedit within w_getcolor
end type
type sle_webcolors from singlelineedit within w_getcolor
end type
type sle_pbcolors from singlelineedit within w_getcolor
end type
type cb_more from commandbutton within w_getcolor
end type
type sle_name from singlelineedit within w_getcolor
end type
type st_name from statictext within w_getcolor
end type
type sle_long from singlelineedit within w_getcolor
end type
type st_long from statictext within w_getcolor
end type
type sle_html from singlelineedit within w_getcolor
end type
type st_html from statictext within w_getcolor
end type
type sle_hwb from singlelineedit within w_getcolor
end type
type st_hwb from statictext within w_getcolor
end type
type sle_hsl from singlelineedit within w_getcolor
end type
type st_5 from statictext within w_getcolor
end type
type sle_hex from singlelineedit within w_getcolor
end type
type st_4 from statictext within w_getcolor
end type
type st_rgb from statictext within w_getcolor
end type
type sle_rgb from singlelineedit within w_getcolor
end type
type st_custom from statictext within w_getcolor
end type
type hsb_blue from hscrollbar within w_getcolor
end type
type sle_blue from singlelineedit within w_getcolor
end type
type sle_green from singlelineedit within w_getcolor
end type
type hsb_green from hscrollbar within w_getcolor
end type
type hsb_red from hscrollbar within w_getcolor
end type
type sle_red from singlelineedit within w_getcolor
end type
type st_3 from statictext within w_getcolor
end type
type dw_crayolacolors from datawindow within w_getcolor
end type
type st_2 from statictext within w_getcolor
end type
type dw_webcolors from datawindow within w_getcolor
end type
type st_1 from statictext within w_getcolor
end type
type dw_pbcolors from datawindow within w_getcolor
end type
type gb_1 from groupbox within w_getcolor
end type
type gb_2 from groupbox within w_getcolor
end type
type gb_3 from groupbox within w_getcolor
end type
end forward

global type w_getcolor from window
integer width = 4681
integer height = 1892
boolean titlebar = true
string title = "Color Functions"
boolean controlmenu = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_getcolor ( dragobject a_object )
p_1 p_1
sle_crayolacolors sle_crayolacolors
sle_webcolors sle_webcolors
sle_pbcolors sle_pbcolors
cb_more cb_more
sle_name sle_name
st_name st_name
sle_long sle_long
st_long st_long
sle_html sle_html
st_html st_html
sle_hwb sle_hwb
st_hwb st_hwb
sle_hsl sle_hsl
st_5 st_5
sle_hex sle_hex
st_4 st_4
st_rgb st_rgb
sle_rgb sle_rgb
st_custom st_custom
hsb_blue hsb_blue
sle_blue sle_blue
sle_green sle_green
hsb_green hsb_green
hsb_red hsb_red
sle_red sle_red
st_3 st_3
dw_crayolacolors dw_crayolacolors
st_2 st_2
dw_webcolors dw_webcolors
st_1 st_1
dw_pbcolors dw_pbcolors
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_getcolor w_getcolor

type prototypes
Function long GetSysColor ( long nIndex ) Library "user32.dll"
//Function boolean ChooseColor(ref CHOOSECOLOR lpcc) Library "COMDLG32.DLL" Alias For "ChooseColorA"

FUNCTION ulong GetPixel(ulong hwnd, long xpos, long ypos) LIBRARY "Gdi32.dll"  
// get device context - required for graphic stuff  
FUNCTION ulong GetDC(long hwnd) LIBRARY "user32.dll"  
FUNCTION long ReleaseDC (long hwnd, ulong hDC) LIBRARY "user32.dll"  


FUNCTION boolean SetCursorPos(int cx, int cy)  LIBRARY "User32.dll"
FUNCTION boolean GetCursorPos(ref str_point POINT)  LIBRARY "User32.dll"


end prototypes

type variables
int   ii_r, ii_g, ii_b
string is_style, is_control
end variables

forward prototypes
public function long of_color (string as_colorname)
public subroutine of_set_color (long al_cotrol_color)
public function integer of_get_color (window a_object)
end prototypes

event ue_getcolor(dragobject a_object);int li_r, li_b, li_g
ulong lul_color
n_pixelcolor lnv_color
lul_color =  lnv_color.of_get_color(a_object)
//max value of unsigned long indicates error
IF lul_color = 4294967295 THEN
	st_custom.backcolor = 0
	sle_rgb.text = 'Invalid Color'
	st_rgb.text = ''
	RETURN
END IF
// get RGB values
li_r = mod(lul_color,256)
li_g = mod((lul_color / 256), 256)
li_b = mod ((lul_color / 65536), 256)

sle_long.text = 'U Long: ' + string(lul_color)
sle_rgb.text = 'RGB( ' + string(li_r) + ', ' + string(li_g) + ', ' + string(li_b) + ')'
//sle_rgbmouse.textcolor = RGB(li_r,li_g,li_b) //just to prove the values are correct
st_custom.backcolor = lul_color
end event

public function long of_color (string as_colorname);// -----------------------------------------------------------------------------
// SCRIPT:     u_scilexer.of_Color
//
// PURPOSE:    This function returns a color code for a named color. It includes
//					all the PowerBuilder, System, and Web colors.
//
// ARGUMENTS:  as_colorname - Name of the color
//
// RETURN:		Color code
// -----------------------------------------------------------------------------

Long ll_color

Choose Case Upper(as_colorname)
// PowerBuilder Colors (not defined elsewhere)
	Case "MINT"
		ll_color = RGB(192, 220, 192)
	Case "SKY"
		ll_color = RGB(166, 202, 240)
	Case "CREAM"
		ll_color = RGB(255, 251, 240)
	Case "MEDIUM GRAY"
		ll_color = RGB(160, 160, 164)
		// System Colors
	Case "COLOR_SCROLLBAR", "SCROLL BAR"
		// Scroll bar gray area.
		ll_color = GetSysColor(0)
	Case "COLOR_DESKTOP", "DESKTOP"
		// Desktop.
		ll_color = GetSysColor(1)
	Case "COLOR_ACTIVECAPTION", "ACTIVE TITLE BAR"
		// Active window title bar.
		ll_color = GetSysColor(2)
	Case "COLOR_INACTIVECAPTION", "INACTIVE TITLE BAR"
		// Inactive window caption.
		ll_color = GetSysColor(3)
	Case "COLOR_MENU", "MENU BAR"
		// Menu background.
		ll_color = GetSysColor(4)
	Case "COLOR_WINDOW", "WINDOW BACKGROUND"
		// Window background.
		ll_color = GetSysColor(5)
	Case "COLOR_WINDOWFRAME", "WINDOW FRAME"
		// Window frame.
		ll_color = GetSysColor(6)
	Case "COLOR_MENUTEXT", "MENU TEXT"
		// Text in menus.
		ll_color = GetSysColor(7)
	Case "COLOR_WINDOWTEXT", "WINDOW TEXT"
		// Text in windows.
		ll_color = GetSysColor(8)
	Case "COLOR_CAPTIONTEXT", "ACTIVE TITLE BAR TEXT"
		// Text in caption, size box, and scroll bar arrow box.
		ll_color = GetSysColor(9)
	Case "COLOR_ACTIVEBORDER", "ACTIVE BORDER"
		// Active window border.
		ll_color = GetSysColor(10)
	Case "COLOR_INACTIVEBORDER", "INACTIVE BORDER"
		// Inactive window border.
		ll_color = GetSysColor(11)
	Case "COLOR_APPWORKSPACE", "APPLICATION WORKSPACE"
		// Background color of multiple document interface (MDI) applications.
		ll_color = GetSysColor(12)
	Case "COLOR_HIGHLIGHT", "HIGHLIGHT"
		// Item(s) selected in a control.
		ll_color = GetSysColor(13)
	Case "COLOR_HIGHLIGHTTEXT", "HIGHLIGHT TEXT"
		// Text of item(s) selected in a control.
		ll_color = GetSysColor(14)
	Case "COLOR_BTNFACE", "COLOR_3DFACE", "BUTTON FACE"
		// Face color for three-dimensional display elements and for dialog box backgrounds.
		ll_color = GetSysColor(15)
	Case "COLOR_BTNSHADOW", "COLOR_3DSHADOW", "BUTTON SHADOW"
		// Shadow color for three-dimensional display elements (for edges facing away from the light source).
		ll_color = GetSysColor(16)
	Case "COLOR_GRAYTEXT", "DISABLE TEXT"
		// Grayed (disabled) text.
		ll_color = GetSysColor(17)
	Case "COLOR_BTNTEXT", "BUTTON TEXT"
		// Text on push buttons.
		ll_color = GetSysColor(18)
	Case "COLOR_INACTIVECAPTIONTEXT", "INACTIVE TITLE BAR TEXT"
		// Color of text in an inactive caption.
		ll_color = GetSysColor(19)
	Case "COLOR_3DHIGHLIGHT", "BUTTON HIGHLIGHT"
		// Highlight color for three-dimensional display elements (for edges facing the light source.)
		ll_color = GetSysColor(20)
	Case "COLOR_3DDKSHADOW", "BUTTON DARK SHADOW"
		// Dark shadow for three-dimensional display elements.
		ll_color = GetSysColor(21)
	Case "COLOR_3DLIGHT", "BUTTON LIGHT SHADOW"
		// Light color for three-dimensional display elements (for edges facing the light source.)
		ll_color = GetSysColor(22)
	Case "COLOR_INFOTEXT", "TOOLTIP TEXT"
		// Text color for tooltip controls.
		ll_color = GetSysColor(23)
	Case "COLOR_INFOBK", "TOOLTIP"
		// Background color for tooltip controls.
		ll_color = GetSysColor(24)
	Case "COLOR_HOTLIGHT", "LINK"
		// Color for a hyperlink or hot-tracked item.
		ll_color = GetSysColor(26)
	Case "COLOR_GRADIENTACTIVECAPTION"
		// Right side color in the color gradient of an active window's title bar.
		ll_color = GetSysColor(27)
	Case "COLOR_GRADIENTINACTIVECAPTION"
		// Right side color in the color gradient of an inactive window's title bar.
		ll_color = GetSysColor(28)
	Case "COLOR_MENUHILIGHT"
		// The color used to highlight menu items when the menu appears as a flat menu (see SystemParametersInfo).
		ll_color = GetSysColor(29)
	Case "COLOR_MENUBAR"
		// The background color for the menu bar when menus appear as flat menus (see SystemParametersInfo).
		ll_color = GetSysColor(30)
		// Web Color Pinks
	Case "PINK"
		ll_color = RGB(255,192,203)
	Case "LIGHTPINK"
		ll_color = RGB(255,182,193)
	Case "HOTPINK"
		ll_color = RGB(255,105,180)
	Case "DEEPPINK"
		ll_color = RGB(255,20,147)
	Case "PALEVIOLETRED"
		ll_color = RGB(219,112,147)
	Case "MEDIUMVIOLETRED"
		ll_color = RGB(199,21,13)
		// Web Colors Red
	Case "LIGHTSALMON"
		ll_color = RGB(255,160,122)
	Case "SALMON"
		ll_color = RGB(250,128,114)
	Case "DARKSALMON"
		ll_color = RGB(233,150,122)
	Case "LIGHTCORAL"
		ll_color = RGB(240,128,128)
	Case "INDIANRED"
		ll_color = RGB(205,92,92)
	Case "CRIMSON"
		ll_color = RGB(220,20,60)
	Case "FIREBRICK"
		ll_color = RGB(178,34,34)
	Case "DARKRED"
		ll_color = RGB(139,0,0)
	Case "RED"
		ll_color = RGB(255,0,0)
		// Web Color Oranges
	Case "ORANGERED"
		ll_color = RGB(255,69,0)
	Case "TOMATO"
		ll_color = RGB(255,99,71)
	Case "CORAL"
		ll_color = RGB(255,127,80)
	Case "DARKORANGE"
		ll_color = RGB(255,140,0)
	Case "ORANGE"
		ll_color = RGB(255,165,0)
		// Web Color Yellows
	Case "YELLOW"
		ll_color = RGB(255,255,0)
	Case "LIGHTYELLOW"
		ll_color = RGB(255,255,224)
	Case "LEMONCHIFFON"
		ll_color = RGB(255,250,205)
	Case "LIGHTGOLDENRODYELLOW"
		ll_color = RGB(250,250,210)
	Case "PAPAYAWHIP"
		ll_color = RGB(255,239,213)
	Case "MOCCASIN"
		ll_color = RGB(255,228,181)
	Case "PEACHPUFF"
		ll_color = RGB(255,218,185)
	Case "PALEGOLDENROD"
		ll_color = RGB(238,232,170)
	Case "KHAKI"
		ll_color = RGB(240,230,140)
	Case "DARKKHAKI"
		ll_color = RGB(189,183,107)
	Case "GOLD"
		ll_color = RGB(255,215,0)
		// Web Color Browns
	Case "CORNSILK"
		ll_color = RGB(255,248,220)
	Case "BLANCHEDALMOND"
		ll_color = RGB(255,235,205)
	Case "BISQUE"
		ll_color = RGB(255,228,196)
	Case "NAVAJOWHITE"
		ll_color = RGB(255,222,173)
	Case "WHEAT"
		ll_color = RGB(245,222,179)
	Case "BURLYWOOD"
		ll_color = RGB(222,184,135)
	Case "TAN"
		ll_color = RGB(210,180,140)
	Case "ROSYBROWN"
		ll_color = RGB(188,143,143)
	Case "SANDYBROWN"
		ll_color = RGB(244,164,96)
	Case "GOLDENROD"
		ll_color = RGB(218,165,32)
	Case "DARKGOLDENROD"
		ll_color = RGB(184,134,11)
	Case "PERU"
		ll_color = RGB(205,133,63)
	Case "CHOCOLATE"
		ll_color = RGB(210,105,30)
	Case "SADDLEBROWN"
		ll_color = RGB(139,69,19)
	Case "SIENNA"
		ll_color = RGB(160,82,45)
	Case "BROWN"
		ll_color = RGB(165,42,42)
	Case "MAROON"
		ll_color = RGB(128,0,0)
		// Web Color Greens
	Case "DARKOLIVEGREEN"
		ll_color = RGB(85,107,47)
	Case "OLIVE"
		ll_color = RGB(128,128,0)
	Case "OLIVEDRAB"
		ll_color = RGB(107,142,35)
	Case "YELLOWGREEN"
		ll_color = RGB(154,205,50)
	Case "LIMEGREEN"
		ll_color = RGB(50,205,50)
	Case "LIME"
		ll_color = RGB(0,255,0)
	Case "LAWNGREEN"
		ll_color = RGB(124,252,0)
	Case "CHARTREUSE"
		ll_color = RGB(127,255,0)
	Case "GREENYELLOW"
		ll_color = RGB(173,255,47)
	Case "SPRINGGREEN"
		ll_color = RGB(0,255,127)
	Case "MEDIUMSPRINGGREEN"
		ll_color = RGB(0,250,154)
	Case "LIGHTGREEN"
		ll_color = RGB(144,238,144)
	Case "PALEGREEN"
		ll_color = RGB(152,251,152)
	Case "DARKSEAGREEN"
		ll_color = RGB(143,188,143)
	Case "MEDIUMSEAGREEN"
		ll_color = RGB(60,179,113)
	Case "SEAGREEN"
		ll_color = RGB(46,139,87)
	Case "FORESTGREEN"
		ll_color = RGB(34,139,34)
	Case "GREEN"
		ll_color = RGB(0,128,0)
	Case "DARKGREEN"
		ll_color = RGB(0,100,0)
		// Web Color Cyans
	Case "MEDIUMAQUAMARINE"
		ll_color = RGB(102,205,170)
	Case "AQUA"
		ll_color = RGB(0,255,255)
	Case "CYAN"
		ll_color = RGB(0,255,255)
	Case "LIGHTCYAN"
		ll_color = RGB(224,255,255)
	Case "PALETURQUOISE"
		ll_color = RGB(175,238,238)
	Case "AQUAMARINE"
		ll_color = RGB(127,255,212)
	Case "TURQUOISE"
		ll_color = RGB(64,224,208)
	Case "MEDIUMTURQUOISE"
		ll_color = RGB(72,209,204)
	Case "DARKTURQUOISE"
		ll_color = RGB(0,206,209)
	Case "LIGHTSEAGREEN"
		ll_color = RGB(32,178,170)
	Case "CADETBLUE"
		ll_color = RGB(95,158,160)
	Case "DARKCYAN"
		ll_color = RGB(0,139,139)
	Case "TEAL"
		ll_color = RGB(0,128,128)
		// Web Color Blues
	Case "LIGHTSTEELBLUE"
		ll_color = RGB(176,196,222)
	Case "POWDERBLUE"
		ll_color = RGB(176,224,230)
	Case "LIGHTBLUE"
		ll_color = RGB(173,216,230)
	Case "SKYBLUE"
		ll_color = RGB(135,206,235)
	Case "LIGHTSKYBLUE"
		ll_color = RGB(135,206,250)
	Case "DEEPSKYBLUE"
		ll_color = RGB(0,191,255)
	Case "DODGERBLUE"
		ll_color = RGB(30,144,255)
	Case "CORNFLOWERBLUE"
		ll_color = RGB(100,149,237)
	Case "STEELBLUE"
		ll_color = RGB(70,130,180)
	Case "ROYALBLUE"
		ll_color = RGB(65,105,225)
	Case "BLUE"
		ll_color = RGB(0,0,255)
	Case "MEDIUMBLUE"
		ll_color = RGB(0,0,205)
	Case "DARKBLUE"
		ll_color = RGB(0,0,139)
	Case "NAVY"
		ll_color = RGB(0,0,128)
	Case "MIDNIGHTBLUE"
		ll_color = RGB(25,25,112)
		// Web Color Purples
	Case "LAVENDER"
		ll_color = RGB(230,230,250)
	Case "THISTLE"
		ll_color = RGB(216,191,216)
	Case "PLUM"
		ll_color = RGB(221,160,221)
	Case "VIOLET"
		ll_color = RGB(238,130,238)
	Case "ORCHID"
		ll_color = RGB(218,112,214)
	Case "FUCHSIA"
		ll_color = RGB(255,0,255)
	Case "MAGENTA"
		ll_color = RGB(255,0,255)
	Case "MEDIUMORCHID"
		ll_color = RGB(186,85,211)
	Case "MEDIUMPURPLE"
		ll_color = RGB(147,112,219)
	Case "BLUEVIOLET"
		ll_color = RGB(138,43,226)
	Case "DARKVIOLET"
		ll_color = RGB(148,0,211)
	Case "DARKORCHID"
		ll_color = RGB(153,50,204)
	Case "DARKMAGENTA"
		ll_color = RGB(139,0,139)
	Case "PURPLE"
		ll_color = RGB(128,0,128)
	Case "INDIGO"
		ll_color = RGB(75,0,130)
	Case "DARKSLATEBLUE"
		ll_color = RGB(72,61,139)
	Case "SLATEBLUE"
		ll_color = RGB(106,90,205)
	Case "MEDIUMSLATEBLUE"
		ll_color = RGB(123,104,238)
		// Web Color Whites
	Case "WHITE"
		ll_color = RGB(255,255,255)
	Case "SNOW"
		ll_color = RGB(255,250,250)
	Case "HONEYDEW"
		ll_color = RGB(240,255,240)
	Case "MINTCREAM"
		ll_color = RGB(245,255,250)
	Case "AZURE"
		ll_color = RGB(240,255,255)
	Case "ALICEBLUE"
		ll_color = RGB(240,248,255)
	Case "GHOSTWHITE"
		ll_color = RGB(248,248,255)
	Case "WHITESMOKE"
		ll_color = RGB(245,245,245)
	Case "SEASHELL"
		ll_color = RGB(255,245,238)
	Case "BEIGE"
		ll_color = RGB(245,245,220)
	Case "OLDLACE"
		ll_color = RGB(253,245,230)
	Case "FLORALWHITE"
		ll_color = RGB(255,250,240)
	Case "IVORY"
		ll_color = RGB(255,255,240)
	Case "ANTIQUEWHITE"
		ll_color = RGB(250,235,215)
	Case "LINEN"
		ll_color = RGB(250,240,230)
	Case "LAVENDERBLUSH"
		ll_color = RGB(255,240,245)
	Case "MISTYROSE"
		ll_color = RGB(255,228,225)
		// Web Color Grays/blacks
	Case "GAINSBORO"
		ll_color = RGB(220,220,220)
	Case "LIGHTGRAY"
		ll_color = RGB(211,211,211)
	Case "SILVER"
		ll_color = RGB(192,192,192)
	Case "DARKGRAY"
		ll_color = RGB(169,169,169)
	Case "GRAY"
		ll_color = RGB(128,128,128)
	Case "DIMGRAY"
		ll_color = RGB(105,105,105)
	Case "LIGHTSLATEGRAY"
		ll_color = RGB(119,136,153)
	Case "SLATEGRAY"
		ll_color = RGB(112,128,144)
	Case "DARKSLATEGRAY"
		ll_color = RGB(47,79,79)
	Case "BLACK"
		ll_color = RGB(0,0,0)
		// Default To White
	Case Else
		ll_color = RGB(255, 255, 255)
End Choose

Return ll_color


end function

public subroutine of_set_color (long al_cotrol_color);
Long ll_cotrol_color
Long  ll_rgb , ll_red
Int li_blue, li_green
String ls_hexred , ls_hexgreen, ls_hexblue


ll_rgb = al_cotrol_color
/*
li_blue = Int(ll_rgb/65536.0)
ll_rgb -= li_blue*Long(65536)
li_green = Int(ll_rgb/256.0)
ll_red = ll_rgb - li_green*256
*/
ll_red = mod(ll_rgb,256)
li_green = mod((ll_rgb / 256), 256)
li_blue = mod ((ll_rgb / 65536), 256)

sle_red.Text = String(ll_red)
sle_green.Text = String(li_green)
sle_blue .Text = String(li_blue)

sle_rgb.Text = "RGB(" +String(ll_red)+ ","+String(li_green) +"," + String(li_blue) + ")"
sle_long.Text = String (al_cotrol_color)

ls_hexred = f_conv_numbertohexstring(ll_red)
ls_hexgreen = f_conv_numbertohexstring(li_green)
ls_hexblue = f_conv_numbertohexstring(li_blue)
sle_hex.Text = "#" + ls_hexred + ls_hexgreen +ls_hexblue
sle_html.Text = "#" + ls_hexred + ls_hexgreen +ls_hexblue

datastore lds_colorname
lds_colorname = Create datastore
lds_colorname.DataObject = 'd_colorname'

datastore lds_rgb_colorname
lds_rgb_colorname = Create datastore
lds_rgb_colorname.DataObject = 'd_rgb_colorname'

Long ll_row
String ls_hexstring , ls_colorname, ls_hue
ls_hexstring = ls_hexred + ls_hexgreen +ls_hexblue
ll_row = lds_colorname.Find("upper(hex) = '" + Upper(Trim(ls_hexstring)) + "'" ,1,lds_colorname.RowCount())
If ll_row > 0 Then
	ls_colorname = lds_colorname.Object.color_name[ll_row]
	ls_hue = lds_colorname.Object.hue[ll_row]
Else
	ll_row = lds_rgb_colorname.Find("r = "  +string(ll_red) +  " and g = " + string(li_green)  + " and b = " + string(li_blue),1,lds_rgb_colorname.RowCount())
	If ll_row > 0 Then
		ls_colorname = lds_rgb_colorname.Object.color_name[ll_row]
	Else
		ls_colorname = "unknown"
		ls_hue = "unknown"
	End If
End If
Destroy lds_colorname
Destroy lds_rgb_colorname

sle_name.Text = ls_colorname



end subroutine

public function integer of_get_color (window a_object);long ll_xpos, ll_ypos  
ulong ul_rtn  
ulong ul_handle, ul_device  
// get handle  
ul_handle = handle(a_object)  
ul_device = GetDC(ul_handle)  
// get position of pointer  
ll_xpos = UnitsToPixels(a_object.PointerX(), XUnitsToPixels!)  
ll_ypos = UnitsToPixels(a_object.PointerY(), YUnitsToPixels!)  
  
ul_rtn = GetPixel(ul_device, ll_xpos, ll_ypos)  
ReleaseDC( ul_handle, ul_device)  
  
RETURN ul_rtn  
end function

on w_getcolor.create
this.p_1=create p_1
this.sle_crayolacolors=create sle_crayolacolors
this.sle_webcolors=create sle_webcolors
this.sle_pbcolors=create sle_pbcolors
this.cb_more=create cb_more
this.sle_name=create sle_name
this.st_name=create st_name
this.sle_long=create sle_long
this.st_long=create st_long
this.sle_html=create sle_html
this.st_html=create st_html
this.sle_hwb=create sle_hwb
this.st_hwb=create st_hwb
this.sle_hsl=create sle_hsl
this.st_5=create st_5
this.sle_hex=create sle_hex
this.st_4=create st_4
this.st_rgb=create st_rgb
this.sle_rgb=create sle_rgb
this.st_custom=create st_custom
this.hsb_blue=create hsb_blue
this.sle_blue=create sle_blue
this.sle_green=create sle_green
this.hsb_green=create hsb_green
this.hsb_red=create hsb_red
this.sle_red=create sle_red
this.st_3=create st_3
this.dw_crayolacolors=create dw_crayolacolors
this.st_2=create st_2
this.dw_webcolors=create dw_webcolors
this.st_1=create st_1
this.dw_pbcolors=create dw_pbcolors
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.p_1,&
this.sle_crayolacolors,&
this.sle_webcolors,&
this.sle_pbcolors,&
this.cb_more,&
this.sle_name,&
this.st_name,&
this.sle_long,&
this.st_long,&
this.sle_html,&
this.st_html,&
this.sle_hwb,&
this.st_hwb,&
this.sle_hsl,&
this.st_5,&
this.sle_hex,&
this.st_4,&
this.st_rgb,&
this.sle_rgb,&
this.st_custom,&
this.hsb_blue,&
this.sle_blue,&
this.sle_green,&
this.hsb_green,&
this.hsb_red,&
this.sle_red,&
this.st_3,&
this.dw_crayolacolors,&
this.st_2,&
this.dw_webcolors,&
this.st_1,&
this.dw_pbcolors,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_getcolor.destroy
destroy(this.p_1)
destroy(this.sle_crayolacolors)
destroy(this.sle_webcolors)
destroy(this.sle_pbcolors)
destroy(this.cb_more)
destroy(this.sle_name)
destroy(this.st_name)
destroy(this.sle_long)
destroy(this.st_long)
destroy(this.sle_html)
destroy(this.st_html)
destroy(this.sle_hwb)
destroy(this.st_hwb)
destroy(this.sle_hsl)
destroy(this.st_5)
destroy(this.sle_hex)
destroy(this.st_4)
destroy(this.st_rgb)
destroy(this.sle_rgb)
destroy(this.st_custom)
destroy(this.hsb_blue)
destroy(this.sle_blue)
destroy(this.sle_green)
destroy(this.hsb_green)
destroy(this.hsb_red)
destroy(this.sle_red)
destroy(this.st_3)
destroy(this.dw_crayolacolors)
destroy(this.st_2)
destroy(this.dw_webcolors)
destroy(this.st_1)
destroy(this.dw_pbcolors)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;dw_pbcolors.scrolltorow(2)
sle_pbcolors.setfocus( )
end event

type p_1 from picture within w_getcolor
event we_getcolor ( dragobject a_object )
integer x = 3657
integer y = 128
integer width = 951
integer height = 1632
string picturename = "color.jpg"
boolean focusrectangle = false
end type

event we_getcolor(dragobject a_object);/*
int li_r, li_b, li_g
ulong lul_color
n_pixelcolor lnv_color
lul_color =  lnv_color.of_get_color(a_object)
//max value of unsigned long indicates error
IF lul_color = 4294967295 THEN
	r_color.fillcolor = 0
	sle_ul.text = 'Invalid Color'
	sle_rgbmouse.text = ''
	RETURN
END IF
// get RGB values
li_r = mod(lul_color,256)
li_g = mod((lul_color / 256), 256)
li_b = mod ((lul_color / 65536), 256)

sle_ul.text = 'U Long: ' + string(lul_color)
sle_rgbmouse.text = 'RGB( ' + string(li_r) + ', ' + string(li_g) + ', ' + string(li_b) + ')'
sle_rgbmouse.textcolor = RGB(li_r,li_g,li_b) //just to prove the values are correct
r_color.fillcolor = lul_color
*/
int li_r, li_b, li_g
ulong lul_color

long ll_xpos, ll_ypos
ulong ul_rtn
ulong ul_handle, ul_device
// get handle
ul_handle = handle(this)
ul_device = GetDC(ul_handle)
ll_xpos = UnitsToPixels(this.PointerX(), XUnitsToPixels!)
ll_ypos = UnitsToPixels(this.PointerY(), YUnitsToPixels!)

int i
str_point lstr_point

GetCursorPos(lstr_point)
ul_rtn = GetPixel(ul_device,ll_xpos,ll_ypos)

//ul_rtn = GetPixel(ul_device, lstr_point.posx, lstr_point.posy)
ReleaseDC( ul_handle, ul_device)

//RETURN ul_rtn

lul_color= ul_rtn

//max value of unsigned long indicates error
IF lul_color = 4294967295 THEN
	st_custom.backcolor = 0
	sle_rgb.text = 'Invalid Color'
	st_rgb.text = ''
	RETURN
END IF
// get RGB values
li_r = mod(lul_color,256)
li_g = mod((lul_color / 256), 256)
li_b = mod ((lul_color / 65536), 256)

sle_long.text =string(lul_color)
sle_rgb.text = 'RGB( ' + string(li_r) + ', ' + string(li_g) + ', ' + string(li_b) + ')'
//sle_rgbmouse.textcolor = RGB(li_r,li_g,li_b) //just to prove the values are correct
st_custom.backcolor = lul_color
of_set_color(lul_color)
end event

event clicked;dragobject ld_object
ld_object = THIS
this.event we_getcolor(ld_object)
end event

type sle_crayolacolors from singlelineedit within w_getcolor
integer x = 1792
integer y = 96
integer width = 841
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
borderstyle borderstyle = stylelowered!
end type

event modified;long ll_row
ll_row = dw_crayolacolors.find("upper(color_name) like '" + upper(trim(this.text)) + "%'" ,1,dw_crayolacolors.rowcount())
if ll_row > 0 then
	dw_crayolacolors.scrolltorow(ll_row)
end if

end event

type sle_webcolors from singlelineedit within w_getcolor
integer x = 914
integer y = 96
integer width = 841
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
borderstyle borderstyle = stylelowered!
end type

event modified;long ll_row
ll_row = dw_webcolors.find("upper(color_name) like '" + upper(trim(this.text)) + "%'" ,1,dw_webcolors.rowcount())
if ll_row > 0 then
	dw_webcolors.scrolltorow(ll_row)
end if

end event

type sle_pbcolors from singlelineedit within w_getcolor
integer x = 37
integer y = 96
integer width = 841
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
borderstyle borderstyle = stylelowered!
end type

event modified;long ll_row
ll_row = dw_pbcolors.find("upper(color_name) like '" + upper(trim(this.text)) + "%'" ,1,dw_pbcolors.rowcount())
if ll_row > 0 then
	dw_pbcolors.scrolltorow(ll_row)
end if

end event

type cb_more from commandbutton within w_getcolor
integer x = 3328
integer y = 672
integer width = 242
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "More >>"
end type

event clicked;long  red, green, blue 

long custom[ ]

integer li_color

red = st_custom.backcolor


custom[1]=0	//	Black
custom[2]=16777215	//	White
custom[3]=12632256	//	Gray
custom[4]=8421504	//	Dark Grey
custom[5]=255	//	Red
custom[6]=128	//	Dark Red
custom[7]=65280	//	Green
custom[8]=32768	//	Dark Green
custom[9]=16711680	//	Blue
custom[10]=8388608	//	Dark Blue
custom[11]=16711935	//	Magenta
custom[12]=8388736	//	Dark Magenta
custom[13]=16776960	//	Cyan
custom[14]=8421376	//	Dark Cyan
custom[15]=65535	//	Yellow
custom[16]=32896	//	Brown



li_color = ChooseColor( red, custom [ ] )
//rr_1.fillcolor = red
st_custom.backcolor =  red
//messagebox('',red)

long  ll_rgb , ll_red
int li_blue, li_green
 ll_rgb=red

li_blue=int(ll_rgb/65536.0)

ll_rgb -= li_blue*Long(65536)

li_green=int(ll_rgb/256.0)

ll_red = ll_rgb - li_green*256

sle_red.text = string(ll_red)
sle_green.text = string(li_green)
sle_blue .text = string(li_blue)
ii_r =  ll_red
ii_g = li_green
ii_b = li_blue
hsb_red.position = ll_red
hsb_green.position = li_green
hsb_blue.position = li_blue

of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type sle_name from singlelineedit within w_getcolor
integer x = 2889
integer y = 896
integer width = 695
integer height = 84
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "NAME"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_name from statictext within w_getcolor
integer x = 2670
integer y = 896
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "NAME:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_long from singlelineedit within w_getcolor
integer x = 2889
integer y = 992
integer width = 695
integer height = 84
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "LONG"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_long from statictext within w_getcolor
integer x = 2670
integer y = 992
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "LONG:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_html from singlelineedit within w_getcolor
integer x = 2889
integer y = 1280
integer width = 695
integer height = 84
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "HTML"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_html from statictext within w_getcolor
integer x = 2670
integer y = 1280
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HTML:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_hwb from singlelineedit within w_getcolor
integer x = 2889
integer y = 1472
integer width = 695
integer height = 84
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "HWB"
borderstyle borderstyle = stylelowered!
end type

type st_hwb from statictext within w_getcolor
integer x = 2670
integer y = 1472
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HWB:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_hsl from singlelineedit within w_getcolor
integer x = 2889
integer y = 1376
integer width = 695
integer height = 84
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "HSL"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_getcolor
integer x = 2670
integer y = 1376
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HSL:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_hex from singlelineedit within w_getcolor
integer x = 2889
integer y = 1184
integer width = 695
integer height = 84
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "HEX"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_getcolor
integer x = 2670
integer y = 1184
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HEX:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_rgb from statictext within w_getcolor
integer x = 2670
integer y = 1088
integer width = 206
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RGB:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_rgb from singlelineedit within w_getcolor
integer x = 2889
integer y = 1088
integer width = 695
integer height = 84
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "RGB"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_custom from statictext within w_getcolor
integer x = 2743
integer y = 672
integer width = 585
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long  red, green, blue 

long custom[ ]

integer li_color

red = this.backcolor


custom[1]=0	//	Black
custom[2]=16777215	//	White
custom[3]=12632256	//	Gray
custom[4]=8421504	//	Dark Grey
custom[5]=255	//	Red
custom[6]=128	//	Dark Red
custom[7]=65280	//	Green
custom[8]=32768	//	Dark Green
custom[9]=16711680	//	Blue
custom[10]=8388608	//	Dark Blue
custom[11]=16711935	//	Magenta
custom[12]=8388736	//	Dark Magenta
custom[13]=16776960	//	Cyan
custom[14]=8421376	//	Dark Cyan
custom[15]=65535	//	Yellow
custom[16]=32896	//	Brown



li_color = ChooseColor( red, custom [ ] )
//rr_1.fillcolor = red
st_custom.backcolor =  red
//messagebox('',red)

long  ll_rgb , ll_red
int li_blue, li_green
 ll_rgb=red

li_blue=int(ll_rgb/65536.0)

ll_rgb -= li_blue*Long(65536)

li_green=int(ll_rgb/256.0)

ll_red = ll_rgb - li_green*256

sle_red.text = string(ll_red)
sle_green.text = string(li_green)
sle_blue .text = string(li_blue)
ii_r =  ll_red
ii_g = li_green
ii_b = li_blue
hsb_red.position = ll_red
hsb_green.position = li_green
hsb_blue.position = li_blue

of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type hsb_blue from hscrollbar within w_getcolor
integer x = 2962
integer y = 416
integer width = 635
integer height = 68
integer maxposition = 255
end type

event lineleft;/////////////////////////////////////////////////////////////////////
// Decrement the blue color value by 10
/////////////////////////////////////////////////////////////////////

if ii_b < 1 then
	ii_b = 0
else
	ii_b = ii_b - 1
end if
sle_blue.text = String (ii_b)
this.position = ii_b

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))

end event

event lineright;//////////////////////////////////////////////////////////////////////
// increment the blue color value by 10
//////////////////////////////////////////////////////////////////////

if ii_b > 245 then
	ii_b = 255
else
	ii_b = ii_b + 1
end if
sle_blue.text = String (ii_b)
this.position = ii_b

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event moved;/////////////////////////////////////////////////////////////////////
// Change the blue color value based on current position of scrollbar
/////////////////////////////////////////////////////////////////////

ii_b = this.position
sle_blue.text = String (ii_b)

// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))

end event

event pageleft;//////////////////////////////////////////////////////////////////////
// Decrement the blue color value by 50
//////////////////////////////////////////////////////////////////////

if ii_b < 50 then
	ii_b = 0
else
	ii_b = ii_b - 50
end if
sle_blue.text = String (ii_b)
this.position = ii_b

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event pageright;//////////////////////////////////////////////////////////////////////
// increment the blue color value by 50
//////////////////////////////////////////////////////////////////////

if ii_b > 205 then
	ii_b = 255
else
	ii_b = ii_b + 50
end if
sle_blue.text = String (ii_b)
this.position = ii_b

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type sle_blue from singlelineedit within w_getcolor
integer x = 2743
integer y = 416
integer width = 210
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
string text = "0"
borderstyle borderstyle = stylelowered!
end type

event modified;ii_b = integer(sle_blue.text )
hsb_blue.position = ii_b
// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type sle_green from singlelineedit within w_getcolor
integer x = 2743
integer y = 320
integer width = 210
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
string text = "0"
borderstyle borderstyle = stylelowered!
end type

event modified;
ii_g  = integer (sle_green.text )
hsb_green.position = ii_g
// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type hsb_green from hscrollbar within w_getcolor
integer x = 2962
integer y = 320
integer width = 635
integer height = 68
integer maxposition = 255
end type

event lineleft;/////////////////////////////////////////////////////////////////////
// Decrement the green color value by 10
/////////////////////////////////////////////////////////////////////

if ii_g < 1 then
	ii_g = 0
else
	ii_g = ii_g - 1
end if
sle_green.text = String (ii_g)
this.position = ii_g
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))


end event

event lineright;//////////////////////////////////////////////////////////////////////
// increment the green color value by 10
//////////////////////////////////////////////////////////////////////

if ii_g > 245 then
	ii_g = 255
else
	ii_g = ii_g + 1
end if
sle_green.text = String (ii_g)
this.position = ii_g

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))

end event

event moved;/////////////////////////////////////////////////////////////////////
// Change the green color value based on current position of scrollbar
/////////////////////////////////////////////////////////////////////

ii_g = this.position
sle_green.text = String (ii_g)

// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event pageleft;//////////////////////////////////////////////////////////////////////
// Decrement the green color value by 50
//////////////////////////////////////////////////////////////////////

if ii_g < 50 then
	ii_g = 0
else
	ii_g = ii_g - 50
end if
sle_green.text = String (ii_g)
this.position = ii_g

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event pageright;//////////////////////////////////////////////////////////////////////
// increment the green color value by 50
//////////////////////////////////////////////////////////////////////

if ii_g > 205 then
	ii_g = 255
else
	ii_g = ii_g + 50
end if
sle_green.text = String (ii_g)
this.position = ii_g

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

type hsb_red from hscrollbar within w_getcolor
integer x = 2962
integer y = 192
integer width = 635
integer height = 68
integer maxposition = 255
end type

event lineleft;/////////////////////////////////////////////////////////////////////
// Decrement the red color value by 10
/////////////////////////////////////////////////////////////////////

if ii_r < 1 then
	ii_r = 0
else
	ii_r = ii_r - 1
end if
sle_red.text = String (ii_r)
this.position = ii_r
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event lineright;
//////////////////////////////////////////////////////////////////////
// increment the red color value by 10
//////////////////////////////////////////////////////////////////////

if ii_r > 245 then
	ii_r = 255
else
	ii_r = ii_r + 1
end if
sle_red.text = String (ii_r)
this.position = ii_r

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event moved;/////////////////////////////////////////////////////////////////////
// Change the red color value based on current position of scrollbar
/////////////////////////////////////////////////////////////////////

ii_r = this.position
sle_red.text = String (ii_r)

// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event pageleft;//////////////////////////////////////////////////////////////////////
// Decrement the red color value by 50
//////////////////////////////////////////////////////////////////////

if ii_r < 50 then
	ii_r = 0
else
	ii_r = ii_r - 50
end if
sle_red.text = String (ii_r)
this.position = ii_r

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))
end event

event pageright;//////////////////////////////////////////////////////////////////////
// increment the red color value by 50
//////////////////////////////////////////////////////////////////////

if ii_r > 205 then
	ii_r = 255
else
	ii_r = ii_r + 50
end if
sle_red.text = String (ii_r)
this.position = ii_r

//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))

end event

type sle_red from singlelineedit within w_getcolor
integer x = 2743
integer y = 192
integer width = 210
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
string text = "0"
borderstyle borderstyle = stylelowered!
end type

event modified;
ii_r = integer ( sle_red.text )
hsb_red.position = ii_r
// Change the test palette color
//rr_1.fillcolor = RGB (ii_r, ii_g, ii_b)
st_custom.backcolor =  RGB (ii_r, ii_g, ii_b)
of_set_color(RGB (ii_r, ii_g, ii_b))


end event

type st_3 from statictext within w_getcolor
integer x = 1792
integer y = 32
integer width = 841
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Crayola Colors:"
boolean focusrectangle = false
end type

type dw_crayolacolors from datawindow within w_getcolor
integer x = 1792
integer y = 192
integer width = 841
integer height = 1536
integer taborder = 90
string title = "none"
string dataobject = "d_crayolacolors"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;If currentrow <= 0 Then Return 1

Long ll_cotrol_color
Long  ll_rgb , ll_red
Int li_blue, li_green


ll_cotrol_color = f_getcrayolacolor(This.Object.color_name[currentrow])
st_custom.BackColor =  ll_cotrol_color

ll_rgb = ll_cotrol_color

li_blue = Int(ll_rgb/65536.0)
ll_rgb -= li_blue*Long(65536)
li_green = Int(ll_rgb/256.0)
ll_red = ll_rgb - li_green*256

sle_red.Text = String(ll_red)
sle_green.Text = String(li_green)
sle_blue .Text = String(li_blue)

ii_r =  ll_red
ii_g = li_green
ii_b = li_blue

hsb_red.Position = ll_red
hsb_green.Position = li_green
hsb_blue.Position = li_blue

of_set_color(ll_cotrol_color)
sle_name.text = This.Object.color_name[currentrow]

end event

type st_2 from statictext within w_getcolor
integer x = 914
integer y = 32
integer width = 841
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Web Colors:"
boolean focusrectangle = false
end type

type dw_webcolors from datawindow within w_getcolor
integer x = 914
integer y = 192
integer width = 841
integer height = 1536
integer taborder = 80
string title = "none"
string dataobject = "d_webcolors"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;If currentrow <= 0 Then Return 1

Long ll_cotrol_color
Long  ll_rgb , ll_red
Int li_blue, li_green


ll_cotrol_color = f_getwebcolor(This.Object.color_name[currentrow])
st_custom.BackColor =  ll_cotrol_color

ll_rgb = ll_cotrol_color

li_blue = Int(ll_rgb/65536.0)
ll_rgb -= li_blue*Long(65536)
li_green = Int(ll_rgb/256.0)
ll_red = ll_rgb - li_green*256

sle_red.Text = String(ll_red)
sle_green.Text = String(li_green)
sle_blue .Text = String(li_blue)

ii_r =  ll_red
ii_g = li_green
ii_b = li_blue

hsb_red.Position = ll_red
hsb_green.Position = li_green
hsb_blue.Position = li_blue

of_set_color(ll_cotrol_color)
sle_name.text = This.Object.color_name[currentrow]


end event

type st_1 from statictext within w_getcolor
integer x = 37
integer y = 32
integer width = 841
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PowerBuilder Colors:"
boolean focusrectangle = false
end type

type dw_pbcolors from datawindow within w_getcolor
integer x = 37
integer y = 192
integer width = 841
integer height = 1568
integer taborder = 70
string title = "none"
string dataobject = "d_pbcolors"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;If currentrow <= 0 Then Return 1

Long ll_cotrol_color
Long  ll_rgb , ll_red
Int li_blue, li_green


ll_cotrol_color = f_getpbcolor(This.Object.color_name[currentrow])
st_custom.BackColor =  ll_cotrol_color

ll_rgb = ll_cotrol_color
/*
li_blue = Int(ll_rgb/65536.0)
ll_rgb -= li_blue*Long(65536)
li_green = Int(ll_rgb/256.0)
ll_red = ll_rgb - li_green*256
*/

li_blue = (ll_rgb / 65536)
li_green = (ll_rgb - (li_blue * 65536)) / 256
ll_red =  (ll_rgb - (li_blue * 65536) - (li_green * 256))

sle_red.Text = String(ll_red)
sle_green.Text = String(li_green)
sle_blue .Text = String(li_blue)

ii_r =  ll_red
ii_g = li_green
ii_b = li_blue

hsb_red.Position = ll_red
hsb_green.Position = li_green
hsb_blue.Position = li_blue

of_set_color(ll_cotrol_color)
sle_name.text = This.Object.color_name[currentrow]




end event

type gb_1 from groupbox within w_getcolor
integer x = 2670
integer y = 96
integer width = 951
integer height = 448
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RGB"
end type

type gb_2 from groupbox within w_getcolor
integer x = 2670
integer y = 576
integer width = 951
integer height = 200
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom Color"
end type

type gb_3 from groupbox within w_getcolor
integer x = 2670
integer y = 800
integer width = 951
integer height = 960
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Color Values"
end type

