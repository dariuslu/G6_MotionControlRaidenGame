#include <stdio.h>
#include <stdlib.h>

//#include "platform.h"
//#include "xparameters.h"
//#include "xil_types.h"

// Some Colors
#define BLUE 				0x000000FC
#define NOT_AS_BRIGHT_GREEN 0x00008000
#define CYAN 				0x0000FCFC
#define WHITE 				0x00FCFCFC
#define RED 				0x00FC0000
#define BLACK 				0x00000000
#define PURPLE              0x00800080
#define GRAY				0x00808080
#define YELLOW				0x00FF8000
// Video Memory - 64M 0x80000000 - 0x83ffffff
#define VMEM_1				0x80000000	// 4M - 4B * 1024 columns * 1024 rows
#define VMEM_2				0x80400000	// 4M

// Horizontal and Vertical Resolution of the Camera
#define DISPLAY_COLUMNS  	640
#define DISPLAY_ROWS     	480



// Game Border
#define GAME_BORDER_X		500  // 640 - 140 = 500
#define GAME_BORDER_Y		480
// Player move speed
#define PLAYER_SPEED 		20


// Graphics IP
volatile unsigned int * GFX = (unsigned int *)0x44A00000;

/*	*(GFX+1) = ID | (x << 16) | (y << 4);
 *
 *	 fifo1_dout -> a image
 *
 *  <ID>
 *  0:  	axi_wdata = fifo1_dout; 		// Enemy UFO 	32x32
 *	1:  	axi_wdata = fifo1_dout; 		// Raiden 1P 	32x32
 *	2:  	axi_wdata = fifo1_dout; 		// Raiden 2P 	32x32
 *	3:  	axi_wdata = fifo1_dout; 		// Nyan_cat 	32x32
 *	4:  	axi_wdata = fifo1_dout; 		// Power box 	32x32
 *	5:  	axi_wdata = fifo1_dout; 		// Full box 	32x32
 *	6:  	axi_wdata = fifo1_dout; 		// Boss 		64x64
 *	7:  	axi_wdata = STAR;  			// 32x32 star
 *	8:  	axi_wdata = BLACK;  			// 64x64 black
 *	9:  	axi_wdata = BLACK;  			// 32x32 black
 *	10:  	axi_wdata = RED;   				// 32x32
 *	11:  	axi_wdata = GREEN; 				// 32x32
 *	12:  	axi_wdata = BLUE;				// 32x32
 *	13:  	axi_wdata = NOT_AS_BRIGHT_GREEN;// 32x32
 *	14:  	axi_wdata = CYAN;				// 32x32
 *	15:  	axi_wdata = WHITE;				// 32x32 white
 *
 */

// TFT
volatile unsigned int * TFT = (unsigned int *)0x44A10000;
// Position Locator IP
volatile unsigned int * DETECTOR = (unsigned int *)0x44A20000;
// Audio IP
volatile unsigned int * AUDIO = (unsigned int *)0x44A30000;

//Darius
typedef struct bullet{
	int x;
	int y;
	int used;
}Bullet;

#define INITIAL_BULLETS 8 //initial bullet number
#define NUM_BULLETS 200 // player bullet number at maximum
#define ENEMY_BULLETS 2 // bullet number per enemy
#define BOSS_BULLETS 30 // bullet number for boss
#define NUM_CATS	5 // number of enemy
#define NUM_GIFTS   8 // number of gift box
#define NUM_STARS 5
#define GIFTS_COUNT 5 // number of destroyed enemy to generate the gift box
#define VICTORY_SCORE 50
#define WEAPON_MAXIMUM 3
#define BOSS_HP 1000
typedef struct object{
	unsigned int x, y, x_size, y_size;
	int x_velocity, y_velocity;
	//Darius
	int alive;
	int HP;
	int prev_HP;
	int score;
	int weapon_level;
	int current_bullet; // current player bullet count
	Bullet bullets[NUM_BULLETS];
}Object;

typedef struct enemy{
	unsigned int x, y, x_size, y_size;
	int x_velocity, y_velocity;
	//Darius
	int alive;
	Bullet bullets[ENEMY_BULLETS];
}Enemy;

typedef struct boss{
	unsigned int x, y, x_size, y_size;
	int x_velocity, y_velocity;
	//Darius
	int HP;
	Bullet bullets[BOSS_BULLETS];
}Boss;

typedef struct gift_box{
	unsigned int x, y, x_size, y_size;
	int x_velocity, y_velocity;
	//Darius
	int type; //0 - power 1 - health
	int alive;
}Gift;

typedef struct star{
	unsigned int x, y, x_size, y_size;
	int y_velocity;
	int used;
}Star;

Enemy cat[NUM_CATS];
Boss big_boss;
Object player;
Object player2;
Gift  gift[NUM_GIFTS];
Star  stars[NUM_STARS];
volatile unsigned int VMEM;

#define HP_BAR_X 500
#define HP_BAR_Y 170
#define HP_BAR_X2 500
#define HP_BAR_Y2 370
#define BOSS_HP_BAR_X 500
#define BOSS_HP_BAR_Y 50
#define LOCATION_BAR_X 500
#define LOCATION_BAR_Y 220
#define LOCATION_BAR_LENGTH 130
#define LOCATION_BAR_WIDTH  98
#define SCORE_X 500
#define SCORE_Y 150
#define SCORE_X2 500
#define SCORE_Y2 350
#define SCORE_START 600
#define HP_width 20
#define ENEMY_DAMAGE 5
#define PLAYER_DAMAGE 1

