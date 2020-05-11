extends Control

export var websocket_url = "ws://127.0.0.1:8080/values"
var _client = WebSocketClient.new()

var DMX_Sender
var timer
var hasChange
var values
var page = 0
var DMX: Array = []

var ch1
var ch2
var ch3
var ch4
var ch5
var ch6
var ch7
var ch8
var chm

var pid = null;

func _ready():

	hasChange = false
	values = {1:0,2:2,3:0,4:0,5:0,6:0,7:0,8:0}
	var label = Label.new()
	set_size(OS.get_window_size())
	DMX_Sender = get_node("HTTPRequest")
	DMX_Sender.set_use_threads(true)
	timer = get_node("Timer")
	timer.set_wait_time( 0.001)
	timer.connect("timeout", self, "_on_Timer_timeout")
	for i in range(512):
		DMX.append(0)
		
	get_node("TabContainer/Console/VSlider/Label").text = str(0)
	get_node("TabContainer/Console/VSlider2/Label").text = str(0)
	get_node("TabContainer/Console/VSlider3/Label").text = str(0)
	get_node("TabContainer/Console/VSlider4/Label").text = str(0)
	get_node("TabContainer/Console/VSlider5/Label").text = str(0)
	get_node("TabContainer/Console/VSlider6/Label").text = str(0)
	get_node("TabContainer/Console/VSlider7/Label").text = str(0)
	get_node("TabContainer/Console/VSlider8/Label").text = str(0)
	get_node("TabContainer/Console/Master/Label").text = str(0)
	get_node("TabContainer/Console/Master/LineEdit").set_text("Master")
	get_node("TabContainer/Console/Master/LineEdit").set_editable(false)
	page_changed()

func _on_VSlider_value_changed(value):
	get_node("TabContainer/Console/VSlider/Label").text = str(int(get_node("TabContainer/Console/VSlider").value / 2.55))
	DMX[(page*8)+0] = get_node("TabContainer/Console/VSlider").value 
	values[1]=get_node("TabContainer/Console/VSlider").value
	value=get_node("TabContainer/Console/VSlider").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch1+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider2_value_changed(value):
	get_node("TabContainer/Console/VSlider2/Label").text = str(int(get_node("TabContainer/Console/VSlider2").value/2.55))
	values[2]=get_node("TabContainer/Console/VSlider2").value
	DMX[(page*8)+1] = get_node("TabContainer/Console/VSlider2").value
	value=get_node("TabContainer/Console/VSlider2").value
	var ch = ch2+1
	print(ch)
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch2+1)+"&value="+str(value))  
	hasChange = true

func _on_VSlider3_value_changed(value):
	get_node("TabContainer/Console/VSlider3/Label").text = str(int(get_node("TabContainer/Console/VSlider3").value/2.55))
	DMX[(page*8)+2] = get_node("TabContainer/Console/VSlider3").value 
	values[3]=get_node("TabContainer/Console/VSlider3").value
	value=get_node("TabContainer/Console/VSlider3").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch3+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider4_value_changed(value):
	get_node("TabContainer/Console/VSlider4/Label").text = str(int(get_node("TabContainer/Console/VSlider4").value/2.55))
	DMX[(page*8)+3] = get_node("TabContainer/Console/VSlider4").value 
	values[4]=get_node("TabContainer/Console/VSlider4").value
	value=get_node("TabContainer/Console/VSlider4").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch4+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider5_value_changed(value):
	get_node("TabContainer/Console/VSlider5/Label").text = str(int(get_node("TabContainer/Console/VSlider5").value/2.55))
	DMX[(page*8)+4] = get_node("TabContainer/Console/VSlider5").value 
	values[5]=get_node("TabContainer/Console/VSlider5").value
	value=get_node("TabContainer/Console/VSlider5").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch5+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider6_value_changed(value):
	get_node("TabContainer/Console/VSlider6/Label").text = str(int(get_node("TabContainer/Console/VSlider6").value/2.55))
	DMX[(page*8)+5] = get_node("TabContainer/Console/VSlider6").value 
	values[6]=get_node("TabContainer/Console/VSlider6").value
	value=get_node("TabContainer/Console/VSlider6").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch6+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider7_value_changed(value):
	get_node("TabContainer/Console/VSlider7/Label").text = str(int(get_node("TabContainer/Console/VSlider7").value/2.55))
	DMX[(page*8)+6] = get_node("TabContainer/Console/VSlider7").value 
	values[7]= get_node("TabContainer/Console/VSlider7").value
	value=get_node("TabContainer/Console/VSlider7").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch7+1)+"&value="+str(value)) 
	hasChange = true

