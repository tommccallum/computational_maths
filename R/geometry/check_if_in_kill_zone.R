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
player_location <- c(0,0)
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
points(0,0,pch=19, col="green", lwd=15)
points(isHitResults[which(isHitResults[,3]==0),1], isHitResults[which(isHitResults[,3]==0),2], col=cols[1], pch=19)
points(isHitResults[which(isHitResults[,3]==1),1], isHitResults[which(isHitResults[,3]==1),2], col=cols[2], pch=19, lwd=10)
plot(-10:10, -10:10, col="white", main="Impact Ranges (Circle)")
abline(v=0)
abline(h=0)
points(0,0,pch=19, col="green", lwd=15)
points(isHitResults[which(isHitResults[,4]==0),1], isHitResults[which(isHitResults[,4]==0),2], col=cols[1], pch=19)
points(isHitResults[which(isHitResults[,4]==1),1], isHitResults[which(isHitResults[,4]==1),2], col=cols[2], pch=19, lwd=10)