void draw_rectangle(int x, int y, int dx, int dy, int color)
{
	int i, j;
    for(j=y; j<y+dy; j++)
    	for(i=x; i<x+dx; i++)
    		*(int*)(VMEM+(1024*j+i)*4) = color;
}

void update_HP_bar(int HP){
	draw_rectangle(HP_BAR_X,HP_BAR_Y,HP,HP_width,BLUE);
}

void update_HP_bar2(int HP){
	draw_rectangle(HP_BAR_X2,HP_BAR_Y2,HP,HP_width,RED);
}

void update_boss_HP_bar(int HP){
	draw_rectangle(BOSS_HP_BAR_X,BOSS_HP_BAR_Y,HP/10,HP_width,PURPLE);
}

void create_location_bar(void){
	draw_rectangle(LOCATION_BAR_X,LOCATION_BAR_Y,LOCATION_BAR_LENGTH,LOCATION_BAR_WIDTH,GRAY);
}

void erase_HP_bar(int HP){
	draw_rectangle(HP_BAR_X,HP_BAR_Y,HP,HP_width,WHITE);
}

void erase_HP_bar2(int HP){
	draw_rectangle(HP_BAR_X2,HP_BAR_Y2,HP,HP_width,WHITE);
}

void erase_boss_HP_bar(int HP){
	draw_rectangle(BOSS_HP_BAR_X,BOSS_HP_BAR_Y,HP/10,HP_width,WHITE);
}

#define CHAR_WIDTH 60
#define CHAR_LENGTH 30
#define SCORE_WIDTH 15
#define SCORE_LENGTH 10
void show_score(int start_x,int start_y){
	//drawing "S"
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	//drawing "C"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5*3,WHITE);
	//drawing "O"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);
	//drawing "R"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*3,SCORE_WIDTH/5*2,WHITE);
	//drawing "E"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);

	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,3,3,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,3,3,BLACK);

	start_x = SCORE_START;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);

	start_x -= (SCORE_LENGTH + 2);
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);

	start_x -= (SCORE_LENGTH + 2);
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);
/*
	//drawing "0"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);

	//drawing "1"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x,start_y,SCORE_LENGTH/5*4,SCORE_WIDTH,WHITE);

	//drawing "2"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);

	//drawing "3"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);

	//drawing "4"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y,SCORE_LENGTH/5*3,SCORE_WIDTH/5*2,WHITE);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);

	//drawing "5"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);

	//drawing "6"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);

	//drawing "7"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5*4,WHITE);

	//drawing "8"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);

	//drawing "9"
	start_x += SCORE_LENGTH + 2;
	draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
	draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
	draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);
	*/

}

void update_score(int score,int start_x,int start_y){

	while(score != 0){
	unsigned int number = score % 10;
	if(number == 0){
		//drawing "0"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5*3,WHITE);
	}
	else if(number == 1){
		//drawing "1"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x,start_y,SCORE_LENGTH/5*4,SCORE_WIDTH,WHITE);
	}
	else if(number == 2){
		//drawing "2"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	}
	else if(number == 3){
		//drawing "3"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	}
	else if(number == 4){
		//drawing "4"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y,SCORE_LENGTH/5*3,SCORE_WIDTH/5*2,WHITE);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);
	}
	else if(number == 5){
		//drawing "5"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5,WHITE);
	}
	else if(number == 6){
		//drawing "6"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
	}
	else if(number == 7){
		//drawing "7"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*4,SCORE_WIDTH/5*4,WHITE);
	}
	else if(number == 8){
		//drawing "8"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
	}
	else if(number == 9){
		//drawing "9"
		draw_rectangle(start_x,start_y,SCORE_LENGTH,SCORE_WIDTH,BLACK);
		draw_rectangle(start_x+SCORE_LENGTH/5,start_y+SCORE_WIDTH/5,SCORE_LENGTH/5*3,SCORE_WIDTH/5,WHITE);
		draw_rectangle(start_x,start_y+SCORE_WIDTH/5*3,SCORE_LENGTH/5*4,SCORE_WIDTH/5*2,WHITE);
	}
	start_x -= (SCORE_LENGTH + 2);
	score /= 10;
	}

}

void game_over(int start_x, int start_y){
	//display "DEFEAT" on VGA
	//drawing "D"
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/6,CHAR_LENGTH/3,(CHAR_WIDTH/6 * 4),BLACK);

	//drawing "E"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);

	//drawing "F"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5*2, BLACK);

	//drawing "E"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);

	//drawing "A"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3, CHAR_WIDTH/5*2, BLACK);

	//drawing "T"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,RED);
	draw_rectangle(start_x,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3, CHAR_WIDTH/5*4, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3*2,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3, CHAR_WIDTH/5*4, BLACK);

}

void success(int start_x, int start_y){
	//display "DEFEAT" on VGA
	//drawing "S"
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);
	draw_rectangle(start_x,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);

	//drawing "U"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y,CHAR_LENGTH/5*3,CHAR_WIDTH/5*4,BLACK);

	//drawing "C"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5*3,BLACK);

	//drawing "C"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5*3,BLACK);

	//drawing "E"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);

	//drawing "S"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);
	draw_rectangle(start_x,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);

	//drawing "S"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,NOT_AS_BRIGHT_GREEN);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);
	draw_rectangle(start_x,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/5*4,CHAR_WIDTH/5,BLACK);

}

