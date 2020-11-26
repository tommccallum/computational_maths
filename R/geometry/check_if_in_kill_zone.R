# Common problem in a game:
#  we have a player and a baddie
#  each has a circle of "impact"
#  we want to know when they cross so that the one can inflict damage on the other


X_COORD_INDEX <- 1  # vectors are 1 based in R
Y_COORD_INDEX <- 2

isHit_byRectangle <- function(player_location, player_radius, enemy_location) {
    # is enemy_location within the circle of
    # player_location +/- player_radius
    # player location is a [x,y] pair 
    player_north <- player_location[Y_COORD_INDEX] + player_radius
    player_east <- player_location[X_COORD_INDEX] + player_radius
    player_west <- player_location[X_COORD_INDEX] - player_radius
    player_south <- player_location[Y_COORD_INDEX] - player_radius
    
    if ( enemy_location[Y_COORD_INDEX] <= player_north && 
         enemy_location[Y_COORD_INDEX] >= player_south && 
         enemy_location[X_COORD_INDEX] >= player_west &&
         enemy_location[X_COORD_INDEX] <= player_east 
        ) {
            return ( 1 )
        }
    return ( 0 )
}

isHit_byCicle <- function(player_location, player_radius, enemy_location) {
    # find the direction between player_location and enemy_location
    # we assume player_location is the origin
    change_in_x <- enemy_location[X_COORD_INDEX] - player_location[X_COORD_INDEX]
    change_in_y <- enemy_location[Y_COORD_INDEX] - player_location[Y_COORD_INDEX]
    # use pythag to get the distance
    magnitude <- sqrt( change_in_y ^ 2 + change_in_x ^ 2 )
    if ( magnitude <= player_radius ) {
        return ( 1 )
    }
    return ( 0 )
}

# plot areas where we are hit
isHitResults <- data.frame()
player_location <- c(3,-2)
player_radius <- 5
enemy_radius <- 3
for( x in -10:10 ) {
    for( y in -10:10 ) {
        enemy_location <- c(x,y)
        isHitR <- isHit_byRectangle( player_location, player_radius, enemy_location)
        isHitC <- isHit_byCicle( player_location, player_radius, enemy_location)
        isHitResults <- rbind( isHitResults, c(x, y, isHitR, isHitC ))
    }
}

cols <- c( "grey", "red")
par(mfcol=c(1,2))
plot(-10:10, -10:10, col="white", main="Impact Ranges (Rectangle)")
abline(v=0)
abline(h=0)
points(player_location[1],player_location[2],pch=19, col="green", lwd=15)
points(isHitResults[which(isHitResults[,3]==0),1], isHitResults[which(isHitResults[,3]==0),2], col=cols[1], pch=19)
points(isHitResults[which(isHitResults[,3]==1),1], isHitResults[which(isHitResults[,3]==1),2], col=cols[2], pch=19, lwd=10)
plot(-10:10, -10:10, col="white", main="Impact Ranges (Circle)")
abline(v=0)
abline(h=0)
points(player_location[1],player_location[2],pch=19, col="green", lwd=15)
points(isHitResults[which(isHitResults[,4]==0),1], isHitResults[which(isHitResults[,4]==0),2], col=cols[1], pch=19)
points(isHitResults[which(isHitResults[,4]==1),1], isHitResults[which(isHitResults[,4]==1),2], col=cols[2], pch=19, lwd=10)


# lets quickly remember what tan looks like:
plot_tan <- function() {
    y <- NULL
    x <- seq(-pi,pi,by=0.01)
    for ( t in x ) {
        okA <- as.logical(all.equal(t, -pi/2, tolerance=0.01 ))
        okB <- as.logical(all.equal(t, pi/2, tolerance=0.01))
        if ( !is.na(okA) || !is.na(okB) ) {
            y <- c(y, NA)
        } else {
            y = c( y, tan(t) )
        }
    }
    plot(x, y, type="l", main="tan(theta)", ylim=c(-8,8))
    abline(v=0)
    abline(h=0)
}

# where is the enemy?
# assumes player is looking down the positive x axis
# asymptotic - means that the function goes infinitely to a point, and 
# will blow up our calculations if we try to use that x coordinate.
# cos,sin,tan and there opposite arccos, arcsin, arctan 
# which have the shortened names in most languages of acos, asin, atan.
# acos, asin, atan take a ratio and give us an angle.
get_enemy_direction <- function( player_position, enemy_position ) {
    if ( all(player_position == enemy_position)) {
        return (0)
    }
    change_in_x = enemy_position[1] - player_position[1]
    change_in_y = enemy_position[2] - player_position[2]
    # are we in the right quadrants?
    if ( enemy_position[1] < player_position[1] ) {
        # we would need another test to know if we are in the top or bottom
        # quadrant.
        print("left quadrants")
        return (pi + atan( change_in_y / change_in_x) )
    }
    # are we in the bottom quadrants?
    if ( enemy_position[2] < player_position[2] ) {
        # here atan is negative
        print("bottom quadrant")
        return (2*pi + atan( change_in_y / change_in_x) )
    }
    return (atan( change_in_y / change_in_x) )
}

get_enemy_direction(c(0,0),c(1,0)) # should be zero
get_enemy_direction(c(0,0),c(0,1)) # should be pi/2
get_enemy_direction(c(0,0),c(-1,0)) # should be pi
get_enemy_direction(c(0,0),c(0,-1)) # should be 1.5pi

get_enemy_direction(c(0,0),c(2,2)) 
get_enemy_direction(c(0,0),c(-2,2)) 
get_enemy_direction(c(0,0),c(-2,-2)) 
get_enemy_direction(c(0,0),c(2,-2)) 

get_enemy_direction(c(0,0)+c(2,2),c(2,2)) 
get_enemy_direction(c(0,0)+c(2,2),c(-2,2)) 
get_enemy_direction(c(0,0)+c(2,2),c(-2,-2)) 
get_enemy_direction(c(0,0)+c(2,2),c(2,-2)) 