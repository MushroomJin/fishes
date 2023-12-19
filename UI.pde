import controlP5.*;
ControlP5 cp5;

void UI(){
  int sliderWidth = 300;
  int sliderHeight = 30;
  
  cp5 = new ControlP5(this,createFont("微软雅黑", 14));
  
  cp5.addSlider("supply_speed")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0.01,1)   
    .setValue(0.5)
    .setColorBackground(#786482)
    .setColorActive(#D2C8E6)
    .setColorForeground(#A096B4)
    ;
    
  cp5.addSlider("speed")
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0.01,5)   
    .setValue(3)
    .setColorBackground(#786482)
    .setColorActive(#D2C8E6)
    .setColorForeground(#A096B4)
    ;
    
  cp5.addSlider("ship_num")
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(20,1000)   
    .setValue(30)
    .setColorBackground(#786482)
    .setColorActive(#D2C8E6)
    .setColorForeground(#A096B4)
    .setLabel("number")
    ;
    
  cp5.addSlider("eat")
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(1,100)   //0.01,0.1
    .setValue(50)
    .setColorBackground(#786482)
    .setColorActive(#D2C8E6)
    .setColorForeground(#A096B4)
    ;
    
  cp5.addSlider("average_food")
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(3,10)   
    .setValue(5)
    .setColorBackground(#786482)
    .setColorActive(#D2C8E6)
    .setColorForeground(#A096B4)
    .setLabel("food")
    ;
    
  cp5.setAutoDraw(false);
}

void controlEvent(ControlEvent theEvent){
  if(theEvent.isFrom(cp5.getController("ship_num"))  ||
     theEvent.isFrom(cp5.getController("average_food"))){
     update();
   }
}