void welcome(int start_x, int start_y){
	//drawing "W"
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y,CHAR_LENGTH/5,(CHAR_WIDTH/5 * 4),BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/5*3,start_y,CHAR_LENGTH/5,(CHAR_WIDTH/5 * 4),BLACK);

	//drawing "E"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);

	//drawing "L"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y,CHAR_LENGTH/5 * 4, CHAR_WIDTH/5*4, BLACK);

	//drawing "C"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5*4,CHAR_WIDTH/5*3,BLACK);

	//drawing "O"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/6,CHAR_LENGTH/3,(CHAR_WIDTH/6 * 4),BLACK);

	//drawing "M"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/5,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5,(CHAR_WIDTH/5 * 4),BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/5*3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/5,(CHAR_WIDTH/5 * 4),BLACK);

	//drawing "E"
	start_x += CHAR_LENGTH + 10;
	draw_rectangle(start_x,start_y,CHAR_LENGTH,CHAR_WIDTH,YELLOW);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
	draw_rectangle(start_x+CHAR_LENGTH/3,start_y+CHAR_WIDTH/5*3,CHAR_LENGTH/3 * 2, CHAR_WIDTH/5, BLACK);
}

void insert_bullet(int x,int y){
	int i;
	if(player.weapon_level == 1){
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				return;
			}
		}
	}
	else if(player.weapon_level == 2){
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x + 2;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				break;
			}
		}
	}
	else if(player.weapon_level == 3){
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x + 2;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player.current_bullet;i++){
			if(player.bullets[i].used == 0){
				player.bullets[i].x = x + 4;
				player.bullets[i].y = y;
				player.bullets[i].used = 1;
				break;
			}
		}
	}
}
//player 2
void insert_bullet_2(int x,int y){
	int i;
	if(player2.weapon_level == 1){
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				return;
			}
		}
	}
	else if(player2.weapon_level == 2){
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x + 2;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				break;
			}
		}
	}
	else if(player2.weapon_level == 3){
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x + 2;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				break;
			}
		}
		for (i=0;i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 0){
				player2.bullets[i].x = x + 4;
				player2.bullets[i].y = y;
				player2.bullets[i].used = 1;
				break;
			}
		}
	}
}

void insert_bullet_enemy(int x,int y, int index){
	int i;
	for (i=0;i<ENEMY_BULLETS;i++){
		if(cat[index].bullets[i].used == 0){
			cat[index].bullets[i].x = x;
			cat[index].bullets[i].y = y;
			cat[index].bullets[i].used = 1;
			return;
		}
	}
}

void insert_bullet_boss(int x,int y){
	int i;
	for (i=0;i<BOSS_BULLETS;i++){
		if(big_boss.bullets[i].used == 0){
			big_boss.bullets[i].x = x;
			big_boss.bullets[i].y = y;
			big_boss.bullets[i].used = 1;
			return;
		}
	}
}

void draw_bullet(void){
	int i;
	for (i=0; i<player.current_bullet;i++){
		if(player.bullets[i].used == 1){
			int x = player.bullets[i].x;
			int y = player.bullets[i].y;
			//if the bullet is out of boundary, then remove it instead if drawing
			if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 40){
				player.bullets[i].used = 0;
			}
			else{
				draw_rectangle(x-1,y-1,1,3,NOT_AS_BRIGHT_GREEN);
			}
		}
	}

	for (i=0; i<player2.current_bullet;i++){
		if(player2.bullets[i].used == 1){
			int x = player2.bullets[i].x;
			int y = player2.bullets[i].y;
			//if the bullet is out of boundary, then remove it instead if drawing
			if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 40){
				player2.bullets[i].used = 0;
			}
			else{
				draw_rectangle(x-1,y-1,1,3,CYAN);
			}
		}
	}

	for (i=0; i<NUM_CATS; i++){
		int j;
		for(j=0;j<ENEMY_BULLETS;j++){
			if(cat[i].bullets[j].used == 1){
				int x = cat[i].bullets[j].x;
				int y = cat[i].bullets[j].y;
				//if the bullet is out of boundary, then remove it instead if drawing
				if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 40){
					cat[i].bullets[j].used = 0;
				}
				else{
					draw_rectangle(x-1,y-1,1,3,RED);
				}
			}
		}
	}
}

void draw_boss_bullet(void){
	int i;
	for (i=0; i<player.current_bullet;i++){
		if(player.bullets[i].used == 1){
			int x = player.bullets[i].x;
			int y = player.bullets[i].y;
			//if the bullet is out of boundary, then remove it instead if drawing
			if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 5){
				player.bullets[i].used = 0;
			}
			else{
				draw_rectangle(x-1,y-1,1,3,NOT_AS_BRIGHT_GREEN);
			}
		}
	}
	for (i=0; i<player2.current_bullet;i++){
			if(player2.bullets[i].used == 1){
			int x = player2.bullets[i].x;
			int y = player2.bullets[i].y;
			//if the bullet is out of boundary, then remove it instead if drawing
			if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 5){
				player2.bullets[i].used = 0;
			}
			else{
				draw_rectangle(x-1,y-1,1,3,CYAN);
			}
		}
	}
	for(i=0;i<BOSS_BULLETS;i++){
		if(big_boss.bullets[i].used == 1){
			int x = big_boss.bullets[i].x;
			int y = big_boss.bullets[i].y;
			//if the bullet is out of boundary, then remove it instead if drawing
			if(x >= GAME_BORDER_X - 20 || x <= 20 || y >= 440 || y <= 5){
				big_boss.bullets[i].used = 0;
			}
			else{
				draw_rectangle(x-1,y-1,1,3,RED);
			}
		}
	}
}