func _on_VSlider8_value_changed(value):
	get_node("TabContainer/Console/VSlider8/Label").text = str(int(get_node("TabContainer/Console/VSlider8").value/2.55))
	DMX[(page*8)+7] = get_node("TabContainer/Console/VSlider8").value 
	values[8]= get_node("TabContainer/Console/VSlider8").value
	value=get_node("TabContainer/Console/VSlider8").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch="+str(ch8+1)+"&value="+str(value)) 
	hasChange = true
	
func _on_Master_value_changed(value):
	get_node("TabContainer/Console/Master/Label").text = str(int(get_node("TabContainer/Console/Master").value/2.55))
	values[9]=get_node("TabContainer/Console/Master").value
	value=get_node("TabContainer/Console/Master").value
	DMX_Sender.request("http://192.168.1.94/DMX?Ch=0&value="+str(value)) 
	hasChange = true

func _on_Timer_timeout():
	#if hasChange:
	if false:
		var tmp = JSON.print(values)
		DMX_Sender.request("http://192.168.1.94/DMX?json="+tmp)
		hasChange = false

func _process(delta):
	_client.poll()

func _on_Page_Down_pressed():
	if page > 0 :
		page = page-1
		page_changed()

func _on_Page_Up_pressed():
	if page < 63 :
		page = page+1
		page_changed()

func page_changed():
	get_node("TabContainer/Console/VSlider").value = DMX[(page*8)+0]
	ch1 = (page*8)+0
	get_node("TabContainer/Console/VSlider/LineEdit").set_text("Ch: " + str((page*8)+1))
	get_node("TabContainer/Console/VSlider2").value = DMX[(page*8)+1]
	ch2 = (page*8)+1
	get_node("TabContainer/Console/VSlider2/LineEdit").set_text("Ch: " + str((page*8)+2))
	get_node("TabContainer/Console/VSlider3").value = DMX[(page*8)+2]
	ch3 = (page*8)+2
	get_node("TabContainer/Console/VSlider3/LineEdit").set_text("Ch: " + str((page*8)+3))
	get_node("TabContainer/Console/VSlider4").value = DMX[(page*8)+3]
	ch4 = (page*8)+3
	get_node("TabContainer/Console/VSlider4/LineEdit").set_text("Ch: " + str((page*8)+4))
	get_node("TabContainer/Console/VSlider5").value = DMX[(page*8)+4]
	ch5 = (page*8)+4
	get_node("TabContainer/Console/VSlider5/LineEdit").set_text("Ch: " + str((page*8)+5))
	get_node("TabContainer/Console/VSlider6").value = DMX[(page*8)+5]
	ch6 = (page*8)+5
	get_node("TabContainer/Console/VSlider6/LineEdit").set_text("Ch: " + str((page*8)+6))
	get_node("TabContainer/Console/VSlider7").value = DMX[(page*8)+6]
	ch7 = (page*8)+6
	get_node("TabContainer/Console/VSlider7/LineEdit").set_text("Ch: " + str((page*8)+7))
	get_node("TabContainer/Console/VSlider8").value = DMX[(page*8)+7]
	ch8 = (page*8)+7
	get_node("TabContainer/Console/VSlider8/LineEdit").set_text("Ch: " + str((page*8)+8))
	hasChange = false
