let y = 100;

let colors = [ "blue", "yellow" ]
let flashing_colors = [ "green", "red" ]
let canvas_width = 800;
let canvas_height = 600;

class Entity {
    static entity_count= 0;

    constructor() {
        this.radius = random(45,90);
        this.outer_radius = this.radius * 3;
        this.x = 0;
        this.y = 0;
        console.log(Entity.entity_count)
        this.color=colors[Entity.entity_count];
        this.flashing_color = flashing_colors[Entity.entity_count];
        this.flash_counter = 0;
        this.speed_x = random(3,7)
        this.speed_y = random(3,7)
        this.flashing = false;
        Entity.entity_count++;
    }

    move() {
        let dy = this.speed_y
        let dx = this.speed_x
        this.x = this.x + dx
        this.y = this.y + dy
        if ( this.x >= canvas_width - this.radius ) {
            dx = - this.speed_x;
        }
        if ( this.y >= canvas_height - this.radius ) {
          dy = - this.speed_y;
        }
        if ( this.x <= this.radius ) {
          dx = - this.speed_x;
        }
        if ( this.y <= this.radius ) {
          dy = - this.speed_y;
        }
        this.speed_x = dx
        this.speed_y = dy
        
    }

    draw() {
        if ( !this.flashing || ( this.flashing && this.flash_counter % 2 == 0) ) {
            stroke(this.color);
            fill(this.color);
        } else {
            stroke(this.flashing_color);
            fill(this.flashing_color);
        }
        if ( this.flashing ) {
            this.flash_counter++;
        }
        // circle (x,y,d)
        circle( this.x, this.y, this.radius*2 );
        noFill()
        circle( this.x, this.y, this.outer_radius*2);
    }

    collided(other) {
        const distance_away = sqrt( Math.pow(other.x - this.x,2) + Math.pow(other.y - this.y,2) )
        //console.log(distance_away)
        if ( distance_away <= this.outer_radius + other.outer_radius ) {
            this.flashing = true;
        } else {
            this.flashing = false;
        }
    }

    cast_ray(other) {
        // if ( this.collided(other) ) {
        //     return;
        // }
        
        const change_in_x = other.x - this.x
        const change_in_y = other.y - this.y
        let direction = 0;
        if ( change_in_y == 0 ) {
            if ( change_in_x < 0 ) {
                direction = Math.PI;
            } else {
                direction = 0;
            }
        } else if ( change_in_x == 0 ) {
            if ( change_in_y > 0 ) {
                direction = Math.PI/2;
            } else {
                direction = Math.PI * 1.5
            }
        } else {
            if ( other.x < this.x ) {
                direction = (-Math.PI + Math.atan( change_in_y / change_in_x) )
            } else if ( other.y < this.y ) {
                direction =  (2*Math.PI + Math.atan( change_in_y / change_in_x) )
            } else {
                direction = (Math.atan( change_in_y / change_in_x) )
            }
        }
        const direction_top = direction + Math.PI / 6
        const direction_bottom = direction - Math.PI/6

        // arc(x,y,w,h,start,stop,mode,detail)
        fill(this.color)
        stroke(this.color)
        arc(this.x, this.y, this.outer_radius*2, this.outer_radius*2, direction_bottom, direction_top, PIE);
    }
}

let player = null;
let enemy = null;

/* full screening will change the size of the canvas */
function windowResized() {
resizeCanvas(windowWidth, windowHeight);
}

// The statements in the setup() function
// execute once when the program begins
function setup() {
  canvas_width = windowWidth 
  canvas_height = windowHeight
  // createCanvas must be the first statement
  createCanvas(canvas_width, canvas_height);
  stroke(255); // Set line drawing color to white
  frameRate(30);
  player = new Entity();
  enemy = new Entity();
  player.x = constrain(random(canvas_width), player.radius, canvas_width - player.radius);
  player.y = constrain(random(canvas_height), player.radius, canvas_height - player.radius);
  enemy.x = constrain(random(canvas_width), enemy.radius, canvas_width - enemy.radius);
  enemy.y = constrain(random(canvas_height), enemy.radius, canvas_height - enemy.radius);
    // player.x = 100
    // player.y = 100
    // enemy.x = 100
    // enemy.y = 200
}
// The statements in draw() are executed until the
// program is stopped. Each statement is executed in
// sequence and after the last line is read, the first
// line is executed again.
function draw() {
  background(0); // Set the background to black
   player.move()
   enemy.move()
  player.collided(enemy)
  enemy.collided(player)

  player.draw();
  enemy.draw();
  player.cast_ray(enemy)
  enemy.cast_ray(player)
}
