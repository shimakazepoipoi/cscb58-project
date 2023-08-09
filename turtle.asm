#####################################################################
#
# CSCB58 Winter 2022 Assembly Final Project
# University of Toronto, Scarborough
#
# ziming wang
# 1007695031
# shimakaze.wang@mail.utoronto.ca
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4 (update this as needed)
# - Unit height in pixels: 4 (update this as needed)
# - Display width in pixels: 512 (update this as needed)
# - Display height in pixels: 256 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 3 


# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. double jump
# 2. fail condition fall or touch monster
# 3. moving platforms
# 4. win condition: rich end
# 5. Moving objects
# 6. Different levels
# total: 9 marks 

# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes 
#
#
#####################################################################

.eqv BASE_ADDRESS 0x10008000
.eqv black 0x000000
.eqv white 0xffffff
.eqv red 0xff0000
.eqv green 0x00ff00
.eqv blue 0x0000ff
.eqv dark_green 0x276B2B

.eqv orange 0xEE5121

.eqv yellow 0xF8E53E

.eqv BASE_ADDRESS 0x10008000
.eqv spike_inside 0x00dfdfdf
.eqv spike_outline 0x002f2f2f	
.eqv board_back 0x004a4a4a
.eqv blue_pants 0x003f51b5
.eqv platform 0x00f57f17
.eqv yellow_damage 0x00fff3b0
.eqv red_damage 0x00c75050
.eqv blue_pants_damage 0x007d87b3
.eqv grey_cannon 0x00333333





.data
health: .word 3
player_position: .word 27140
double_jump: .word 1
old_player_position:  .word 27140
get_key: .word 1
monster_position: .word 19500
direction: .word 0
platform_position: .word 12952
platform_direction: .word 0



.text



main:

	la $t0, health
	li $t1, 3
	sw $t1, 0($t0)
	la $t0, double_jump
	li $t1, 1
	sw $t1, 0($t0)
	la $t0, player_position
	li $t1, 27140
	sw $t1, 0($t0)
	la $t0, old_player_position
	li $t1, 27140
	sw $t1, 0($t0)
	la $t0, get_key
	li $t1, 1
	sw $t1, 0($t0)
	
	
	
	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 27648

	li $t0, blue


	
start_loop_paint_board1:
	bgt $t4, 127, end_loop_paint_board1	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_loop_paint_board1	
end_loop_paint_board1:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 20156

	

	
	
start_loop_paint_board2:
	bgt $t4, 50, end_loop_paint_board2	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_loop_paint_board2	
end_loop_paint_board2:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 15200

	

	
	
start_loop_paint_board3:
	bgt $t4, 34, end_loop_paint_board3	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_loop_paint_board3	
end_loop_paint_board3:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	add $t1, $t9, 7900

	

	
	
start_loop_paint_board4:
	bgt $t4, 34, end_loop_paint_board4	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_loop_paint_board4	
end_loop_paint_board4:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	j draw_door
	
	
#####################missing spike
	
	
draw_key_erase:
	li $t0, 0
	la $t1, get_key	#store get key
	sw $t0, 0($t1)
	
	li $t9, BASE_ADDRESS
	li $t0, black
	add $t1, $t9, 7400
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -524
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -516
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	j press

	
		
			
draw_door:
	li $t0, orange
	add $t1, $t9, 27636
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	li $t0, yellow
	add $t1, $t1, 4
	sw $t0, 0($t1)
	li $t0, orange
	add $t1, $t1, 4
	sw $t0, 0($t1)
	
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
		
			
					
draw_key:

	li $t0, yellow
	add $t1, $t9, 7400
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -524
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -516
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	
	
	

	lw $a0, player_position
	jal draw_character

	
	
	
	
	
