#define __shidden_m3d_init
/*
    Sets up enums and other useful systems that will be used throughout the extension's
    lifetime.
 */
 
//  Pointer array positions
enum __M3D_AXIS
{
    marker,
    x, 
    y, 
    z,
}
//  Projection array positions
enum __M3D_JPORT
{
    marker,
    xport,
    yport,
    wport,
    hport,
    
    xfrom,
    yfrom,
    zfrom,
    xto,
    yto,
    zto,
    xup,
    yup,
    zup,
    angle,
    aspect,
    
    lcx, // Collision coords for the last collision in the projection
    lcy,
    lcz
}
//  Global misc constants
enum __M3D_GLOBAL
{
    pmarker = -9188,    // Pointer marker
    jmarker = -9189     // Projection marker
}
return undefined;

#define m3d_pointer_create
/// @description m3d_pointer_create()
/*
    Creates a new pointer that will be used with a given projection. The pointer
    can be updated as desired in 2D screen coordinates, then data about it can be
    retrieved in 3D coordinates.
    
    An ID is returned.
 */
 
var __id = ds_list_create();
ds_list_add(__id, __M3D_GLOBAL.pmarker, 0, 0); // Sets to default (0,0) position
// Return the pointer ID
return __id;

#define m3d_pointer_setpos
/// @description m3d_pointer_setpos(id, x, y)
/// @param id
/// @param  x
/// @param  y
/*
    Sets the position of the pointer on the screen.
    
    Argument0   -   id of the pointer
    Argument1   -   x-pos in screen coords
    Argument2   -   y-pos in screen coords
    
    Returns     -   N/A
 */
 
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
// Set the new position of the marker
argument0[| __M3D_AXIS.x] = argument1;
argument0[| __M3D_AXIS.y] = argument2;
 
return undefined;

#define m3d_pointer_get_x
/// @description m3d_pointer_get_x(id)
/// @param id
/*
    Returns the current x-position of the specified pointer
    
    Argument0   -   id of the pointer object
    
    Returns     -   current x-position
 */
 
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
return argument0[| __M3D_AXIS.x];

#define m3d_pointer_get_y
/// @description m3d_pointer_get_y(id)
/// @param id
/*
    Returns the current y-position of the specified pointer
    
    Argument0   -   id of the pointer object
    
    Returns     -   current y-position
 */
 
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
return argument0[| __M3D_AXIS.y];

#define m3d_pointer_destroy
/// @description m3d_pointer_destroy(id)
/// @param id
/*
    Destroys the specified pointer and all of its data.
    
    Argument0   -   The id of the pointer to destroy
    
    Returns     -   N/A
 */
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
ds_list_destroy(argument0); 
return undefined;

#define m3d_projection_create
/// @description m3d_projection_create(xport, yport, wport, hport)
/// @param xport
/// @param  yport
/// @param  wport
/// @param  hport
/*
    Creates a new "projection" object that will sync with a pointer to
    return the 3D coordinates
    
    Argument0   -   The x-position on the screen of the projection
    Argument1   -   The y-position on the screen of the projection
    Argument2   -   The width of the projection on the screen
    Argument3   -   The height of the projection on the screen
    
    Returns     -   Id of the projection
 */
 
if (argument0 < 0 || argument1 < 0)
    show_error("M3D: xport/yport must be >= 0", true);
if (argument2 < 1 || argument3 < 1)
    show_error("M3D: wport/hport must be >= 1", true);
 
var __id = ds_list_create();
ds_list_add(__id, __M3D_GLOBAL.jmarker, argument0, argument1, argument2, argument3);
ds_list_add(__id, 0, 0, 0, 1, 0, 0, 0, 0, 1, 60, room_width / room_height); // Default camera values
ds_list_add(__id, 0, 0, 0); // The collision coordinates (default to 0)
return __id;

