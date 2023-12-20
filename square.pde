int food_num = 0;
int average_food = 5;
float min_distance = 100;
ArrayList<food> foods;
float supply_speed = 0.5;

int ship_num = 30;
float speed = 3;
ArrayList<ship> ships;

float real_height = 1000;
float real_width = 2000;

float eat_distance = 200;
float eat_speed = 0.05;
float eat = 50;

void setup(){
  size(1800,900,P3D);  //扩展范围在2000,1000
  foods = new ArrayList<food>();
  ships = new ArrayList<ship>();
  for(int i=0;i<average_food-1;i++){
    foods.add(new food());
  }
  for(int i=0;i<ship_num;i++){
    ships.add(new ship());
  }
  UI();
  background(0);
}


void draw(){
  fill(0,0,0,20);
  eat_speed = eat /1000;
  rect(-100,-50,real_width,real_height);
  //background(0,150);
  check_food();
  for(int i=0;i<ship_num;i++){
    ships.get(i).changemove();
  }
  for(int i=0;i<ship_num;i++){
    ships.get(i).move();
  }
  display();
  cp5.draw();
  saveFrame("frames/####.tif");
}



void display(){
  for(int i=0;i<food_num;i++){
    foods.get(i).show();
  }
  for(int i=0;i<ship_num;i++){
    ships.get(i).show();
  }
}

void keyPressed(){
}

void update(){
  if(foods.isEmpty()==false){foods.clear();food_num=0;}
  if(ships.isEmpty()==false){ships.clear();}
  for(int i=0;i<average_food-1;i++){
    foods.add(new food());
  }
  for(int i=0;i<ship_num;i++){
    ships.add(new ship());
  }
  //println(ship_num);
}
