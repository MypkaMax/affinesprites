--Affine sprites by MypkaMax
--For the TIC-80 fantasy console
function aspr(id,drawX,drawY,originX,originY,shearX1,shearY1,shearX2,shearY2,scaleX,scaleY,angle,colourkey,flip,tilesX,tilesY)
	local scaleXo=-(originX*scaleX)
	local scaleYo=-(originY*scaleY)
	local ShearX1=-(shearX1*scaleX)
	local ShearY1=-(shearY1*scaleY)
	local ShearX2=-(shearX2*scaleX)
	local ShearY2=-(shearY2*scaleY)
	local rotateX1,rotateY1=rotateFX(scaleXo+ShearX1,scaleYo+ShearY1,angle)
	local rotateX2,rotateY2=rotateFX(((tilesX*8)*scaleX)+scaleXo+ShearX1,scaleYo+ShearY2,angle)
	local rotateX3,rotateY3=rotateFX(scaleXo+ShearX2,((tilesY*8)*scaleY)+scaleYo+ShearY1,angle)
	local rotateX4,rotateY4=rotateFX(((tilesX*8)*scaleX)+scaleXo+ShearX2,((tilesY*8)*scaleY)+scaleYo+ShearY2,angle)
	local vertexX1=drawX+rotateX1
	local vertexY1=drawY+rotateY1
	local vertexX2=drawX+rotateX2
	local vertexY2=drawY+rotateY2
	local vertexX3=drawX+rotateX3
	local vertexY3=drawY+rotateY3
	local vertexX4=drawX+rotateX4
	local vertexY4=drawY+rotateY4
	local uvX1=((id%16)*8)
	local uvY1=(floor(id/16)*8)
	local uvX2=(((id%16)*8)+(tilesX*8))
	local uvY2=(floor(id/16)*8)
	local uvX3=((id%16)*8)
	local uvY3=((floor(id/16)*8)+(tilesY*8))
	local uvX4=(((id%16)*8)+(tilesX*8))
	local uvY4=((floor(id/16)*8)+(tilesY*8))
	if flip%4==0 then
		ttri(vertexX1,vertexY1,vertexX2,vertexY2,vertexX3,vertexY3,uvX1,uvY1,uvX2,uvY2,uvX3,uvY3,false,colourkey)
		ttri(vertexX3,vertexY3,vertexX4,vertexY4,vertexX2,vertexY2,uvX3,uvY3,uvX4,uvY4,uvX2,uvY2,false,colourkey)
	end
	if flip%4==1 then
		ttri(vertexX1,vertexY1,vertexX2,vertexY2,vertexX3,vertexY3,uvX2-0.01,uvY2,uvX1-0.01,uvY1,uvX4-0.01,uvY4,false,colourkey)
		ttri(vertexX3,vertexY3,vertexX4,vertexY4,vertexX2,vertexY2,uvX4-0.01,uvY4,uvX3-0.01,uvY3,uvX1-0.01,uvY1,false,colourkey)
	end
	if flip%4==2 then
		ttri(vertexX1,vertexY1,vertexX2,vertexY2,vertexX3,vertexY3,uvX3,uvY3-0.01,uvX4,uvY4-0.01,uvX1,uvY1-0.01,false,colourkey)
		ttri(vertexX3,vertexY3,vertexX4,vertexY4,vertexX2,vertexY2,uvX1,uvY1-0.01,uvX2,uvY2-0.01,uvX4,uvY4-0.01,false,colourkey)
	end
	if flip%4==3 then
		ttri(vertexX1,vertexY1,vertexX2,vertexY2,vertexX3,vertexY3,uvX4-0.01,uvY4-0.01,uvX3-0.01,uvY3-0.01,uvX2-0.01,uvY2-0.01,false,colourkey)
		ttri(vertexX3,vertexY3,vertexX4,vertexY4,vertexX2,vertexY2,uvX2-0.01,uvY2-0.01,uvX1-0.01,uvY1-0.01,uvX3-0.01,uvY3-0.01,false,colourkey)
	end
end
function rotateFX(rotateX0,rotateY0,angle)
	local sa=sin(rad(angle))ca=cos(rad(angle))
	return
	rotateX0*ca-rotateY0*sa,rotateX0*sa+rotateY0*ca
end
ttri=ttri or textri
floor=math.floor
sin=math.sin
cos=math.cos
deg=math.deg
rad=math.rad
