class food{
  float fx,fy;
  float food_left;
  int index;
  
  food(){
    float x = random(0,1800);
    float y = random(0,900);
    while(check_around(x,y)){
      x = random(0,1800);
      y = random(0,900);
    }
    fx = x;
    fy = y;
    food_num++;
    food_left = 50;
    index = food_num;
  }
  
  void show(){
    noStroke();
    fill(255);
    circle(fx,fy,food_left);
    //float cx = fx - food_left/10;
    //float cy = fy - food_left/10;
    //rect(cx,cy,food_left/5,food_left/5);
  }
}


void check_food(){
  for(int i=0;i<food_num;i++){
    for(int j=0;j<ship_num;j++){
      if(dist(foods.get(i),ships.get(j))<eat_distance){
        foods.get(i).food_left -= eat_speed;
      }
    }
  }
  
  for(int i=0;i<food_num;i++){
    if(foods.get(i).food_left<=0){
      foods.remove(foods.get(i));
      food_num--;
    }
  }
  
  float pp = random(0,100);
  if(food_num<average_food-2){
    if(pp<5*supply_speed){foods.add(new food());}}
  else if(food_num==average_food-1){
    if(pp<4*supply_speed){foods.add(new food());}}
  else if(food_num==average_food){
    if(pp<3*supply_speed){foods.add(new food());}}
  else if(food_num==average_food+1){
    if(pp<2*supply_speed){foods.add(new food());}}
  else if(food_num==average_food+2){
    if(pp<supply_speed){foods.add(new food());}}
}
