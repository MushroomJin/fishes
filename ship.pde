class ship{
  float sx,sy;
  float gox,goy;
  float fix_gox,fix_goy;
  float fix_fix_gox,fix_fix_goy;
  color s_color;
  int rotating;
  
  
  ship(){
    gox = random(0,1);
    goy = sqrt(1-gox*gox);
    if(random(0,1)<0.5){gox = -1*gox;}
    if(random(0,1)<0.5){goy = -1*goy;}
    float tem_lo = random(0,(real_height*2+real_width*2));
    if(tem_lo<real_width){
      sx = tem_lo;
      sy = -50;
      gox = abs(gox);
    }
    else if(tem_lo<real_height+real_width){
      sx = 1900;
      sy = tem_lo-real_width;
      goy = -1*abs(goy);
    }
    else if(tem_lo<(real_width*2+real_height)){
      sx = real_height-(tem_lo-real_height-real_width);
      sy = 950;
      gox = -1*abs(gox);
    }
    else{
      sx = -100;
      sy = real_height-(tem_lo-real_width*2-real_height);
      goy = abs(goy);
    }
    fix_gox = gox;
    fix_goy = goy;
    fix_fix_gox = gox;
    fix_fix_goy = goy;
    s_color = color(random(100,255),random(100,255),random(100,255));
    rotating = 2*floor(random(0,1.99999))-1;
  }
  
  void changemove(){
    for(int i=0;i<food_num;i++){
      float tem_d = dist(foods.get(i),this);
      if(tem_d<eat_distance+260){
        float a = foods.get(i).fx-sx;
        float b = foods.get(i).fy-sy;
        float c = sqrt(a*a+b*b);
        float d = a/c;
        float e = b/c;
        a = rotating*a/c;
        b = -1*rotating*b/c;
        if(tem_d<eat_distance-40){
          gox = b;
          goy = a;
          fix_gox = b;
          fix_goy = a;
        }
        else{
          gox = b*(eat_distance+260-tem_d)/300+(tem_d-eat_distance+40)*gox/300+d/2;
          goy = a*(eat_distance+260-tem_d)/300+(tem_d-eat_distance+40)*goy/300+e/2;
          fix_gox = b+d/2;
          fix_goy = a+e/2;
        }
      }
      else{
        fix_gox = fix_fix_gox;
        fix_goy = fix_fix_goy;
      }
    }
  }
  
  void move(){
    for(int i=0;i<ship_num;i++){
      goaway(this,ships.get(i));
    }
    
    float movex = speed*gox;
    float movey = speed*goy;
    
    sx += movex;
    sy += movey;
    
    if(sx<=-100){sx += real_width;}
    else if(sx>=1900){sx -= real_width;}
    if(sy<=-50){sy +=real_height;}
    else if(sy>=950){sy -=real_height;}
  }
  
  
  void show(){
    noStroke();
    fill(s_color);
    //pushMatrix();
    //translate(sx,sy);
    //sphere(10);
    //popMatrix();
    circle(sx,sy,10);
  }
  
  
  
}