start:


	li $t9, 0xffff0000	
	lw $t8, 0($t9)
	bne $t8, 1, no_press	# check for key press
	jal keypress_handle	# we are here so a key was pressed
	
	lw $a0, player_position
	li $t0 BASE_ADDRESS
	add $a0, $t0, $a0
	add $a0, $a0, -16
	lw $t1, 0($a0)
	li $t2, yellow
	beq $t1, $t2, draw_key_erase
	add $a0, $a0, 56
	lw $t1, 0($a0)
	li $t2, orange
	beq $t1, $t2, have_key



press:

	lw $a0, old_player_position
	jal draw_chatacter_erase
	lw $a0, player_position
	jal draw_character


	lw $a0, player_position
	la $t1,  old_player_position
	sw $a0, 0($t1)   #store old position

	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
	
	
have_key:
	li $t0, 0
	lw $t1, get_key	#store get key
	beq $t0, $t1, next_door
	j press


	
no_press: 
	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
	
	
	




	
falling:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling1
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling1:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling2
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling2:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling3
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling3:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling4
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling4:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling5
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling5:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling6
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling6:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling7
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling7:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling8
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling8:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling9
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling9:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling10
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start
falling10:
	li $v0, 32
	li $a0, 50 # Wait one second (1000 milliseconds)
	syscall

	lw $a0, player_position
	jal draw_chatacter_erase
	
	
	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)


	
	lw $a0, player_position
	add $a0, $a0, 512
	jal draw_character
	


	lw $a0, player_position
	add $a0, $a0, 512
	la $t0, player_position
	sw $a0, 0($t0)

	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)
	j start
	



	
	
draw_chatacter_erase:
	li $t0, black
	li $t1, BASE_ADDRESS	# load address of $gp
	add $a0, $t1, $a0
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	add $a0, $a0, 4
	add $a0, $a0, 4
	sw $t0, 0($a0)	
	add $a0, $a0, 4
	sw $t0, 0($a0)	
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -536
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -544
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	jr $ra
	

draw_character: 
# $a0 = position, $a1 = 0 for erase, 1 for draw. Uses: $t0-3, $a0
	#beqz $a1, draw_chatacter_erase	# erase if $a0 == 0
	la $t1, BASE_ADDRESS	# load address of $gp
	add $a0, $t1, $a0

	li $t0, green
change_color1:		
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 12
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -512
	sw $t0, 0($a0)
	addi $a0, $a0, -4
	sw $t0, 0($a0)
	addi $a0, $a0, -4
	sw $t0, 0($a0)
	addi $a0, $a0, -4
	sw $t0, 0($a0)
	addi $a0, $a0, -4
	sw $t0, 0($a0)
	addi $a0, $a0, -4
	sw $t0, 0($a0)
	addi $a0, $a0, -488
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -516
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -520
	sw $t0, 0($a0)
	addi $a0, $a0, 8
	sw $t0, 0($a0)
	addi $a0, $a0, -520
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	
	li $t0, dark_green
	
change_color2:
	addi $a0, $a0, 1504
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -532
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -532
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -528
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, -520
	sw $t0, 0($a0)
	addi $a0, $a0, 4
	sw $t0, 0($a0)
	addi $a0, $a0, 3060
	jr $ra



keypress_handle:	# uses $t0-5
		# load address of $gp
		
	lw $a0, player_position
	la $t1, BASE_ADDRESS
	add $t1, $t1, $a0
	
	li $t9, 0xffff0000
	lw $t2, 4($t9)
	beq $t2, 0x61, respond_to_a
	beq $t2, 0x64, respond_to_d
	beq $t2, 0x77, respond_to_w_observer
	beq $t2, 0x70, respond_to_p
	
	jr $ra	
	
respond_to_d:




	#观察前方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, old_player_position
	add $a0, $t0, $a0
	add $a0, $a0, 36
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	
	

	
	
	lw $a0, player_position
	li $t0, 512
	div $a0, $t0
	mfhi $t1
	beq, $t1, 476, do_nothing
	

	lw $a0, player_position	
	add $a0, $a0, 4
	la $t0,  player_position
	sw $a0, 0($t0)
	

	

	jr $ra	