void erase_and_calculate_bullet(void){
	int i;
	for(i=0; i<player.current_bullet;i++){
		if(player.bullets[i].used == 1){
			int x = player.bullets[i].x;
			int y = player.bullets[i].y;
			draw_rectangle(x-1,y-1,1,3,BLACK);
			//Darius: calculate if it has hits any enemy: if yes, mark its alive = 0
			int j;
			for(j=0;j<NUM_CATS;j++){
				if(cat[j].alive == 1){
					int enemy_x = cat[j].x;
					int enemy_y = cat[j].y;
					int x_size = cat[j].x_size;
					int y_size = cat[j].y_size;
					if(y >= enemy_y && y<= enemy_y + y_size && x >= enemy_x && x<= enemy_x + x_size){
						cat[j].alive = 0;
						player.score ++;
						*(AUDIO+1) = 2;
						update_score(player.score,SCORE_START,SCORE_Y);
						if(player.score % GIFTS_COUNT == 0){
							int k;
							for(k=0;k<NUM_GIFTS;k++){
								if(gift[k].alive == 0){
									gift[k].x = cat[j].x;
									gift[k].y = 40;
									gift[k].alive = 1;
									if(rand()%2 == 0) gift[k].type = 1;
									else			  gift[k].type = 0;
									break;
								}
							}
						}
					}
				}
			}
			player.bullets[i].y -= 10;
		}
	}

	for(i=0; i<player2.current_bullet;i++){
		if(player2.bullets[i].used == 1){
			int x = player2.bullets[i].x;
			int y = player2.bullets[i].y;
			draw_rectangle(x-1,y-1,1,3,BLACK);
			//Darius: calculate if it has hits any enemy: if yes, mark its alive = 0
			int j;
			for(j=0;j<NUM_CATS;j++){
				if(cat[j].alive == 1){
					int enemy_x = cat[j].x;
					int enemy_y = cat[j].y;
					int x_size = cat[j].x_size;
					int y_size = cat[j].y_size;
					if(y >= enemy_y && y<= enemy_y + y_size && x >= enemy_x && x<= enemy_x + x_size){
						cat[j].alive = 0;
						player2.score ++;
						*(AUDIO+1) = 2;
						update_score(player2.score,SCORE_START,SCORE_Y2);
						if(player2.score % GIFTS_COUNT == 0){
							int k;
							for(k=0;k<NUM_GIFTS;k++){
								if(gift[k].alive == 0){
									gift[k].x = cat[j].x;
									gift[k].y = 40;
									gift[k].alive = 1;
									if(rand()%2 == 0) gift[k].type = 1;
									else			  gift[k].type = 0;
									break;
								}
							}
						}
					}
				}
			}
			player2.bullets[i].y -= 10;
		}
	}

	for(i=0; i<NUM_CATS; i++){
		int j;
		for(j=0; j<ENEMY_BULLETS; j++){
			if(cat[i].bullets[j].used == 1){
				int x = cat[i].bullets[j].x;
				int y = cat[i].bullets[j].y;
				draw_rectangle(x-1,y-1,1,3,BLACK);
				cat[i].bullets[j].y += 5;
				if(player.HP > 0 && y >= player.y && y<= player.y + player.y_size && x >= player.x && x<= player.x + player.x_size){
					erase_HP_bar(player.HP);
					player.HP -= ENEMY_DAMAGE;
					update_HP_bar(player.HP);
					cat[i].bullets[j].used = 0;
					if(player.HP <= 0)	*(GFX+1) = 0x9 | (player.x << 16) | (player.y << 4);	// erase
				}
				if(player2.HP > 0 && y >= player2.y && y<= player2.y + player2.y_size && x >= player2.x && x<= player2.x + player2.x_size){
					erase_HP_bar2(player2.HP);
					player2.HP -= ENEMY_DAMAGE;
					update_HP_bar2(player2.HP);
					cat[i].bullets[j].used = 0;
					if(player2.HP <= 0)	*(GFX+1) = 0x9 | (player2.x << 16) | (player2.y << 4);	// erase
				}
			}
		}
	}
}

void erase_and_calculate_boss_bullet(void){
	int i;
	for(i=0; i<player.current_bullet;i++){
		if(player.bullets[i].used == 1){
			int x = player.bullets[i].x;
			int y = player.bullets[i].y;
			draw_rectangle(x-1,y-1,1,3,BLACK);
			//Darius: calculate if it has hits the boss, if so, reduce boss health
			if(big_boss.HP > 0){
				int enemy_x = big_boss.x;
				int enemy_y = big_boss.y;
				int x_size = big_boss.x_size;
				int y_size = big_boss.y_size;
				if(y >= enemy_y && y<= enemy_y + y_size && x >= enemy_x && x<= enemy_x + x_size){
					erase_boss_HP_bar(big_boss.HP);
					big_boss.HP -= PLAYER_DAMAGE;
					update_boss_HP_bar(big_boss.HP);
					player.bullets[i].used = 0;
				}
			}
			player.bullets[i].y -= 10;
		}
	}

	for(i=0; i<player2.current_bullet;i++){
		if(player2.bullets[i].used == 1){
			int x = player2.bullets[i].x;
			int y = player2.bullets[i].y;
			draw_rectangle(x-1,y-1,1,3,BLACK);
			//Darius: calculate if it has hits the boss, if so, reduce boss health
			if(big_boss.HP > 0){
				int enemy_x = big_boss.x;
				int enemy_y = big_boss.y;
				int x_size = big_boss.x_size;
				int y_size = big_boss.y_size;
				if(y >= enemy_y && y<= enemy_y + y_size && x >= enemy_x && x<= enemy_x + x_size){
					erase_boss_HP_bar(big_boss.HP);
					big_boss.HP -= PLAYER_DAMAGE;
					update_boss_HP_bar(big_boss.HP);
					player2.bullets[i].used = 0;
				}
			}
			player2.bullets[i].y -= 10;
		}
	}

	for(i=0; i<BOSS_BULLETS; i++){
		if(big_boss.bullets[i].used == 1){
			int x = big_boss.bullets[i].x;
			int y = big_boss.bullets[i].y;
			draw_rectangle(x-1,y-1,1,3,BLACK);
			big_boss.bullets[i].y += 5;
			if(player.HP > 0 && y >= player.y && y<= player.y + player.y_size && x >= player.x && x<= player.x + player.x_size){
				erase_HP_bar(player.HP);
				player.HP -= ENEMY_DAMAGE;
				update_HP_bar(player.HP);
				big_boss.bullets[i].used = 0;
				if(player.HP <= 0)	*(GFX+1) = 0x9 | (player.x << 16) | (player.y << 4);	// erase
			}
			if(player2.HP > 0 && y >= player2.y && y<= player2.y + player2.y_size && x >= player2.x && x<= player2.x + player2.x_size){
				erase_HP_bar2(player2.HP);
				player2.HP -= ENEMY_DAMAGE;
				update_HP_bar2(player2.HP);
				big_boss.bullets[i].used = 0;
				if(player2.HP <= 0)	*(GFX+1) = 0x9 | (player2.x << 16) | (player2.y << 4);	// erase
			}
		}
	}
}

