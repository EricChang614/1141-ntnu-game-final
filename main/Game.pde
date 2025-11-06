class Game {
  Player player1;
  Player player2;
  ArrayList<Platform> platforms;
  
  Game() {
    this(1); // Default to stage 1
  }
  
  Game(int stage) {
    // Player 1: WAD controls (A=left, D=right, W=jump)
    player1 = new Player(100, 100, color(100, 150, 255), 'a', 'd', 'w');
    // Player 2: Arrow keys (LEFT, RIGHT, UP)
    player2 = new Player(600, 100, color(255, 150, 100), LEFT, RIGHT, UP);
    
    // Initialize platforms
    platforms = new ArrayList<Platform>();
    
    switch (stage) {
      case 1:
        createPlatforms1();
        break;
      case 2:
        createPlatforms2();
      default:
        createPlatforms1();
        break;
    }
  }
  
  void createPlatforms1() {
    // Ground
    platforms.add(new Platform(0, 550, 800, 50));
    
    // Lower platforms
    platforms.add(new Platform(150, 450, 150, 20));
    platforms.add(new Platform(500, 450, 150, 20));
    
    // Middle platforms
    platforms.add(new Platform(50, 350, 120, 20));
    platforms.add(new Platform(300, 300, 200, 20));
    platforms.add(new Platform(630, 350, 120, 20));
    
    // Upper platforms
    platforms.add(new Platform(150, 200, 100, 20));
    platforms.add(new Platform(550, 200, 100, 20));
    
    // Top platform
    platforms.add(new Platform(350, 100, 100, 20));
  }
  void createPlatforms2() {
    platforms.add(new Platform(0, 260, 360, 30));
    platforms.add(new Platform(330, 390, 260, 30));
    platforms.add(new Platform(410, 100, 100, 30));
    platforms.add(new Platform(560, 260, 400, 30));
    platforms.add(new Platform(0, 510, 960, 30));
  }


  
  void update() {
    player1.update(platforms);
    player2.update(platforms);
  }
  
  void display() {
    // Display platforms
    for (Platform p : platforms) {
      p.display();
    }
    
    // Display players
    player1.display();
    player2.display();
    
    // Display controls info
    fill(0);
    textSize(14);
    text("Player 1 (Blue): W=Jump, A=Left, D=Right", 10, 20);
    text("Player 2 (Orange): UP=Jump, LEFT, RIGHT", 10, 40);
  }
  
  void handleKeyPress(char k, int kc) {
    player1.handleKeyPress(k, kc);
    player2.handleKeyPress(k, kc);
  }
  
  void handleKeyRelease(char k, int kc) {
    player1.handleKeyRelease(k, kc);
    player2.handleKeyRelease(k, kc);
  }
}