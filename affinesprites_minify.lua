function aspr(id,dx,dy,ox,oy,kx1,ky1,kx2,ky2,sx,sy,ra,bg,flip,tx,ty)
local sxo=-(ox*sx)local syo=-(oy*sy)local SkX1=(kx1*sx)local SkY1=(ky1*sy)local SkX2=(kx2*sx)local SkY2=(ky2*sy)local rx1,ry1=rfx(sxo+SkX1,syo+SkY1,ra)local rx2,ry2=rfx(((tx*8)*sx)+sxo+SkX1,syo+SkY2,ra)local rx3,ry3=rfx(sxo+SkX2,((ty*8)*sy)+syo+SkY1,ra)local rx4,ry4=rfx(((tx*8)*sx)+sxo+SkX2,((ty*8)*sy)+syo+SkY2,ra)local vx1=dx+rx1
local vy1=dy+ry1
local vx2=dx+rx2
local vy2=dy+ry2
local vx3=dx+rx3
local vy3=dy+ry3
local vx4=dx+rx4
local vy4=dy+ry4
local ux1=((id%16)*8)local uy1=(floor(id/16)*8)local ux2=(((id%16)*8)+(tx*8))local uy2=(floor(id/16)*8)local ux3=((id%16)*8)local uy3=((floor(id/16)*8)+(ty*8))local ux4=(((id%16)*8)+(tx*8))local uy4=((floor(id/16)*8)+(ty*8))if flip%4==0 then ttri(vx1,vy1,vx2,vy2,vx3,vy3,ux1,uy1,ux2,uy2,ux3,uy3,false,bg)ttri(vx3,vy3,vx4,vy4,vx2,vy2,ux3,uy3,ux4,uy4,ux2,uy2,false,bg)end
if flip%4==1 then ttri(vx1,vy1,vx2,vy2,vx3,vy3,ux2-0.01,uy2,ux1-0.01,uy1,ux4-0.01,uy4,false,bg)ttri(vx3,vy3,vx4,vy4,vx2,vy2,ux4-0.01,uy4,ux3-0.01,uy3,ux1-0.01,uy1,false,bg)end
if flip%4==2 then ttri(vx1,vy1,vx2,vy2,vx3,vy3,ux3,uy3-0.01,ux4,uy4-0.01,ux1,uy1-0.01,false,bg)ttri(vx3,vy3,vx4,vy4,vx2,vy2,ux1,uy1-0.01,ux2,uy2-0.01,ux4,uy4-0.01,false,bg)end
if flip%4==3 then ttri(vx1,vy1,vx2,vy2,vx3,vy3,ux4-0.01,uy4-0.01,ux3-0.01,uy3-0.01,ux2-0.01,uy2-0.01,false,bg)ttri(vx3,vy3,vx4,vy4,vx2,vy2,ux2-0.01,uy2-0.01,ux1-0.01,uy1-0.01,ux3-0.01,uy3-0.01,false,bg)end
end function rfx(rx0,ry0,ra)local sa=sin(rad(ra))ca=cos(rad(ra))return rx0*ca-ry0*sa,rx0*sa+ry0*ca end ttri=ttri or textri
floor=math.floor
sin=math.sin
cos=math.cos
deg=math.deg
rad=math.rad