respond_to_a:


	#观察后方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, old_player_position
	add $a0, $t0, $a0
	add $a0, $a0, -12
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing	
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing
	add $a0, $a0, -512
	lw $t2, 0($a0)
	bne $t1, $t2, do_nothing


	lw $a0, player_position
	li $t0, 512
	div $a0, $t0
	mfhi $t1
	beq, $t1, 4, do_nothing





	lw $a0, player_position
	add $a0, $a0, -4
	la $t0,  player_position	
	sw $a0, 0($t0)
	jr $ra
	
	
respond_to_w_observer:
	
	
	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, flying
	j respond_to_w

double_jump_1:
	li $t0, 0
	la $a0, double_jump
	sw $t0 0($a0)
	j respond_to_w
	
	
respond_to_w:

	lw $a1, old_player_position
	lw $a0, player_position
	la $t1, BASE_ADDRESS
	
	
	la $t1,  old_player_position	
	sw $a0, 0($t1)   #store old position
	
	add $a0, $a0, -7680
	la $t0,  player_position
	sw $a0, 0($t0)
	jr $ra


respond_to_p:
	la $t0, BASE_ADDRESS
	li $t1, black
	li $t2, 0
	li $t3, 32768

p_loop:
	
	
	sw $t1, 0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	beq $t2, $t3, main
	bne $t2, $t3, p_loop



	j main


do_nothing:
	jr $ra	



flying:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying1
	j respond_to_w
flying1:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying2
	j respond_to_w
flying2:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying3
	j respond_to_w
flying3:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying4
	j respond_to_w
flying4:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying5
	j respond_to_w
flying5:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying6
	j respond_to_w
flying6:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying7
	j respond_to_w
flying7:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying8
	j respond_to_w
flying8:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, flying9
	j respond_to_w
flying9:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, double_jump2
	j respond_to_w


double_jump2:
	lw $a0, double_jump
	li $t0, 1
	beq $a0, $t0, double_jump_1
	j do_nothing



###############################################################################################################         second map           ##########################################################################################
next_door:

	
	


	la $t0, BASE_ADDRESS
	li $t1, black
	li $t2, 0
	li $t3, 32768

next_door_loop:
	
	
	sw $t1, 0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	beq $t2, $t3, next_map
	bne $t2, $t3, next_door_loop

	
	
next_map:	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 27648

	li $t0, blue


	
start_map2_board1:
	bgt $t4, 30, end_map2_board1	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map2_board1	
end_map2_board1:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	
	add $t1, $t1, 56

	

	
	
start_map2_board2:
	bgt $t4, 81, end_map2_board2	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map2_board2	
end_map2_board2:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 20000

	

	
	
start_map2_board3:
	bgt $t4, 60, end_map2_board3	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map2_board3	
end_map2_board3:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	

	

	
	




#draw door
	li $t0, orange
	add $t1, $t9, 27636
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	li $t0, yellow
	add $t1, $t1, 4
	sw $t0, 0($t1)
	li $t0, orange
	add $t1, $t1, 4
	sw $t0, 0($t1)
	
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
		
			
					

#draw key
	li $t0, yellow
	add $t1, $t9, 12552
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -524
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -516
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)













	la $t0, health
	li $t1, 3
	sw $t1, 0($t0)
	la $t0, double_jump
	li $t1, 1
	sw $t1, 0($t0)
	la $t0, player_position
	li $t1, 27140
	sw $t1, 0($t0)
	la $t0, old_player_position
	li $t1, 27140
	sw $t1, 0($t0)
	la $t0, monster_position
	li $t1, 19500
	sw $t1, 0($t0)
	la $t0, platform_position
	li $t1, 12952
	sw $t1, 0($t0)
	la $t0, get_key
	li $t1, 1
	sw $t1, 0($t0)
	la $t0, direction
	li $t1, 0
	sw $t1, 0($t0)
	la $t0, platform_direction
	li $t1, 0
	sw $t1, 0($t0)
	
	lw $a0, player_position
	jal draw_character


	lw $a0, monster_position
	jal draw_monster
	lw $a0, platform_position
	li $t0, BASE_ADDRESS	# load address of $gp
	add $a0, $a0, $t0
	jal draw_plantform
	
	
	
	
	