// Timer for drawing stars
int background_timer;
int main()
{
	while(1)
		if(*(GFX+3) == 1)
			break;
	// Sound IP Initialization
    *(AUDIO) = 0;
    *(AUDIO) = 3;

	// DETECTOR IP: BEST VALUE SO FAR: 1.0x008080FA
	*(DETECTOR + 1) = 0x008080FA;

	// TFT Initialization
	VMEM = VMEM_1;					// first frame buffer
	*(TFT) = VMEM;					// Point TFT to address of frame buffer
	*(TFT+1) = 0x01;				// Enable TFT

	// Graphics IP Initialization
	*GFX = 2;		// reset
	*GFX = VMEM;	// target addr

	int i;
	int j;
	// Screen Initialization
_Start:
	draw_rectangle(0, 0, DISPLAY_COLUMNS, DISPLAY_ROWS, BLACK);		// draw white background
	welcome(200,120);
	while(1){
		if(*(GFX+3) == 0) break;
		*(GFX+1) = 0x8 | ((310) << 16) | (300 << 4);
		for(i=0;i<2000000;i++);
		*(GFX+1) = 0x6 | ((310) << 16) | (300 << 4);
		for(i=0;i<5000000;i++);
	}
	draw_rectangle(0, 0, GAME_BORDER_X, DISPLAY_ROWS, BLACK);		// draw black background
	draw_rectangle(GAME_BORDER_X + 1, 0, DISPLAY_COLUMNS - GAME_BORDER_X, DISPLAY_ROWS, WHITE);		// draw white background

	// Game Initialization

	for(i=0; i<NUM_CATS; i++)
	{
		cat[i].x = 20 + 64*(i%7);
		cat[i].y = 51 + 48*(i%7);
		cat[i].x_velocity = (i+1) % 6 + 1;
		cat[i].y_velocity = (16-i) % 5 + 1;
		cat[i].x_size = 32;
		cat[i].y_size = 32;
		//Darius
		cat[i].alive = 1;
		for(j=0; j<ENEMY_BULLETS; j++){
				cat[i].bullets[j].x = 0;
				cat[i].bullets[j].y = 0;
				cat[i].bullets[j].used = 0;
		}
	}

	//initialize boss
	big_boss.x = 320;
	big_boss.y = 10;
	big_boss.x_velocity = 3;
	big_boss.y_velocity = 0;
	big_boss.x_size = 64;
	big_boss.y_size = 64;
	big_boss.HP = BOSS_HP;
	for(i=0;i<BOSS_BULLETS;i++){
		big_boss.bullets[i].x = 0;
		big_boss.bullets[i].y = 0;
		big_boss.bullets[i].used = 0;

	}

	player.x = 320;
	player.y = 400;
	player.x_velocity = 0;
	player.y_velocity = 0;
	player.x_size = 32;
	player.y_size = 32;
	//Darius
	player.alive = 1;
	player.HP = 100;
	player.prev_HP = 100;
	player.score = 0;
	player.current_bullet = INITIAL_BULLETS;
	player.weapon_level = 1;


	player2.x = 320;
	player2.y = 200;
	player2.x_velocity = 0;
	player2.y_velocity = 0;
	player2.x_size = 32;
	player2.y_size = 32;
	//Darius
	player2.alive = 1;
	player2.HP = 100;
	player2.prev_HP = 100;
	player2.score = 0;
	player2.current_bullet = INITIAL_BULLETS;
	player2.weapon_level = 1;

	//Darius: initialize bullets
	for(i=0; i<NUM_BULLETS; i++){
		player.bullets[i].x = 0;
		player.bullets[i].y = 0;
		player.bullets[i].used = 0;
	}

	for(i=0; i<NUM_BULLETS; i++){
		player2.bullets[i].x = 0;
		player2.bullets[i].y = 0;
		player2.bullets[i].used = 0;
	}

	//initialize gift box
	for(i=0; i<NUM_GIFTS; i++){
		gift[i].x = 0;
		gift[i].y = 0;
		gift[i].x_velocity = 0;
		gift[i].y_velocity = 5;
		gift[i].x_size = 32;
		gift[i].y_size = 32;
		gift[i].alive = 0;
		gift[i].type = 0;
	}

	//initialize star
	for(i=0; i<NUM_STARS; i++){
		stars[i].x = 0;
		stars[i].y = 0;
		stars[i].y_velocity = 8;
		stars[i].x_size = 32;
		stars[i].y_size = 32;
		stars[i].used = 0;
	}


	// Main Game Logics
	//xil_printf("Game starts.\n");

	int next;

	create_location_bar();
	update_HP_bar(player.HP);
	update_HP_bar2(player2.HP);
	update_boss_HP_bar(big_boss.HP);
	show_score(SCORE_X,SCORE_Y);
	show_score(SCORE_X2,SCORE_Y2);

	//initialize background timer
	background_timer = 10;
	while(1)
	{
		//randomly generate stars
		if(background_timer == 0){
			for(i=0;i<NUM_STARS;i++){
				if(stars[i].used == 0){
					stars[i].x = rand()%350 + 55;
					stars[i].y = 0;
					stars[i].used = 1;
					break;
				}

			}
			background_timer = 20;
		}
		background_timer--;
		for(i=0;i<NUM_STARS;i++){
			if(stars[i].used == 1){
				*(GFX+1) = 0x9 | (stars[i].x << 16) | (stars[i].y << 4);
			}
		}
		for(i=0;i<NUM_STARS;i++){
			if(stars[i].used == 1){
				if(stars[i].y <= 475){
					stars[i].y += stars[i].y_velocity;
					*(GFX+1) = 0x7 | (stars[i].x << 16) | (stars[i].y << 4);
				}
				else
					stars[i].used = 0;
			}
		}

		if(*(GFX+3) == 1)
			goto _Start;
		next = 1;
		//randomly generate new enemies, until the final score is hit
		if(player.score + player2.score <= VICTORY_SCORE - NUM_CATS && rand()%3 == 0){
			for(i=0; i<NUM_CATS; i++)
			{
				if(cat[i].alive == 0 && cat[i].bullets[0].used == 0 && cat[i].bullets[1].used == 0){
					cat[i].x = rand()%350 + 55;
					cat[i].y = 51;
					cat[i].x_velocity = (i+1) % 6 + 1;
					cat[i].y_velocity = (16-i) % 5 + 1;
					cat[i].x_size = 32;
					cat[i].y_size = 32;
					//Darius
					cat[i].alive = 1;
					int j=0;
					for(j=0; j<ENEMY_BULLETS; j++){
							cat[i].bullets[j].x = 0;
							cat[i].bullets[j].y = 0;
							cat[i].bullets[j].used = 0;
					}
				}
			}
		}
		if(player.HP <= 0 && player2.HP <=0)
			break;

		// update player's location and draw
		unsigned int detected_x, detected_y,position_x,position_y;
		unsigned int detected_x2, detected_y2,position_x2,position_y2;
		unsigned int detector_value = *(DETECTOR);
		unsigned int detector_value2 = *(DETECTOR+2);
		if(detector_value != 0xFFFFFFFF && detector_value != 0x7FFFFFFF){
			//*(GFX+1) = 0x8 | ((640-detected_x) << 16) | (detected_y << 4);	// draw detected position
			draw_rectangle(position_x, position_y, 3, 3, GRAY);
			draw_rectangle(position_x2, position_y2, 3, 3, GRAY);
			detected_x = (detector_value & 0xffff) >> 5;
			detected_x2 = (detector_value2 & 0xffff) >> 5;
			position_x = (640-detected_x) / 5 + LOCATION_BAR_X;
			position_x2 = (640-detected_x2) / 5 + LOCATION_BAR_X;
			detected_y = (detector_value & 0x7fff0000) >> (16+5);
			detected_y2 = (detector_value2 & 0x7fff0000) >> (16+5);
			position_y = (detected_y) / 5 + LOCATION_BAR_Y;
			position_y2 = (detected_y2) / 5 + LOCATION_BAR_Y;
			draw_rectangle(position_x, position_y, 3, 3, BLUE);
			draw_rectangle(position_x2, position_y2, 3, 3, RED);
			//*(GFX+1) = 0x6 | ((640-detected_x) << 16) | (detected_y << 4);
			//xil_printf("detected_x = %d; detected_y = %d\n", detected_x, detected_y);
			if(player.HP > 0)	*(GFX+1) = 0x9 | (player.x << 16) | (player.y << 4);	// erase
			if(player2.HP > 0)	*(GFX+1) = 0x9 | (player2.x << 16) | (player2.y << 4);	// erase

			if(detected_x < 440)
				player.x = (player.x < GAME_BORDER_X-player.x_size-PLAYER_SPEED) ? player.x + 8 : player.x;
			else if(detected_x > 540)
				player.x = (player.x > PLAYER_SPEED) ? player.x - 8 : player.x;

			if(detected_y > 320)
				player.y = (player.y < GAME_BORDER_Y-player.y_size-PLAYER_SPEED) ? player.y + 8 : player.y;
			else if(detected_y < 160)
				player.y = (player.y > PLAYER_SPEED) ? player.y - 8 : player.y;

			if(detected_x2 < 100)
				player2.x = (player2.x < GAME_BORDER_X-player2.x_size-PLAYER_SPEED) ? player2.x + 8 : player2.x;
			else if(detected_x2 > 200)
				player2.x = (player2.x > PLAYER_SPEED) ? player2.x - 8 : player2.x;

			if(detected_y2 > 320)
				player2.y = (player2.y < GAME_BORDER_Y-player2.y_size-PLAYER_SPEED) ? player2.y + 8 : player2.y;
			else if(detected_y2 < 160)
				player2.y = (player2.y > PLAYER_SPEED) ? player2.y - 8 : player2.y;

		}
		if(player.HP > 0)	*(GFX+1) = 0x2 | (player.x << 16) | (player.y << 4);	// draw player
		if(player2.HP > 0)	*(GFX+1) = 0x1 | (player2.x << 16) | (player2.y << 4);	// draw player 2

		// draw cats
		for(i=0; i<NUM_CATS; i++)
		{
			//Darius
			if(cat[i].alive == 1)
			{
				*(GFX+1) = 0x0 | (cat[i].x << 16) | (cat[i].y << 4);
				//Darius: insert and draw bullet for each enemy
				insert_bullet_enemy(cat[i].x + cat[i].x_size / 2, cat[i].y,i);
			}
		}

		// draw gift
		for(i=0; i<NUM_GIFTS; i++)
		{
			if(gift[i].alive == 1){
				if(gift[i].y >= 470)
					gift[i].alive = 0;
				else{
					if(gift[i].type == 1)
						*(GFX+1) = 0x5 | (gift[i].x << 16) | (gift[i].y << 4);
					else if(gift[i].type == 0)
						*(GFX+1) = 0x4 | (gift[i].x << 16) | (gift[i].y << 4);

				}
			}
		}

		//Darius: insert and draw bullet for player
		if(player.HP > 0)	insert_bullet(player.x + player.x_size / 2,player.y);
		if(player2.HP > 0)	insert_bullet_2(player2.x + player2.x_size / 2,player2.y);
		draw_bullet();

		// delay
		while(1)
		{
			if(*(GFX+2) > (100000000/30))
				break;
		}
		*(GFX+2) = 0;
		//*(TFT+1) = 0x1;
		//for(i=0;i<300000;i++);
		//*(TFT+1) = 0x0;


		// clear
		for(i=0; i<NUM_CATS; i++)
		{
			if(cat[i].alive == 1){
				*(GFX+1) = 0x9 | (cat[i].x << 16) | (cat[i].y << 4);

				cat[i].x_velocity = (cat[i].x >= GAME_BORDER_X - 40 || cat[i].x <= 32) ? -cat[i].x_velocity : cat[i].x_velocity;
				cat[i].y_velocity = (cat[i].y >= GAME_BORDER_Y || cat[i].y <= 32) ? -cat[i].y_velocity : cat[i].y_velocity;
				cat[i].x += cat[i].x_velocity;
				cat[i].y += cat[i].y_velocity;
			}
		}

		for(i=0; i<NUM_GIFTS; i++){
			if(gift[i].alive == 1){
				*(GFX+1) = 0x9 | (gift[i].x << 16) | (gift[i].y << 4);
				int x = gift[i].x + gift[i].x_size / 2;
				int y = gift[i].y + gift[i].y_size / 2;
				if(player.HP > 0 && y >= player.y - 10 && y <= player.y + 10 + player.y_size && x >= player.x - 10 && x <= player.x + player.x_size + 10){
					*(AUDIO+1) = 3;
					if(gift[i].type == 0 && player.weapon_level < WEAPON_MAXIMUM){
						player.weapon_level++;
						// expand the available bullet number
						player.current_bullet *= 5;
						gift[i].alive = 0;
					}
					else if(gift[i].type == 1){
						erase_HP_bar(player.HP);
						if(player.HP < 100)	player.HP += ENEMY_DAMAGE*4;
						gift[i].alive = 0;
						update_HP_bar(player.HP);
					}
				}
				if(player2.HP > 0 && y >= player2.y - 10 && y <= player2.y + 10 + player2.y_size && x >= player2.x - 10 && x <= player2.x + 10 +player2.x_size){
					*(AUDIO+1) = 3;
					if(gift[i].type == 0 && player2.weapon_level < WEAPON_MAXIMUM){
						player2.weapon_level++;
						// expand the available bullet number
						player2.current_bullet *= 5;
						gift[i].alive = 0;
					}
					else if(gift[i].type == 1){
						erase_HP_bar2(player2.HP);
						if(player2.HP < 100) player2.HP += ENEMY_DAMAGE*4;
						gift[i].alive = 0;
					    update_HP_bar2(player2.HP);
					}
				}
				gift[i].y += gift[i].y_velocity;
			}
		}
		//Darius: clear bullet
		erase_and_calculate_bullet();
		if(player.HP <= 0 && player2.HP <= 0)
			goto _Defeat;

		for(i=0;i<NUM_CATS;i++){
			if(cat[i].alive == 1){
				next = 0;
			}
			for(j=0;j<ENEMY_BULLETS;j++){
				if(cat[i].bullets[j].used == 1)
					next = 0;
			}
		}
		for(i=0; i<NUM_GIFTS;i++){
			if(gift[i].alive == 1)
				next = 0;
		}
		if(next == 1)
			break;
	}

	//final boss play
	if(next == 1){
		while(1){
			//randomly generate stars
			if(background_timer == 0){
				for(i=0;i<NUM_STARS;i++){
					if(stars[i].used == 0){
						stars[i].x = rand()%350 + 55;
						stars[i].y = 0;
						stars[i].used = 1;
						break;
					}

				}
				background_timer = 20;
			}
			background_timer--;
			for(i=0;i<NUM_STARS;i++){
				if(stars[i].used == 1){
					*(GFX+1) = 0x9 | (stars[i].x << 16) | (stars[i].y << 4);
				}
			}
			for(i=0;i<NUM_STARS;i++){
				if(stars[i].used == 1){
					if(stars[i].y <= 475){
						stars[i].y += stars[i].y_velocity;
						*(GFX+1) = 0x7 | (stars[i].x << 16) | (stars[i].y << 4);
					}
					else
						stars[i].used = 0;
				}
			}
			if(*(GFX+3) == 1)
				goto _Start;
			// update player's location and draw
			unsigned int detected_x, detected_y,position_x,position_y;
			unsigned int detected_x2, detected_y2,position_x2,position_y2;
			unsigned int detector_value = *(DETECTOR);
			unsigned int detector_value2 = *(DETECTOR+2);
			if(detector_value != 0xFFFFFFFF && detector_value != 0x7FFFFFFF){
				//*(GFX+1) = 0x8 | ((640-detected_x) << 16) | (detected_y << 4);	// draw detected position
				draw_rectangle(position_x, position_y, 3, 3, GRAY);
				draw_rectangle(position_x2, position_y2, 3, 3, GRAY);
				detected_x = (detector_value & 0xffff) >> 5;
				detected_x2 = (detector_value2 & 0xffff) >> 5;
				position_x = (640-detected_x) / 5 + LOCATION_BAR_X;
				position_x2 = (640-detected_x2) / 5 + LOCATION_BAR_X;
				detected_y = (detector_value & 0x7fff0000) >> (16+5);
				detected_y2 = (detector_value2 & 0x7fff0000) >> (16+5);
				position_y = (detected_y) / 5 + LOCATION_BAR_Y;
				position_y2 = (detected_y2) / 5 + LOCATION_BAR_Y;
				draw_rectangle(position_x, position_y, 3, 3, BLUE);
				draw_rectangle(position_x2, position_y2, 3, 3, RED);
				//*(GFX+1) = 0x6 | ((640-detected_x) << 16) | (detected_y << 4);
				//xil_printf("detected_x = %d; detected_y = %d\n", detected_x, detected_y);
				if(player.HP > 0)	*(GFX+1) = 0x9 | (player.x << 16) | (player.y << 4);	// erase
				if(player2.HP > 0)	*(GFX+1) = 0x9 | (player2.x << 16) | (player2.y << 4);	// erase

				if(detected_x < 440)
					player.x = (player.x < GAME_BORDER_X-player.x_size-PLAYER_SPEED) ? player.x + 8 : player.x;
				else if(detected_x > 540)
					player.x = (player.x > PLAYER_SPEED) ? player.x - 8 : player.x;

				if(detected_y > 320)
					player.y = (player.y < GAME_BORDER_Y-player.y_size-PLAYER_SPEED) ? player.y + 8 : player.y;
				else if(detected_y < 160)
					player.y = (player.y > PLAYER_SPEED) ? player.y - 8 : player.y;

				if(detected_x2 < 100)
					player2.x = (player2.x < GAME_BORDER_X-player2.x_size-PLAYER_SPEED) ? player2.x + 8 : player2.x;
				else if(detected_x2 > 200)
					player2.x = (player2.x > PLAYER_SPEED) ? player2.x - 8 : player2.x;

				if(detected_y2 > 320)
					player2.y = (player2.y < GAME_BORDER_Y-player2.y_size-PLAYER_SPEED) ? player2.y + 8 : player2.y;
				else if(detected_y2 < 160)
					player2.y = (player2.y > PLAYER_SPEED) ? player2.y - 8 : player2.y;
			}
			if(player.HP > 0)	*(GFX+1) = 0x2 | (player.x << 16) | (player.y << 4);	// draw player
			if(player2.HP > 0)	*(GFX+1) = 0x1 | (player2.x << 16) | (player2.y << 4);	// draw player
			//draw boss
			if(big_boss.HP > 0)
			{
				*(GFX+1) = 0x6 | (big_boss.x << 16) | (big_boss.y << 4);
				//Darius: insert and draw bullet for each enemy
				insert_bullet_boss(big_boss.x + big_boss.x_size / 2, big_boss.y);
			}

			//Darius: insert and draw bullet for player
			if(player.HP > 0)	insert_bullet(player.x + player.x_size / 2,player.y);
			if(player2.HP > 0)	insert_bullet_2(player2.x + player2.x_size / 2,player2.y);
			draw_boss_bullet();
			// delay
			while(1)
			{
				if(*(GFX+2) > (100000000/30))
					break;
			}
			*(GFX+2) = 0;

			// clear
			if(big_boss.HP > 0){

				//TODO: need to change to 64x64 black, currently 64x64 white
				*(GFX+1) = 0x8 | (big_boss.x << 16) | (big_boss.y << 4);
				big_boss.x_velocity = (big_boss.x >= GAME_BORDER_X - 68 || big_boss.x <= 64) ? -big_boss.x_velocity : big_boss.x_velocity;
				big_boss.y_velocity = (big_boss.y >= GAME_BORDER_Y || big_boss.y <= 64) ? -big_boss.y_velocity : big_boss.y_velocity;
				big_boss.x += big_boss.x_velocity;
				big_boss.y += big_boss.y_velocity;
			}
			erase_and_calculate_boss_bullet();
			if(big_boss.HP <= 0)
				goto _Win;
			if(player.HP <= 0 && player2.HP <= 0)
				break;
		}
	}

_Defeat:
	*(AUDIO) = 0;
	*(AUDIO+1) = 6;
	draw_rectangle(0, 0, DISPLAY_COLUMNS, DISPLAY_ROWS, BLACK);
	while(1){

		if(*(GFX+3) == 1)
			goto _Start;

		draw_rectangle(200, 120, CHAR_LENGTH*6+50, CHAR_WIDTH, BLACK);
		for(i=0;i<2000000;i++);
		game_over(200,120);
		for(i=0;i<5000000;i++);
	}
_Win:
	draw_rectangle(0, 0, DISPLAY_COLUMNS, DISPLAY_ROWS, BLACK);
	while(1){

		if(*(GFX+3) == 1)
			goto _Start;

		draw_rectangle(200, 120, CHAR_LENGTH*7+60, CHAR_WIDTH, BLACK);
		for(i=0;i<2000000;i++);
		success(200,120);
		for(i=0;i<5000000;i++);
	}


	return 0;
}


