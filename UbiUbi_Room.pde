ArrayList<Room> rooms;
HashMap<String, Color> keyColorMap;
HashMap<String, Room> keyRoomMap;
String allOffKey = "3";
Room selectedRoom;
void deactivateAllRooms() {
  for (Room r: rooms) {
    r.active = false;
  }
}
void setup() {
  fullScreen();
  //size(1000, 800);
  rooms = new ArrayList<Room>();
  
  Room entrance = (new Room("Entrance", 400, 10, 280, 390));
  Room kitchen = (new Room("Kitchen", 10, 410, 500, 380));
  Room bedroom =  (new Room("Bedroom", 700, 10, 500, 400));
  Room livingRoom = (new Room("Living room", 680, 420, 500, 380));
  
  rooms.add(entrance);
  rooms.add(kitchen);
  rooms.add(bedroom);
  rooms.add(livingRoom);
  
  keyRoomMap = new HashMap<String, Room>();
  keyColorMap = new HashMap<String, Color>();
  
  keyRoomMap.put("g", livingRoom);
  keyRoomMap.put("i", bedroom);
  keyRoomMap.put("k", kitchen);
  keyRoomMap.put("m", entrance);
  
  keyColorMap.put("7", new Color(color(0, 0, 255)));
  keyColorMap.put("5", new Color(color(0, 255, 0)));
  keyColorMap.put("3", new Color(color(255, 255, 255)));
  keyColorMap.put("1", new Color(color(255, 255, 0)));
  keyColorMap.put("d", new Color(color(255, 0,0)));
  
  
}
void draw() {
  fill(255);
  rect(0,0, width, height);
  for (Room room: rooms) {
    room.drawRoom();  
    
  } 
}
void keyPressed() { 
  String keyString = Character.toString(key);  
  keyString = keyString.toLowerCase();
  /*if (keyString == allOffKey) {
    // turn off everything
    for (Room r: rooms) {
      r.lightColour = color(255);
    }
    return;
  }
  */
  if (keyRoomMap.keySet().contains(keyString)) {
    selectedRoom = keyRoomMap.get(keyString);
    println("SelectedROOM");
  }
  else if (selectedRoom != null && keyColorMap.keySet().contains(keyString)) {
    // pressed a color
    color selectedColor = keyColorMap.get(keyString).theColor;
    selectedRoom.lightColour = selectedColor;
    deactivateAllRooms();
    selectedRoom.active = true;
    println("SelectedCOLOR");
    
  }
  
}