start_map2:
	lw $a0, platform_direction
	li $t0, 0
	beq $a0, $t0, add_platform
	li $t0, 1
	beq $a0, $t0, sub_platform
	
platform_over_position:
	li $t0, 1
	la $t1, platform_direction
	sw $t0, 0($t1)
	j sub_platform
	
platform_less_position:
	li $t0, 0
	la $t1, platform_direction
	sw $t0, 0($t1)
	j add_platform
	

	
add_platform:
	lw $a0, platform_position
	li $t0, 13072
	bgt $a0, $t0, platform_over_position

	lw $a0, platform_position
	li $t0, BASE_ADDRESS	# load address of $gp
	add $a0, $a0, $t0
	jal draw_plantform_e
	lw $a0, platform_position
	add $a0, $a0, 4
	li $t0, BASE_ADDRESS	# load address of $gp
	add $a0, $a0, $t0
	jal draw_plantform
	lw $t0, platform_position
	la $t1, platform_position
	add $t0, $t0, 4
	sw $t0, 0($t1)
	

	j monster
sub_platform:
	lw $a0, platform_position
	li $t0, 12952
	blt $a0, $t0, platform_less_position

	lw $a0, platform_position
	li $t0, BASE_ADDRESS	# load address of $gp
	add $a0, $a0, $t0
	jal draw_plantform_e
	lw $a0, platform_position
	add $a0, $a0, -4
	li $t0, BASE_ADDRESS	# load address of $gp
	add $a0, $a0, $t0
	jal draw_plantform
	lw $t0, platform_position
	la $t1, platform_position
	add $t0, $t0, -4
	sw $t0, 0($t1)
	
	j monster
	

monster:
	lw $a0, direction
	li $t0, 0
	beq $a0, $t0, add_monster
	li $t0, 1
	beq $a0, $t0, sub_monster
	
over_position:
	li $t0, 1
	la $t1, direction
	sw $t0, 0($t1)
	j sub_monster
	
less_position:
	li $t0, 0
	la $t1, direction
	sw $t0, 0($t1)
	j add_monster
	

	
add_monster:
	lw $a0, monster_position
	li $t0, 19680
	bgt $a0, $t0, over_position



	jal draw_monster_e
	lw $a0, monster_position
	add $a0, $a0, 4
	jal draw_monster
	lw $t0, monster_position
	la $t1, monster_position
	add $t0, $t0, 4
	sw $t0, 0($t1)
	
	li $v0, 32
	li $a0, 20 # Wait one second (1000 milliseconds)
	syscall
	j start_map2_monster
sub_monster:
	lw $a0, monster_position
	li $t0, 19500
	blt $a0, $t0, less_position

	jal draw_monster_e
	lw $a0, monster_position
	add $a0, $a0, -4
	jal draw_monster
	lw $t0, monster_position
	la $t1, monster_position
	add $t0, $t0, -4
	sw $t0, 0($t1)
	
	li $v0, 32
	li $a0, 20 # Wait one second (1000 milliseconds)
	syscall
	j start_map2_monster
####################################################################################################################start map2#########################################################
start_map2_monster:




	#观察前方障碍物
	li $t0, BASE_ADDRESS
	li $t1, white
	lw $a0, old_player_position
	add $a0, $t0, $a0
	add $a0, $a0, 36
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead

	#观察后方障碍物
	li $t0, BASE_ADDRESS
	li $t1, white
	lw $a0, old_player_position
	add $a0, $t0, $a0
	add $a0, $a0, -4
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	add $a0, $a0, -512
	lw $t2, 0($a0)
	beq $t1, $t2, dead
	
	
	lw $a0, old_player_position
	li $t1, 29188
	bge $a0, $t1, dead



	li $t9, 0xffff0000	
	lw $t8, 0($t9)
	bne $t8, 1, no_press_map2	# check for key press
	jal keypress_handle	# we are here so a key was pressed

	lw $a0, player_position
	li $t0 BASE_ADDRESS
	add $a0, $t0, $a0
	add $a0, $a0, -16
	lw $t1, 0($a0)
	li $t2, yellow
	beq $t1, $t2, draw_key_erase_map2
	add $a0, $a0, 60
	lw $t1, 0($a0)
	beq $t1, $t2, draw_key_erase_map2
	lw $t1, 0($a0)
	li $t2, orange
	beq $t1, $t2, have_key_map2