#define m3d_projection_destroy
/// @description m3d_projection_destroy(id)
/// @param id
/*
    Destroys the specified projection and all of its data.
    
    Argument0   -   The id of the projection to destroy
    
    Returns     -   N/A
 */
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true); 
    
ds_list_destroy(argument0);
return undefined;

#define m3d_projection_define
/// @description m3d_projection_define(id, xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, angle, aspect)
/// @param id
/// @param  xfrom
/// @param  yfrom
/// @param  zfrom
/// @param  xto
/// @param  yto
/// @param  zto
/// @param  xup
/// @param  yup
/// @param  zup
/// @param  angle
/// @param  aspect
/*
    Defines the values for the in-game camera aspect of the projection.
    
    Argument0   -   id of the projection
    Argument1   -   Camera x
    Argument2   -   Camera y
    Argument3   -   Camera z
    Argument4   -   Camera x focus
    Argument5   -   Camera y focus
    Argument6   -   Camera z focus
    Argument7   -   xup
    Argument8   -   yup
    Argument9   -   zup
    Argument10   -  FOV
    Argument11  -   Aspect Ratio
    
    Returns     -   N/A
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
argument0[| __M3D_JPORT.xfrom] =    argument1;
argument0[| __M3D_JPORT.yfrom] =    argument2;
argument0[| __M3D_JPORT.zfrom] =    argument3;
argument0[| __M3D_JPORT.xto] =      argument4;
argument0[| __M3D_JPORT.yto] =      argument5;
argument0[| __M3D_JPORT.zto] =      argument6;
argument0[| __M3D_JPORT.xup] =      argument7;
argument0[| __M3D_JPORT.yup] =      argument8;
argument0[| __M3D_JPORT.zup] =      argument9;
argument0[| __M3D_JPORT.angle] =    argument10;
argument0[| __M3D_JPORT.aspect] =   argument11;
 
return undefined;

#define m3d_projection_calculate
/// @description m3d_projection_calculate(projection id, pointer id)
/// @param projection id
/// @param  pointer id
/*
    Calculates the 3D directional vector of the pointer.
    A 1D array of 4 values will then be returned, a value for each axis and the projection id
    
    Argument0   -   The projection id to use
    Argument1   -   The pointer id to use
    
    Returns     -   [1D ARRAY] Of 4 unit vector values:
                    0   -   x-vec direction
                    1   -   y-vec direction
                    2   -   z-vec direction
                    3   -   id of projection
 */
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
 
