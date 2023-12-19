boolean check_around(float fx,float fy){
  boolean result = false;
  if(foods.isEmpty()==false){
    for(int i=0;i<food_num;i++){
      float food_distance = dist(fx,fy,foods.get(i).fx,foods.get(i).fy);
      if(food_distance<min_distance){
        result = true;
        break;
      }
    }
  }
  return result;
}

void goaway(ship s1,ship s2){
  float tem_d = dist(s1,s2);
  if(tem_d!=0){
  if(tem_d<200){
    float a = s1.sx-s2.sx;
    float b = s1.sy-s2.sy;
    float c = sqrt(a*a+b*b)/2;
    a /= c;
    b /= c;
    if(tem_d<=40){
      s1.gox += a;
      s1.goy += b;
      s2.gox += -1*a;
      s2.goy += -1*b;}
    else{
      s1.gox = a*(100-tem_d)/160+s1.gox;
      s1.goy = b*(100-tem_d)/160+s1.goy;
      s2.gox = a*(100-tem_d)/160+s2.gox;
      s2.gox = b*(100-tem_d)/160+s2.goy;
    }
  }
  else{
    s1.gox = s1.fix_gox;
    s1.goy = s1.fix_goy;
    s2.gox = s2.fix_gox;
    s2.goy = s2.fix_goy;
  }
  }
}



float dist(food f1,ship s1){
  return dist(f1.fx,f1.fy,s1.sx,s1.sy);
}

float dist(ship f1,ship s1){
  return dist(f1.sx,f1.sy,s1.sx,s1.sy);
}