press_map2:
	lw $a0, old_player_position
	jal draw_chatacter_erase
	lw $a0, player_position
	jal draw_character
	

	lw $a0, player_position
	la $t1,  old_player_position	
	sw $a0, 0($t1)   #store old position

	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2


	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start_map2



	
	
	
	
have_key_map2:
	li $t0, 0
	lw $t1, get_key	#store get key
	beq $t0, $t1, next_door_map2
	j press_map2
	
no_press_map2: 


	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2
	
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start_map2
falling_map2:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_1
	j start_map2
falling_map2_1:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_2
	j start_map2
falling_map2_2:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_3
	j start_map2
falling_map2_3:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_4
	j start_map2
falling_map2_4:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_5
	j start_map2
falling_map2_5:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_6
	j start_map2
falling_map2_6:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_7
	j start_map2
falling_map2_7:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_8
	j start_map2
falling_map2_8:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_9
	j start_map2
falling_map2_9:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map2_10
	j start_map2
falling_map2_10:

	lw $a0, player_position
	jal draw_chatacter_erase
	
	
	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)


	
	lw $a0, player_position
	add $a0, $a0, 512
	jal draw_character
	


	lw $a0, player_position
	add $a0, $a0, 512
	la $t0, player_position
	sw $a0, 0($t0)

	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)
	j start_map2
	
	
draw_monster_e:

	li $t1, BASE_ADDRESS	# load address of $gp
	add $a0, $t1, $a0
	li $t0, black
	sw $t0, 0($a0)
	add $a0, $a0, 24
	sw $t0, 0($a0)
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -544
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, -548
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, -536
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -536
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0,32
	sw $t0, 0($a0)
	jr $ra

draw_monster:
	li $t1, BASE_ADDRESS	# load address of $gp
	add $a0, $t1, $a0
	li $t0, white
	sw $t0, 0($a0)
	add $a0, $a0, 24
	sw $t0, 0($a0)
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, -532
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -544
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, -548
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 8
	sw $t0, 0($a0)
	add $a0, $a0, -536
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 16
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -536
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, 4
	sw $t0, 0($a0)
	add $a0, $a0, -540
	sw $t0, 0($a0)
	add $a0, $a0,32
	sw $t0, 0($a0)
	
	jr $ra
	
draw_plantform:
	
	
	li $t0, blue
	bgt $t4, 34, end_map2_board4	# run while $t4 < 61

	sw $t0, 0($a0)		# set the unit to board_back (dark grey)
	addi $a0, $a0, 4	# increment counters
	addi $t4, $t4, 1	
	j draw_plantform	
end_map2_board4:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($a0)
	addi $a0, $a0, 4	# skip last pixel 
	jr $ra
	
draw_plantform_e:

	
	li $t0, black
	bgt $t4, 34, end_map2_board4_e	# run while $t4 < 61

	sw $t0, 0($a0)		# set the unit to board_back (dark grey)
	addi $a0, $a0, 4	# increment counters
	addi $t4, $t4, 1	
	j draw_plantform_e
end_map2_board4_e:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($a0)
	addi $a0, $a0, 4	# skip last pixel 
	jr $ra

