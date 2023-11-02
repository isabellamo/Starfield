Particle[] fish;

void setup(){
  size(500, 500);
  noStroke();
  
  fish = new Particle[50];
  
  for (int i = 0; i < fish.length; i++){
    fish[i] = new Particle(); 
  }
  fish[0] = new Shark();
}

void draw(){
  background(0, 50, 100);
  
  int randomColor = (int)(Math.random() * 250);
  fill(randomColor, randomColor, randomColor);
  ellipse (250, 250, 100, 100);
  
  for (int i = 0; i < fish.length; i++){
    fish[i].move();
    fish[i].show();
  }
}

class Particle{
  double x, y, angle, speed;
  int particleColor;
  
  Particle(){
    x = (double) 250;
    y = (double) 250;
    angle = (double)(Math.random() * 2 * Math.PI);
    speed = (int)(Math.random() * 5) + 1;
    particleColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
  }
  
  void move(){
    x += (double)(Math.cos(angle) * speed);
    y += (double)(Math.sin(angle) * speed);
    if ((x > 510) || (x < -10)){
      x = (double) 250;
      y = (double) 250;
      angle = (double)(Math.random() * 2 * Math.PI);
      speed = (int)(Math.random() * 5) + 1;
      particleColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    }
    
    if ((y > 510) || (y < -10)){
      x = (double) 250;
      y = (double) 250;
      angle = (int)(Math.random() * 2 * Math.PI);
      speed = (int)(Math.random() * 5) + 1;
      particleColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    }
  }
  
  void show(){
    fill(particleColor); // (50, 50)
    ellipse((float) x, (float) y, 17, 20);
    
    if (x > 250){
      triangle((float) x - 7, (float) y, (float) x - 13, (float) y - 10, (float) x - 13, (float) y + 10);
    } else if (x < 250){
      triangle((float) x + 7, (float) y, (float) x + 13, (float) y - 10, (float) x + 13, (float) y + 10);
    }
    
    triangle((float) x, (float) y - 20, (float) x - 1, (float) y - 10, (float) x + 1, (float) y - 10);
    triangle((float) x - 4, (float) y + 8, (float) x - 14, (float) y + 13, (float) x - 7, (float) y + 16);
    triangle((float) x + 4, (float) y + 8, (float) x + 14, (float) y + 13, (float) x + 7, (float) y + 16);
  }
}

class Shark extends Particle{ //inherits from Particle
  Shark(){
    // size
    x = Math.random() * 250;
    y = Math.random() * 250;
    angle = 0;
    speed = 2;
    particleColor = color(150);
  }
  
  void move(){
    x += Math.random() * speed;
    y += Math.random() * speed;
    if ((x > 510) || (x < -10)){
      x = Math.random() * 250;
      y = Math.random() * 250;
      angle = 0;
      speed = 2;
    }
    
    if ((y > 510) || (y < -10)){
      x = Math.random() * 250;
      y = Math.random() * 250;
      angle = 0;
      speed = 2;
    }
  }
  
  void show(){
    fill(particleColor);
    ellipse((float) x, (float) y, 50, 40);
    triangle((float) x, (float) y - 40, (float) x - 2, (float) y - 20, (float) x + 2, (float) y - 20);
    triangle((float) x - 17, (float) y + 10, (float) x - 47, (float) y + 20, (float) x - 17, (float) y + 15);
    triangle((float) x + 17, (float) y + 10, (float) x + 47, (float) y + 20, (float) x + 17, (float) y + 15);
    fill(0);
    arc((float) x, (float) y + 5, 30, 20, 0, PI);
    fill(250);
    triangle((float) x + 10, (float) y + 5, (float) x + 14, (float) y + 5, (float) x + 12, (float) y + 10);
    triangle((float) x + 4, (float) y + 5, (float) x + 8, (float) y + 5, (float) x + 6, (float) y +10); // fix
    triangle((float) x - 2, (float) y + 5, (float) x + 2, (float) y + 5, (float) x, (float) y + 10);
    triangle((float) x - 8, (float) y + 5, (float) x - 4, (float) y + 5, (float) x - 6, (float) y + 10);
    triangle((float) x - 14, (float) y + 5, (float) x - 10, (float) y + 5, (float) x - 12, (float) y + 10);
    triangle((float) x - 6, (float) y + 10, (float) x - 8, (float) y + 14, (float) x - 4, (float) y + 15);
    triangle((float) x, (float) y + 10, (float) x - 3, (float) y + 15, (float) x + 3, (float) y + 15);
    triangle((float) x + 6, (float) y + 10, (float) x + 8, (float) y + 14, (float) x + 4, (float) y + 15);
    fill(20, 20, 20);
    ellipse((float) x - 10, (float) y - 5, 5, 5);
    ellipse((float) x + 10, (float) y - 5, 5, 5);
  }
}