if (argument1[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
// Grab all the projection values:
var __xport  = argument0[| __M3D_JPORT.xport],
    __yport  = argument0[| __M3D_JPORT.yport],
    __wport  = argument0[| __M3D_JPORT.wport],
    __hport  = argument0[| __M3D_JPORT.hport],
    __xfrom  = argument0[| __M3D_JPORT.xfrom],
    __yfrom  = argument0[| __M3D_JPORT.yfrom],
    __zfrom  = argument0[| __M3D_JPORT.zfrom],
    __xto    = argument0[| __M3D_JPORT.xto],
    __yto    = argument0[| __M3D_JPORT.yto],
    __zto    = argument0[| __M3D_JPORT.zto],
    __xup    = argument0[| __M3D_JPORT.xup],
    __yup    = argument0[| __M3D_JPORT.yup],
    __zup    = argument0[| __M3D_JPORT.zup],
    __angle  = argument0[| __M3D_JPORT.angle],
    __aspect = argument0[| __M3D_JPORT.aspect];
    
var __vector; // The final vector to be returned
__vector[3] = 0;
// Create values for the math to come
var __mm, __dx, __dy, __dz,
    __vx, __vy, __vz,
    __tfov,__mX, __mY, __mZ;
    
// Delta between camera location and viewing location
__dx = __xto - __xfrom;
__dy = __yto - __yfrom;
__dz = __zto - __zfrom;
// Distance from camera position to viewing location
__mm = sqrt(sqr(__dx) + sqr(__dy) + sqr(__dz));
if (__mm < 1)
    show_error("M3D: Viewing distance too small! Must be at least 1 unit in length.", true);
// Normalize directional vector
__dx /= __mm;
__dy /= __mm;
__dz /= __mm;
// Reassign __mm to only the distance of the "up" axis
__mm = __xup * __dx + __yup * __dy + __zup * __dz;
// Subtract the distance on the "up" axis multiplied by the delta on the respective axis
__xup -= __mm * __dx;
__yup -= __mm * __dy;
__zup -= __mm * __dz;
// Reassign __mm to the length of the new "up" vectors:
__mm = sqrt(sqr(__xup) + sqr(__yup) + sqr(__zup));
if (__mm == 0)
    show_error("M3D: Incorrect cam-up vector!", true);
// Normalize the *up vector
__xup /= __mm;
__yup /= __mm;
__zup /= __mm;
// Perform cross product to find perpendicular vector
__vx = __yup * __dz - __dy * __zup;
__vy = __zup * __dx - __dz * __xup;
__vz = __xup * __dy - __dx * __yup;
// Account for field of view
__tfov = dtan(__angle / 2);
__xup *= __tfov;
__yup *= __tfov;
__zup *= __tfov;
    // Account for aspect ratio:
__vx *= __tfov * __aspect;
__vy *= __tfov * __aspect;
__vz *= __tfov * __aspect;
// Grab the position of the pointer ID
var __pointerx = argument1[| __M3D_AXIS.x],
    __pointery = argument1[| __M3D_AXIS.y];
    
// Compensate for the view port:
__pointerx -= __xport;
__pointery -= __yport;
    
// Calculate 3D position of the 2D pointer given the calculated vector values
__mx = __dx + __xup * (1 - 2 * __pointery / __hport) + __vx * (2 * __pointerx / __wport - 1);
__my = __dy + __yup * (1 - 2 * __pointery / __hport) + __vy * (2 * __pointerx / __wport - 1);
__mz = __dz + __zup * (1 - 2 * __pointery / __hport) + __vz * (2 * __pointerx / __wport - 1);
// Reassign __mm to the length of the directional vector
__mm = sqrt(sqr(__mx) + sqr(__my) + sqr(__mz));
if (__mm == 0)
    show_error("M3D: Invalid directional vector! Pointer has no distance.", true);
    
// Record the normalized vector:
__vector[0] = __mx / __mm;
__vector[1] = __my / __mm;
__vector[2] = __mz / __mm;
__vector[3] = argument0; // Record projection id for later function passing
// Return the directional vector for use in other scripts
return __vector;

#define m3d_projection_draw
/// @description m3d_projection_draw(id, near, far)
/// @param id
/// @param  near
/// @param  far
/*
    Draws the projection using d3d_* funtions just like a normal camera.
    This function is optional and for convenience.
    
    Argument0   -   id of the projection to use
    Argument1   -   Near-clipping plane
    ARgument2   -   Far-clipping plane
    
    Returns     -   N/A
 */
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
 
d3d_set_projection_ext(argument0[| __M3D_JPORT.xfrom], argument0[| __M3D_JPORT.yfrom], argument0[| __M3D_JPORT.zfrom],
                       argument0[| __M3D_JPORT.xto], argument0[| __M3D_JPORT.yto], argument0[| __M3D_JPORT.zto],
                       argument0[| __M3D_JPORT.xup], argument0[| __M3D_JPORT.yup], argument0[| __M3D_JPORT.zup],
                       argument0[| __M3D_JPORT.angle], argument0[| __M3D_JPORT.aspect], argument1, argument2);
return undefined;

#define m3d_projection_collision_get_x
/// @description m3d_projection_collision_get_x(id)
/// @param id
/*
    Returns the x-coordinate for the last collision found in this projection.
    Default is 0, if there was no collision in the last check, the value WILL NOT
    be update.
    
    Argument0   -   id of the projection to check
    
    Returns     -   value for the x-coordinate
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
return argument0[| __M3D_JPORT.lcx];

#define m3d_projection_collision_get_y
/// @description m3d_projection_collision_get_y(id)
/// @param id
/*
    Returns the y-coordinate for the last collision found in this projection.
    Default is 0, if there was no collision in the last check, the value WILL NOT
    be update.
    
    Argument0   -   id of the projection to check
    
    Returns     -   value for the y-coordinate
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
return argument0[| __M3D_JPORT.lcy];

#define m3d_projection_collision_get_z
/// @description m3d_projection_collision_get_z(id)
/// @param id
/*
    Returns the z-coordinate for the last collision found in this projection.
    Default is 0, if there was no collision in the last check, the value WILL NOT
    be update.
    
    Argument0   -   id of the projection to check
    
    Returns     -   value for the z-coordinate
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
return argument0[| __M3D_JPORT.lcz];

#define m3d_intersect_triangle
/// @description m3d_intersect_triangle([ARRAY] data, x1, y1, z1, x2, y2, z2, x3, y3, z3)
/// @param [ARRAY] data
/// @param  x1
/// @param  y1
/// @param  z1
/// @param  x2
/// @param  y2
/// @param  z2
/// @param  x3
/// @param  y3
/// @param  z3
/*
    Returns whether a given ray intersects a triangle.
    
    Argument0   -   [ARRAY] calculated projection data / projection id
    Argument1   -   triangle x1
    Argument2   -   triangle y1
    Argument3   -   triangle z1
    Argument4   -   triangle x2
    Argument5   -   triangle y2
    Argument6   -   triangle z2
    Argument7   -   triangle x3
    Argument8   -   triangle y3
    Argument9   -   triangle z3
    
    Returns     -   true if there was an intersection
 */
 
// Grab the needed camera values
var __projection = argument0[3]; // Projection for camera data
var __camx = __projection[| __M3D_JPORT.xfrom], // Look-from values
    __camy = __projection[| __M3D_JPORT.yfrom],
    __camz = __projection[| __M3D_JPORT.zfrom];
var __rayx = argument0[0],  // pointer directional vector
    __rayy = argument0[1],
    __rayz = argument0[2];
// Calculate vectors between two points in the triangle
var __ux = argument4 - argument1,
    __uy = argument5 - argument2,
    __uz = argument6 - argument3,
    __vx = argument7 - argument1,
    __vy = argument8 - argument2,
    __vz = argument9 - argument3;
    
// Calculate normal vector
var __nx = __uy * __vz - __uz * __vy,
    __ny = __uz * __vx - __ux * __vz,
    __nz = __ux * __vy - __uy * __vx,
// Record the "position" of the triangle (aka, initial point)
    __px = argument1,
    __py = argument2,
    __pz = argument3;
    
// Check if the ray is parallel
var __wx = __camx - __px,
    __wy = __camy - __py,
    __wz = __camz - __pz;
var __a = -(__nx * __wx + __ny * __wy + __nz * __wz),       // Dot product
    __b = (__nx * __rayx + __ny * __rayy + __nz * __rayz);  // Dot product
    
if (abs(__b) < 0.0001) // Close enough to parallel
{
    // Check if ray is INSIDE plane
    if (__a == 0)
        return true;
    else // Not inside, so never intersects
        return false;
}
// Check if pointing away from face
var __r = __a / __b;
if (__r < 0)
    return false;
    
// Find intersect point:
var __ix = __camx + __rayx * __r,
    __iy = __camy + __rayy * __r,
    __iz = __camz + __rayz * __r;
    
// Check if the point is inside the triangle
var __uu = sqr(__ux) + sqr(__uy) + sqr(__uz),       // Dot product
    __uv = __ux * __vx + __uy * __vy + __uz * __vz, // Dot product
    __vv = sqr(__vx) + sqr(__vy) + sqr(__vz),       // Dot product
    __w2x = __ix - __px,
    __w2y = __iy - __py,
    __w2z = __iz - __pz;
var __wu = __w2x * __ux + __w2y * __uy + __w2z * __uz,
    __wv = __w2x * __vx + __w2y * __vy + __w2z * __vz;
var __d = __uv * __uv - __uu * __vv;
var __s, __t;
__s = (__uv * __wv - __vv * __wu) / __d;
    // Point is outside
if (__s < 0 || __s > 1)
    return false;
__t = (__uv * __wu - __uu * __wv) / __d;
if (__t < 0 || (__s + __t) > 1)
    return false;
    
// Record where the collision took place
__projection[| __M3D_JPORT.lcx] = __ix;
__projection[| __M3D_JPORT.lcy] = __iy;
__projection[| __M3D_JPORT.lcz] = __iz;
    
// Point falls inside
return true;

#define m3d_intersect_plane
/// @description m3d_intersect_plane([ARRAY] data, vx1, vy1, vz1, vx2, vy2, vz2, px, py, pz)
/// @param [ARRAY] data
/// @param  vx1
/// @param  vy1
/// @param  vz1
/// @param  vx2
/// @param  vy2
/// @param  vz2
/// @param  px
/// @param  py
/// @param  pz
/*
    Returns whether a given ray intersects an infinite plane, given two
    vectors that rest perpendicular to the plane.
    
    Argument0   -   [ARRAY] calculated projection data / projection id
    Argument1   -   x-axis of vector 1
    Argument2   -   y-axis of vector 1
    Argument3   -   z-axis of vector 1
    Argument4   -   x-axis of vector 2
    Argument5   -   y-axis of vector 2
    Argument6   -   z-axis of vector 2
    Argument7   -   x-position of point in plane
    Argument8   -   y-position of point in plane
    Argument9   -   z-position of point in plane
    
    Returns     -   true if there was an intersection
 */
 
// Grab the needed camera values
var __projection = argument0[3]; // Projection for camera data
var __camx = __projection[| __M3D_JPORT.xfrom], // Look-from values
    __camy = __projection[| __M3D_JPORT.yfrom],
    __camz = __projection[| __M3D_JPORT.zfrom];
var __rayx = argument0[0],  // pointer directional vector
    __rayy = argument0[1],
    __rayz = argument0[2];
// Calculate vectors between two points in the triangle
var __ux = argument1,
    __uy = argument2,
    __uz = argument3,
    __vx = argument4,
    __vy = argument5,
    __vz = argument6;
    
// Calculate normal vector
var __nx = __uy * __vz - __uz * __vy,
    __ny = __uz * __vx - __ux * __vz,
    __nz = __ux * __vy - __uy * __vx,
// Record the "position" of the triangle (aka, initial point)
    __px = argument7,
    __py = argument8,
    __pz = argument9;
    
// Check if the ray is parallel
var __wx = __camx - __px,
    __wy = __camy - __py,
    __wz = __camz - __pz;
var __a = -(__nx * __wx + __ny * __wy + __nz * __wz),       // Dot product
    __b = (__nx * __rayx + __ny * __rayy + __nz * __rayz);  // Dot product
    
if (abs(__b) < 0.0001) // Close enough to parallel
{
    // Check if ray is INSIDE plane
    if (__a == 0)
        return true;
    else // Not inside, so never intersects
        return false;
}
// Check if pointing away from face
var __r = __a / __b;
if (__r < 0)
    return false;
    
// Find intersect point:
var __ix = __camx + __rayx * __r,
    __iy = __camy + __rayy * __r,
    __iz = __camz + __rayz * __r;
// Record where the collision took place
__projection[| __M3D_JPORT.lcx] = __ix;
__projection[| __M3D_JPORT.lcy] = __iy;
__projection[| __M3D_JPORT.lcz] = __iz;
    
// Point falls inside
return true;