draw_key_erase_map2:
	li $t0, 0
	la $t1, get_key	#store get key
	sw $t0, 0($t1)
	
	li $t9, BASE_ADDRESS
	li $t0, black
	add $t1, $t9, 12552
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -524
	sw $t0, 0($t1)
	add $t1, $t1, 12
	sw $t0, 0($t1)
	add $t1, $t1, -520
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	add $t1, $t1, -516
	sw $t0, 0($t1)
	add $t1, $t1, -512
	sw $t0, 0($t1)
	add $t1, $t1, 4
	sw $t0, 0($t1)
	j press_map2
###########################################################################################################
next_door_map2:
	la $t0, BASE_ADDRESS
	li $t1, black
	li $t2, 0
	li $t3, 32768

next_door_loop3:
	
	
	sw $t1, 0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	beq $t2, $t3, next_map3
	bne $t2, $t3, next_door_loop3

	
	
next_map3:	
	li $t9, BASE_ADDRESS
	li $t1, BASE_ADDRESS
	add $t1, $t9, 27648

	li $t0, blue


	
start_map3_board1:
	bgt $t4, 15, end_map3_board1	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map3_board1	
end_map3_board1:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 

	add $t1, $t9, 20040

start_map3_board2:
	bgt $t4, 15, end_map3_board2	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map3_board2	
end_map3_board2:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	add $t1, $t9, 15000
	
	
start_map3_board3:
	bgt $t4, 15, end_map3_board3	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map3_board3	
end_map3_board3:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	add $t1, $t9, 15100
	li $t0, red
	
start_map3_board4:
	
	bgt $t4, 15, end_map3_board4	# run while $t4 < 61

	sw $t0, 0($t1)		# set the unit to board_back (dark grey)
	addi $t1, $t1, 4	# increment counters
	addi $t4, $t4, 1	
	j start_map3_board4	
end_map3_board4:
	li $t4, 0	# $t4 = 0, reset counter for inner start_loop 
	sw $zero, 0($t1)
	addi $t1, $t1, 4	# skip last pixel 
	
	
	
	
	
	
	
	
	
	la $t0, double_jump
	li $t1, 1
	sw $t1, 0($t0)
	la $t0, player_position
	li $t1, 27140
	sw $t1, 0($t0)
	la $t0, old_player_position
	li $t1, 27140
	sw $t1, 0($t0)


	
	lw $a0, player_position
	jal draw_character




start3:

 
	li $t0, BASE_ADDRESS
	lw $a0, old_player_position
	add $a0, $a0, $t0
	add $a0, $a0, 512
	li $t1, red
	lw $t2, 0($a0)
	bge $t2, $t1, win
	
	lw $a0, old_player_position
	li $t1, 29188
	bge $a0, $t1, dead



	li $t9, 0xffff0000	
	lw $t8, 0($t9)
	bne $t8, 1, no_press_map3	# check for key press
	jal keypress_handle	# we are here so a key was pressed






press_map3:
	lw $a0, old_player_position
	jal draw_chatacter_erase
	lw $a0, player_position
	jal draw_character
	

	lw $a0, player_position
	la $t1,  old_player_position	
	sw $a0, 0($t1)   #store old position

	#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3


	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)
	j start3



	
no_press_map3: 
		#观察下方障碍物
	li $t0, BASE_ADDRESS
	li $t1, black
	lw $a0, player_position
	add $a0, $t0, $a0
	add $a0, $a0, 508
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3
	
	li $t0, 1
	la $a0, double_jump
	sw $t0 0($a0)


	j start3
	


falling_map3:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_1
	j start3
falling_map3_1:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_2
	j start3
falling_map3_2:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_3
	j start3
falling_map3_3:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_4
	j start3
falling_map3_4:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_5
	j start3
falling_map3_5:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_6
	j start3
falling_map3_6:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_7
	j start3
falling_map3_7:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_8
	j start3
falling_map3_8:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_9
	j start3
falling_map3_9:
	add $a0, $a0, 4
	lw $t2, 0($a0)
	beq $t1, $t2, falling_map3_10
	j start3
