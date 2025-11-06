class Player {
  PVector pos;
  PVector wh;
  PVector vel;
  float speed;
  float jumpForce;
  float gravity;
  boolean onGround;
  color playerColor;
  
  // Controls
  int leftKey, rightKey, jumpKey;
  boolean movingLeft, movingRight, jumping;
  
  Player(float x, float y, color c, int leftKey, int rightKey, int jumpKey) {
    this.pos = new PVector(x, y);
    this.wh = new PVector(30, 40);
    this.vel = new PVector(0, 0);
    this.speed = 5;
    this.jumpForce = 12;
    this.gravity = 0.6;
    this.onGround = false;
    this.playerColor = c;
    
    this.leftKey = leftKey;
    this.rightKey = rightKey;
    this.jumpKey = jumpKey;
    this.movingLeft = false;
    this.movingRight = false;
    this.jumping = false;
  }
  
  void update(ArrayList<Platform> platforms) {
    // Horizontal movement
    vel.x = 0;
    if (movingLeft) {
      vel.x = -speed;
    }
    if (movingRight) {
      vel.x = speed;
    }
    
    // Apply gravity
    vel.y += gravity;
    
    // Limit fall speed
    if (vel.y > 15) {
      vel.y = 15;
    }
    
    // Jump
    if (jumping && onGround) {
      vel.y = -jumpForce;
      onGround = false;
    }
    
    // Update position
    pos.add(vel);
    
    // Check platform collisions
    onGround = false;
    for (Platform p : platforms) {
      // Top collision (landing on platform)
      if (p.checkTopCollision(pos, wh, vel.y)) {
        pos.y = p.pos.y - wh.y;
        vel.y = 0;
        onGround = true;
      }
      // Side collisions
      else if (p.overlaps(pos, wh)) {
        // Coming from left
        if (vel.x > 0 && pos.x + wh.x > p.pos.x && pos.x < p.pos.x) {
          pos.x = p.pos.x - wh.x;
        }
        // Coming from right
        else if (vel.x < 0 && pos.x < p.pos.x + p.wh.x && pos.x + wh.x > p.pos.x + p.wh.x) {
          pos.x = p.pos.x + p.wh.x;
        }
        // Bottom collision (hitting head)
        else if (vel.y < 0 && pos.y < p.pos.y + p.wh.y && pos.y + wh.y > p.pos.y + p.wh.y) {
          pos.y = p.pos.y + p.wh.y;
          vel.y = 0;
        }
      }
    }
    
    // Keep player in bounds
    if (pos.x < 0) pos.x = 0;
    if (pos.x + wh.x > width) pos.x = width - wh.x;
    if (pos.y + wh.y > height) {
      pos.y = height - wh.y;
      vel.y = 0;
      onGround = true;
    }
  }
  
  void display() {
    fill(playerColor);
    stroke(0);
    strokeWeight(2);
    rect(pos.x, pos.y, wh.x, wh.y);
    
    // Simple face
    fill(255);
    ellipse(pos.x + wh.x * 0.3, pos.y + wh.y * 0.3, 5, 5);
    ellipse(pos.x + wh.x * 0.7, pos.y + wh.y * 0.3, 5, 5);
  }
  
  void handleKeyPress(int k, int kc) {
    if (k == leftKey || kc == leftKey) {
      movingLeft = true;
    }
    if (k == rightKey || kc == rightKey) {
      movingRight = true;
    }
    if (k == jumpKey || kc == jumpKey) {
      jumping = true;
    }
  }
  
  void handleKeyRelease(int k, int kc) {
    if (k == leftKey || kc == leftKey) {
      movingLeft = false;
    }
    if (k == rightKey || kc == rightKey) {
      movingRight = false;
    }
    if (k == jumpKey || kc == jumpKey) {
      jumping = false;
    }
  }
}