falling_map3_10:

	li $v0, 32
	li $a0, 50 # Wait one second (1000 milliseconds)
	syscall


	lw $a0, player_position
	jal draw_chatacter_erase
	
	
	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)


	
	lw $a0, player_position
	add $a0, $a0, 512
	jal draw_character
	


	lw $a0, player_position
	add $a0, $a0, 512
	la $t0, player_position
	sw $a0, 0($t0)

	lw $a1, old_player_position
	lw $a0, player_position
	la $t1,  old_player_position	#store old position
	sw $a0, 0($t1)
	j start3





















dead:
	la $t0, BASE_ADDRESS
	li $t1, black
	li $t2, 0
	li $t3, 32768

dead_loop:
	
	
	sw $t1, 0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	beq $t2, $t3, dead_end
	bne $t2, $t3, dead_loop

	
	
dead_end:	
	la $t9, BASE_ADDRESS
	li $t2, 0
	
	
	li $t3, white
	addi $t2, $t9, 16564
	sw $t3, 0($t2)
	sw $t3, 16($t2)
	sw $t3, 516($t2)
	sw $t3, 524($t2)
	sw $t3, 1032($t2)
	sw $t3, 1544($t2)
	addi $t2, $t2, 24
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 4($t2)
	sw $t3, 8($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	sw $t3, 520($t2)
	sw $t3, 1032($t2)
	addi $t2, $t2, 16
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 8($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	sw $t3, 520($t2)
	sw $t3, 1032($t2)
	
	addi $t2, $t2, 20
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	addi $t2, $t2, 16
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 4($t2)
	sw $t3, 8($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	sw $t3, 520($t2)
	sw $t3, 1032($t2)
	addi $t2, $t2, 16
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1536($t2)
	sw $t3, 4($t2)
	sw $t3, 8($t2)
	sw $t3, 516($t2)
	sw $t3, 1028($t2)
	sw $t3, 1032($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	addi $t2, $t2, 16
	sw $t3, 0($t2)
	sw $t3, 4($t2)
	sw $t3, 8($t2)
	sw $t3, 516($t2)
	sw $t3, 1028($t2)
	sw $t3, 1540($t2)

end:	
	li $t9, 0xffff0000	
	lw $t8, 0($t9)
	bne $t8, 1, end	
	lw $t2, 4($t9)
	beq $t2, 0x70, respond_to_p
	j end


win:
	la $t0, BASE_ADDRESS
	li $t1, black
	li $t2, 0
	li $t3, 32768

win_loop:
	
	
	sw $t1, 0($t0)
	add $t0, $t0, 4
	add $t2, $t2, 1
	beq $t2, $t3, win_end
	bne $t2, $t3, win_loop
win_end:	
	la $t9, BASE_ADDRESS
	li $t2, 0
	
	
	li $t3, white
	addi $t2, $t9, 16564
	sw $t3, 0($t2)
	sw $t3, 16($t2)
	sw $t3, 516($t2)
	sw $t3, 524($t2)
	sw $t3, 1032($t2)
	sw $t3, 1544($t2)
	addi $t2, $t2, 24
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 4($t2)
	sw $t3, 8($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	sw $t3, 520($t2)
	sw $t3, 1032($t2)
	addi $t2, $t2, 16
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 8($t2)
	sw $t3, 1540($t2)
	sw $t3, 1544($t2)
	sw $t3, 520($t2)
	sw $t3, 1032($t2)
	
	
	addi $t2, $t2, 20
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1540($t2)
	sw $t3, 1032($t2)
	sw $t3, 1540($t2)
	sw $t3, 1548($t2)
	sw $t3, 16($t2)
	sw $t3, 528($t2)
	sw $t3, 1040($t2)
	
	addi $t2, $t2, 24
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	addi $t2, $t2, 8
	sw $t3, 0($t2)
	sw $t3, 512($t2)
	sw $t3, 1024($t2)
	sw $t3, 1536($t2)
	sw $t3, 516($t2)
	sw $t3, 1032($t2)
	sw $t3, 12($t2)
	sw $t3, 524($t2)
	sw $t3, 1036($t2)
	sw $t3, 1548($t2)
	j end


