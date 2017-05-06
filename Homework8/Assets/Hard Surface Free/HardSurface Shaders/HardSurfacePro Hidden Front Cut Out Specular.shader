
Shader "Hidden/Hardsurface Pro Front Cut Out Specular"{

SubShader { // Shader Model 3

	// Front Faces pass
	
	//Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	 zwrite off Cull Back Ztest Lequal
	 Blend SrcAlpha OneMinusSrcAlpha
	 colormask RGBA
	
		
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 35 to 96
//   d3d9 - ALU: 36 to 98
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_MainTex_ST]
Vector 24 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 59 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.x, R1, c[19];
DP4 R3.y, R1, c[20];
MOV R1.xyz, vertex.attrib[14];
MAD R0.w, R0.x, R0.x, -R0.y;
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.w, c[22];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[6].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R0;
MOV R0.w, c[0].x;
MOV R0.xyz, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[13].w, -vertex.position;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[5].y, R2, R1;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R1;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 59 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_MainTex_ST]
Vector 23 [_BumpMap_ST]
"vs_3_0
; 62 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
add o7.xyz, r2, r3
mul r2.xyz, v1.w, r0
mov r0.w, c24.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c12.w, -v0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r2, r3
dp3 o6.y, r2, r4
mul o4, r0, c12.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_8 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_13 * (((_World2Object * tmpvar_22).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_8;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Reflection + tmpvar_20) * tmpvar_11.z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_21);
  float tmpvar_22;
  tmpvar_22 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_23;
  tmpvar_23 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp vec3 tmpvar_24;
  tmpvar_24 = mix (CubeTex, (CubeTex * tmpvar_19.xyz), vec3(((1.0 - (tmpvar_22 * tmpvar_22)) * _Metalics)));
  lowp float tmpvar_25;
  tmpvar_25 = tmpvar_19.w;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_19.xyz * (1.0 - clamp (tmpvar_21, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_25 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_27;
  tmpvar_27 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_27;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_28;
  tmpvar_28 = dot (tmpvar_13, xlv_TEXCOORD5);
  lowp float tmpvar_29;
  tmpvar_29 = max (tmpvar_28, (abs (tmpvar_28) * (1.0 - tmpvar_25)));
  lowp float tmpvar_30;
  tmpvar_30 = dot (tmpvar_13, normalize ((xlv_TEXCOORD5 + viewDir)));
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, nh);
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = (pow (tmpvar_31, (tmpvar_12 * 128.0)) * tmpvar_23);
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_26 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * 2.0);
  c_i0_i1.xyz = tmpvar_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_25 + ((_LightColor0.w * _SpecColor.w) * tmpvar_32));
  c_i0_i1.w = tmpvar_34;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_26 * xlv_TEXCOORD6));
  c.xyz = (c.xyz + tmpvar_24);
  c.w = tmpvar_25;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 35 ALU
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MUL R1.xyz, vertex.attrib[14].w, R0;
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R1, R2;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_3_0
; 36 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mov r1.xyz, c13
mov r1.w, c17.x
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mul r1.xyz, v1.w, r0
mad r2.xyz, r2, c12.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c12.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c12.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r1, r2
mul o4, r0, c12.w
dp3 o5.z, v2, r2
dp3 o5.x, v1, r2
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o6.xy, v4, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_6 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_11 * (((_World2Object * tmpvar_18).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD5;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_23 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz));
  c.w = tmpvar_22;
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
Vector 25 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 65 ALU
PARAM c[26] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.x, R1, c[20];
DP4 R3.y, R1, c[21];
MOV R1.xyz, vertex.attrib[14];
MAD R0.w, R0.x, R0.x, -R0.y;
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.w, c[23];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[6].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R0;
MOV R0.w, c[0].x;
MOV R0.xyz, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[14].w, -vertex.position;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 result.texcoord[5].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[4].y, R2, R3;
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
ADD result.texcoord[7].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
END
# 65 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
Vector 25 [_BumpMap_ST]
"vs_3_0
; 67 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c26, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c23
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
add o7.xyz, r2, r3
mul r2.xyz, v1.w, r0
mov r0.w, c26.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c14.w, -v0
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c26.y
mul r1.y, r1, c12.x
dp3 o5.y, r2, r3
dp3 o6.y, r2, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.zw, v3.xyxy, c25.xyxy, c25
mad o1.xy, v3, c24, c24.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * -((((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_1.xyz;
  tmpvar_13[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_13[2] = tmpvar_2;
  mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_13[0].x;
  tmpvar_14[0].y = tmpvar_13[1].x;
  tmpvar_14[0].z = tmpvar_13[2].x;
  tmpvar_14[1].x = tmpvar_13[0].y;
  tmpvar_14[1].y = tmpvar_13[1].y;
  tmpvar_14[1].z = tmpvar_13[2].y;
  tmpvar_14[2].x = tmpvar_13[0].z;
  tmpvar_14[2].y = tmpvar_13[1].z;
  tmpvar_14[2].z = tmpvar_13[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_14 * v_i0_i1.xyz);
  tmpvar_15.w = tmpvar_12.x;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_14 * v_i0_i1_i2.xyz);
  tmpvar_17.w = tmpvar_12.y;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (tmpvar_14 * v_i0_i1_i2_i3.xyz);
  tmpvar_19.w = tmpvar_12.z;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * unity_Scale.w);
  tmpvar_6 = tmpvar_20;
  mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = (tmpvar_21 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_25;
  mediump vec4 normal;
  normal = tmpvar_24;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAr, normal);
  x1.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAg, normal);
  x1.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHAb, normal);
  x1.z = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBr, tmpvar_29);
  x2.x = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBg, tmpvar_29);
  x2.y = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (unity_SHBb, tmpvar_29);
  x2.z = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_SHC.xyz * vC);
  x3 = tmpvar_34;
  tmpvar_25 = ((x1 + x2) + x3);
  shlight = tmpvar_25;
  tmpvar_8 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_35;
  tmpvar_35 = (tmpvar_9 * 0.5);
  o_i0 = tmpvar_35;
  highp vec2 tmpvar_36;
  tmpvar_36.x = tmpvar_35.x;
  tmpvar_36.y = (tmpvar_35.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_36 + tmpvar_35.w);
  o_i0.zw = tmpvar_9.zw;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_14 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Reflection + tmpvar_20) * tmpvar_11.z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_21);
  float tmpvar_22;
  tmpvar_22 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_23;
  tmpvar_23 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp vec3 tmpvar_24;
  tmpvar_24 = mix (CubeTex, (CubeTex * tmpvar_19.xyz), vec3(((1.0 - (tmpvar_22 * tmpvar_22)) * _Metalics)));
  lowp float tmpvar_25;
  tmpvar_25 = tmpvar_19.w;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_19.xyz * (1.0 - clamp (tmpvar_21, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_25 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7).x;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_28;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_29;
  tmpvar_29 = dot (tmpvar_13, xlv_TEXCOORD5);
  lowp float tmpvar_30;
  tmpvar_30 = max (tmpvar_29, (abs (tmpvar_29) * (1.0 - tmpvar_25)));
  lowp float tmpvar_31;
  tmpvar_31 = dot (tmpvar_13, normalize ((xlv_TEXCOORD5 + viewDir)));
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = max (0.0, nh);
  nh = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (pow (tmpvar_32, (tmpvar_12 * 128.0)) * tmpvar_23);
  mediump vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_26 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (tmpvar_27 * 2.0));
  c_i0_i1.xyz = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = (tmpvar_25 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * tmpvar_27));
  c_i0_i1.w = tmpvar_35;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_26 * xlv_TEXCOORD6));
  c.xyz = (c.xyz + tmpvar_24);
  c.w = tmpvar_25;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
Vector 19 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 40 ALU
PARAM c[20] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1.xyz, c[15];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MUL R1.xyz, vertex.attrib[14].w, R0;
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[4].y, R1, R2;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
ADD result.texcoord[7].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 40 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"vs_3_0
; 41 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord7 o7
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mov r1.xyz, c15
mov r1.w, c19.x
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mul r1.xyz, v1.w, r0
mad r2.xyz, r2, c14.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c14.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c14.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
dp3 o5.y, r1, r2
mul r1.xyz, r0.xyww, c19.y
mul r1.y, r1, c12.x
dp3 o5.z, v2, r2
dp3 o5.x, v1, r2
mad o7.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
mad o1.zw, v3.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o6.xy, v4, c16, c16.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = _WorldSpaceCameraPos;
  highp vec4 o_i0;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21.x = tmpvar_20.x;
  tmpvar_21.y = (tmpvar_20.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_21 + tmpvar_20.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_12 * (((_World2Object * tmpvar_19).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying highp vec2 xlv_TEXCOORD5;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_23 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7).x * 2.0))));
  c.w = tmpvar_22;
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [_MainTex_ST]
Vector 32 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 90 ALU
PARAM c[33] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[23], R0;
MUL R0.w, R3, R3;
MAD R0.w, R4.x, R4.x, -R0;
MUL R4.xyz, R0.w, c[30];
MOV R0.w, c[0].x;
DP4 R3.z, R1, c[29];
DP4 R3.y, R1, c[28];
DP4 R3.x, R1, c[27];
ADD R1.xyz, R2, R3;
ADD R1.xyz, R1, R4;
ADD result.texcoord[6].xyz, R1, R0;
MOV R0.xyz, c[14];
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[13].w, -vertex.position;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[5].y, R2, R1;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R1;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 90 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [_MainTex_ST]
Vector 31 [_BumpMap_ST]
"vs_3_0
; 93 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c32, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c29
add r3.xyz, r2, r3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mul r2.xyz, v1.w, r0
add o7.xyz, r3, r1
mov r0.w, c32.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c12.w, -v0
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r2, r3
dp3 o6.y, r2, r4
mul o4, r0, c12.w
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o1.zw, v3.xyxy, c31.xyxy, c31
mad o1.xy, v3, c30, c30.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_21;
  mediump vec3 tmpvar_25;
  mediump vec4 normal;
  normal = tmpvar_24;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAr, normal);
  x1.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAg, normal);
  x1.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHAb, normal);
  x1.z = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBr, tmpvar_29);
  x2.x = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBg, tmpvar_29);
  x2.y = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (unity_SHBb, tmpvar_29);
  x2.z = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_SHC.xyz * vC);
  x3 = tmpvar_34;
  tmpvar_25 = ((x1 + x2) + x3);
  shlight = tmpvar_25;
  tmpvar_8 = shlight;
  highp vec3 tmpvar_35;
  tmpvar_35 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosX0 - tmpvar_35.x);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosY0 - tmpvar_35.y);
  highp vec4 tmpvar_38;
  tmpvar_38 = (unity_4LightPosZ0 - tmpvar_35.z);
  highp vec4 tmpvar_39;
  tmpvar_39 = (((tmpvar_36 * tmpvar_36) + (tmpvar_37 * tmpvar_37)) + (tmpvar_38 * tmpvar_38));
  highp vec4 tmpvar_40;
  tmpvar_40 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_36 * tmpvar_21.x) + (tmpvar_37 * tmpvar_21.y)) + (tmpvar_38 * tmpvar_21.z)) * inversesqrt (tmpvar_39))) * 1.0/((1.0 + (tmpvar_39 * unity_4LightAtten0))));
  highp vec3 tmpvar_41;
  tmpvar_41 = (tmpvar_8 + ((((unity_LightColor0 * tmpvar_40.x) + (unity_LightColor1 * tmpvar_40.y)) + (unity_LightColor2 * tmpvar_40.z)) + (unity_LightColor3 * tmpvar_40.w)));
  tmpvar_8 = tmpvar_41;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_13 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_8;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Reflection + tmpvar_20) * tmpvar_11.z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_21);
  float tmpvar_22;
  tmpvar_22 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_23;
  tmpvar_23 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp vec3 tmpvar_24;
  tmpvar_24 = mix (CubeTex, (CubeTex * tmpvar_19.xyz), vec3(((1.0 - (tmpvar_22 * tmpvar_22)) * _Metalics)));
  lowp float tmpvar_25;
  tmpvar_25 = tmpvar_19.w;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_19.xyz * (1.0 - clamp (tmpvar_21, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_25 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_27;
  tmpvar_27 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_27;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_28;
  tmpvar_28 = dot (tmpvar_13, xlv_TEXCOORD5);
  lowp float tmpvar_29;
  tmpvar_29 = max (tmpvar_28, (abs (tmpvar_28) * (1.0 - tmpvar_25)));
  lowp float tmpvar_30;
  tmpvar_30 = dot (tmpvar_13, normalize ((xlv_TEXCOORD5 + viewDir)));
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, nh);
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = (pow (tmpvar_31, (tmpvar_12 * 128.0)) * tmpvar_23);
  mediump vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_26 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * 2.0);
  c_i0_i1.xyz = tmpvar_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_25 + ((_LightColor0.w * _SpecColor.w) * tmpvar_32));
  c_i0_i1.w = tmpvar_34;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_26 * xlv_TEXCOORD6));
  c.xyz = (c.xyz + tmpvar_24);
  c.w = tmpvar_25;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
Vector 33 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 96 ALU
PARAM c[34] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[24], R0;
MUL R0.w, R3, R3;
MAD R0.w, R4.x, R4.x, -R0;
MUL R4.xyz, R0.w, c[31];
MOV R0.w, c[0].x;
DP4 R3.z, R1, c[30];
DP4 R3.y, R1, c[29];
DP4 R3.x, R1, c[28];
ADD R1.xyz, R2, R3;
ADD R1.xyz, R1, R4;
ADD result.texcoord[6].xyz, R1, R0;
MOV R0.xyz, c[15];
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MAD R3.xyz, R1, c[14].w, -vertex.position;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
DP3 result.texcoord[5].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[5].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[4].y, R2, R3;
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[5].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
ADD result.texcoord[7].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 96 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
Vector 33 [_BumpMap_ST]
"vs_3_0
; 98 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c34, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.x
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mul r1.w, r3, r3
mad r0.x, r4, r4, -r1.w
add r2.xyz, r2, r3
mul r3.xyz, r0.x, c31
add r3.xyz, r2, r3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mul r2.xyz, v1.w, r0
add o7.xyz, r3, r1
mov r0.w, c34.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r3.xyz, r1, c14.w, -v0
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c34.z
mul r1.y, r1, c12.x
dp3 o5.y, r2, r3
dp3 o6.y, r2, r4
dp3 o5.z, v2, r3
dp3 o5.x, v1, r3
dp3 o6.z, v2, r4
dp3 o6.x, v1, r4
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.zw, v3.xyxy, c33.xyxy, c33
mad o1.xy, v3, c32, c32.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * -((((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_1.xyz;
  tmpvar_13[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_13[2] = tmpvar_2;
  mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_13[0].x;
  tmpvar_14[0].y = tmpvar_13[1].x;
  tmpvar_14[0].z = tmpvar_13[2].x;
  tmpvar_14[1].x = tmpvar_13[0].y;
  tmpvar_14[1].y = tmpvar_13[1].y;
  tmpvar_14[1].z = tmpvar_13[2].y;
  tmpvar_14[2].x = tmpvar_13[0].z;
  tmpvar_14[2].y = tmpvar_13[1].z;
  tmpvar_14[2].z = tmpvar_13[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_14 * v_i0_i1.xyz);
  tmpvar_15.w = tmpvar_12.x;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_14 * v_i0_i1_i2.xyz);
  tmpvar_17.w = tmpvar_12.y;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (tmpvar_14 * v_i0_i1_i2_i3.xyz);
  tmpvar_19.w = tmpvar_12.z;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * unity_Scale.w);
  tmpvar_6 = tmpvar_20;
  mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_22;
  mediump vec3 tmpvar_26;
  mediump vec4 normal;
  normal = tmpvar_25;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAr, normal);
  x1.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHAg, normal);
  x1.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHAb, normal);
  x1.z = tmpvar_29;
  mediump vec4 tmpvar_30;
  tmpvar_30 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBr, tmpvar_30);
  x2.x = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (unity_SHBg, tmpvar_30);
  x2.y = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = dot (unity_SHBb, tmpvar_30);
  x2.z = tmpvar_33;
  mediump float tmpvar_34;
  tmpvar_34 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_34;
  highp vec3 tmpvar_35;
  tmpvar_35 = (unity_SHC.xyz * vC);
  x3 = tmpvar_35;
  tmpvar_26 = ((x1 + x2) + x3);
  shlight = tmpvar_26;
  tmpvar_8 = shlight;
  highp vec3 tmpvar_36;
  tmpvar_36 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosX0 - tmpvar_36.x);
  highp vec4 tmpvar_38;
  tmpvar_38 = (unity_4LightPosY0 - tmpvar_36.y);
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosZ0 - tmpvar_36.z);
  highp vec4 tmpvar_40;
  tmpvar_40 = (((tmpvar_37 * tmpvar_37) + (tmpvar_38 * tmpvar_38)) + (tmpvar_39 * tmpvar_39));
  highp vec4 tmpvar_41;
  tmpvar_41 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_37 * tmpvar_22.x) + (tmpvar_38 * tmpvar_22.y)) + (tmpvar_39 * tmpvar_22.z)) * inversesqrt (tmpvar_40))) * 1.0/((1.0 + (tmpvar_40 * unity_4LightAtten0))));
  highp vec3 tmpvar_42;
  tmpvar_42 = (tmpvar_8 + ((((unity_LightColor0 * tmpvar_41.x) + (unity_LightColor1 * tmpvar_41.y)) + (unity_LightColor2 * tmpvar_41.z)) + (unity_LightColor3 * tmpvar_41.w)));
  tmpvar_8 = tmpvar_42;
  highp vec4 o_i0;
  highp vec4 tmpvar_43;
  tmpvar_43 = (tmpvar_9 * 0.5);
  o_i0 = tmpvar_43;
  highp vec2 tmpvar_44;
  tmpvar_44.x = tmpvar_43.x;
  tmpvar_44.y = (tmpvar_43.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_44 + tmpvar_43.w);
  o_i0.zw = tmpvar_9.zw;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (tmpvar_14 * (((_World2Object * tmpvar_24).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying lowp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Reflection + tmpvar_20) * tmpvar_11.z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_21);
  float tmpvar_22;
  tmpvar_22 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp float tmpvar_23;
  tmpvar_23 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp vec3 tmpvar_24;
  tmpvar_24 = mix (CubeTex, (CubeTex * tmpvar_19.xyz), vec3(((1.0 - (tmpvar_22 * tmpvar_22)) * _Metalics)));
  lowp float tmpvar_25;
  tmpvar_25 = tmpvar_19.w;
  lowp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_19.xyz * (1.0 - clamp (tmpvar_21, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_25 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lowp float tmpvar_27;
  tmpvar_27 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7).x;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize (xlv_TEXCOORD4);
  lowp vec3 viewDir;
  viewDir = tmpvar_28;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_29;
  tmpvar_29 = dot (tmpvar_13, xlv_TEXCOORD5);
  lowp float tmpvar_30;
  tmpvar_30 = max (tmpvar_29, (abs (tmpvar_29) * (1.0 - tmpvar_25)));
  lowp float tmpvar_31;
  tmpvar_31 = dot (tmpvar_13, normalize ((xlv_TEXCOORD5 + viewDir)));
  nh = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = max (0.0, nh);
  nh = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (pow (tmpvar_32, (tmpvar_12 * 128.0)) * tmpvar_23);
  mediump vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_26 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (tmpvar_27 * 2.0));
  c_i0_i1.xyz = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = (tmpvar_25 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * tmpvar_27));
  c_i0_i1.w = tmpvar_35;
  c = c_i0_i1;
  c.xyz = (c_i0_i1.xyz + (tmpvar_26 * xlv_TEXCOORD6));
  c.xyz = (c.xyz + tmpvar_24);
  c.w = tmpvar_25;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 46 to 74, TEX: 4 to 6
//   d3d9 - ALU: 50 to 76, TEX: 6 to 8
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Metalics]
Float 9 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 72 ALU, 4 TEX
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R2.xy, R0.wyzw, c[10].x, -c[10].y;
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[10].y;
RSQ R0.x, R0.x;
RCP R2.z, R0.x;
DP3 R1.x, fragment.texcoord[1], R2;
DP3 R1.y, R2, fragment.texcoord[2];
DP3 R1.z, R2, fragment.texcoord[3];
TEX R5.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R3.xyz, R1, R0.w;
MAD R0.xyz, -R3, c[10].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.w, R0, R1;
ABS R0.w, R0;
ADD R0.w, -R0, c[10].y;
POW R0.w, R0.w, c[7].x;
MUL R2.w, R0, c[6].x;
ADD R0.w, R2, c[5].x;
MUL R0.w, R0, R5.z;
MOV_SAT R1.x, R0.w;
TEX R0.xyz, R0, texture[3], CUBE;
MUL R3.xyz, R0.w, R0;
DP3_SAT R3.w, R3, c[11];
TEX R0, fragment.texcoord[0], texture[2], 2D;
ADD R4.x, -R1, c[10].y;
MUL R1, R0, c[2];
MUL R0.xyz, R1, R4.x;
MAD R0.w, -R3, R3, c[10].y;
MAD R1.xyz, R1, R3, -R3;
MUL R0.w, R0, c[8].x;
MAD R4.xyz, R0.w, R1, R3;
MUL R0.w, R2, R5.y;
DP3 R2.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R3.xyz, R0, fragment.texcoord[6];
MUL R1.xyz, R0, c[0];
RSQ R2.w, R2.w;
MOV R0.xyz, fragment.texcoord[5];
MAD R0.xyz, R2.w, fragment.texcoord[4], R0;
DP3 R3.w, R0, R0;
RSQ R3.w, R3.w;
MUL R0.xyz, R3.w, R0;
DP3 R0.x, R2, R0;
MUL R2.w, R5.x, R5.x;
MUL R2.w, R5.x, R2;
MUL R2.w, R2, c[3].x;
MUL R0.y, R2.w, c[10].w;
MAX R0.x, R0, c[10].z;
MAD R0.w, R5.y, c[4].x, R0;
POW R0.x, R0.x, R0.y;
MUL R2.w, R0.x, R0;
DP3 R0.w, R2, fragment.texcoord[5];
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
ABS R2.x, R0.w;
ADD R3.w, -R1, c[10].y;
MUL R2.x, R2, R3.w;
MUL R0.xyz, R0, R2.w;
MAX R0.w, R0, R2.x;
MAD R0.xyz, R1, R0.w, R0;
MAD R0.xyz, R0, c[10].x, R3;
ADD result.color.xyz, R0, R4;
SLT R0.x, R1.w, c[9];
MOV result.color.w, R1;
KIL -R0.x;
END
# 72 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Metalics]
Float 9 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
"ps_3_0
; 75 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c10, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c11, 128.00000000, 6.00000000, 0, 0
def c12, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
texld r5.xyz, v0.zwzw, s0
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c10.z, c10.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c10.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mov r2.x, v1.w
mov r2.z, v3.w
mov r2.y, v2.w
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
mad r2.xyz, -r3, c10.z, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3_pp r0.x, r2, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c10.y
pow_pp r0, r1.w, c7.x
mul_pp r2.w, r5.x, r5.x
mul_pp r0.y, r5.x, r2.w
mul_pp r0.w, r0.y, c3.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.y, -r0.w, c10
mul_pp r2.w, r0.y, c11.y
add_pp r3.x, r1.w, c5
texldl r0.xyz, r2, s3
mul_pp r3.w, r3.x, r5.z
mul_pp r0.xyz, r3.w, r0
dp3_pp_sat r3.x, r0, c12
mad_pp r4.x, -r3, r3, c10.y
texld r2, v0, s2
mul_pp r2, r2, c2
mad_pp r3.xyz, r2, r0, -r0
mul_pp r4.x, r4, c8
mad_pp r4.xyz, r4.x, r3, r0
dp3_pp r3.x, v4, v4
rsq_pp r3.x, r3.x
mov_pp r0.xyz, v5
mad_pp r0.xyz, r3.x, v4, r0
mov_pp_sat r3.x, r3.w
add_pp r3.y, -r3.x, c10
dp3_pp r3.z, r0, r0
rsq_pp r3.x, r3.z
mul_pp r0.xyz, r3.x, r0
dp3_pp r0.x, r1, r0
mul_pp r2.xyz, r2, r3.y
max_pp r3.w, r0.x, c10.x
mul_pp r4.w, r0, c11.x
pow_pp r0, r3.w, r4.w
mul_pp r0.y, r1.w, r5
dp3_pp r0.w, r1, v5
mad_pp r0.y, r5, c4.x, r0
mul_pp r1.w, r0.x, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
abs_pp r1.x, r0.w
add_pp r3.w, -r2, c10.y
mul_pp r1.x, r1, r3.w
max_pp r0.w, r0, r1.x
mul_pp r3.xyz, r2, c0
mul_pp r0.xyz, r0, r1.w
mad_pp r0.xyz, r3, r0.w, r0
add_pp r0.w, r2, -c9.x
mul_pp r1.xyz, r2, v6
mad_pp r1.xyz, r0, c10.z, r1
cmp r0.w, r0, c10.x, c10.y
mov_pp r0, -r0.w
add_pp oC0.xyz, r1, r4
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 46 ALU, 5 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R1.xy, R0.wyzw, c[6].x, -c[6].y;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R1.z, R0.x;
DP3 R0.y, R1, fragment.texcoord[2];
DP3 R0.z, R1, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R1;
MOV R1.x, fragment.texcoord[1].w;
MOV R1.z, fragment.texcoord[3].w;
MOV R1.y, fragment.texcoord[2].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
MOV R0.y, c[1].x;
POW R0.x, R0.x, c[3].x;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MAD R0.x, R0, c[2], R0.y;
MUL R1.w, R0.x, R0.z;
TEX R0.xyz, R1, texture[3], CUBE;
MUL R0.xyz, R1.w, R0;
MOV_SAT R0.w, R1;
DP3_SAT R2.x, R0, c[7];
MAD R2.w, -R2.x, R2.x, c[6].y;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[0];
MAD R2.xyz, R1, R0, -R0;
MUL R2.w, R2, c[4].x;
MAD R2.xyz, R2.w, R2, R0;
ADD R2.w, -R0, c[6].y;
TEX R0, fragment.texcoord[5], texture[4], 2D;
MUL R1.xyz, R1, R2.w;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[6].z, R2;
SLT R0.x, R1.w, c[5];
MOV result.color.w, R1;
KIL -R0.x;
END
# 46 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Vector 0 [_Color]
Float 1 [_Shininess]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [unity_Lightmap] 2D
"ps_3_0
; 50 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 6.00000000, 0.21997070, 0.70703125, 0.07098389
def c9, 8.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord5 v4.xy
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c7.z, c7.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c7.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mov r1.x, v1.w
mov r1.z, v3.w
mov r1.y, v2.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c7.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c7.y
pow_pp r0, r1.w, c4.x
mov_pp r0.w, r0.x
texld r0.xz, v0.zwzw, s0
mul_pp r1.w, r0.x, r0.x
mov_pp r0.y, c2.x
mad_pp r0.w, r0, c3.x, r0.y
mul_pp r2.x, r0.w, r0.z
mov_pp_sat r0.w, r2.x
mul_pp r0.x, r0, r1.w
mov_pp r0.y, c7
mad_pp r0.x, -r0, c1, r0.y
mul_pp r1.w, r0.x, c8.x
texldl r0.xyz, r1, s3
mul_pp r0.xyz, r2.x, r0
dp3_pp_sat r2.x, r0, c8.yzww
mad_pp r2.w, -r2.x, r2.x, c7.y
texld r1, v0, s2
mul_pp r1, r1, c0
mad_pp r2.xyz, r1, r0, -r0
add_pp r0.w, -r0, c7.y
mul_pp r2.w, r2, c5.x
mad_pp r2.xyz, r2.w, r2, r0
mul_pp r1.xyz, r1, r0.w
texld r0, v4, s4
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r0, r1
add_pp r2.w, r1, -c6.x
cmp r2.w, r2, c7.x, c7.y
mov_pp r0, -r2.w
mad_pp oC0.xyz, r1, c9.x, r2
texkill r0.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Metalics]
Float 9 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 74 ALU, 5 TEX
PARAM c[12] = { program.local[0..9],
		{ 2, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R2.xy, R0.wyzw, c[10].x, -c[10].y;
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[10].y;
RSQ R0.x, R0.x;
RCP R2.z, R0.x;
DP3 R1.x, fragment.texcoord[1], R2;
DP3 R1.y, R2, fragment.texcoord[2];
DP3 R1.z, R2, fragment.texcoord[3];
TEX R5.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R3.xyz, R1, R0.w;
MAD R0.xyz, -R3, c[10].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.w, R0, R1;
ABS R0.w, R0;
ADD R0.w, -R0, c[10].y;
POW R0.w, R0.w, c[7].x;
MUL R2.w, R0, c[6].x;
ADD R0.w, R2, c[5].x;
MUL R0.w, R0, R5.z;
MOV_SAT R1.x, R0.w;
TEX R0.xyz, R0, texture[3], CUBE;
MUL R3.xyz, R0.w, R0;
DP3_SAT R3.w, R3, c[11];
TEX R0, fragment.texcoord[0], texture[2], 2D;
ADD R4.x, -R1, c[10].y;
MUL R1, R0, c[2];
MUL R0.xyz, R1, R4.x;
MAD R0.w, -R3, R3, c[10].y;
MAD R1.xyz, R1, R3, -R3;
MUL R0.w, R0, c[8].x;
MAD R4.xyz, R0.w, R1, R3;
MUL R0.w, R2, R5.y;
MUL R1.xyz, R0, c[0];
DP3 R2.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R2.w, R2.w;
MOV R3.xyz, fragment.texcoord[5];
MAD R3.xyz, R2.w, fragment.texcoord[4], R3;
DP3 R3.w, R3, R3;
RSQ R3.w, R3.w;
MUL R2.w, R5.x, R5.x;
MUL R3.xyz, R3.w, R3;
MUL R2.w, R5.x, R2;
MUL R3.w, R2, c[3].x;
DP3 R2.w, R2, R3;
MAD R0.w, R5.y, c[4].x, R0;
MUL R3.x, R3.w, c[10].w;
MAX R2.w, R2, c[10].z;
POW R2.w, R2.w, R3.x;
MUL R3.x, R2.w, R0.w;
DP3 R0.w, R2, fragment.texcoord[5];
MOV R2.xyz, c[1];
MUL R2.xyz, R2, c[0];
ABS R2.w, R0;
ADD R3.y, -R1.w, c[10];
MUL R2.w, R2, R3.y;
MUL R2.xyz, R2, R3.x;
MAX R0.w, R0, R2;
MAD R1.xyz, R1, R0.w, R2;
TXP R2.x, fragment.texcoord[7], texture[4], 2D;
MUL R0.xyz, R0, fragment.texcoord[6];
MUL R1.xyz, R2.x, R1;
MAD R0.xyz, R1, c[10].x, R0;
ADD result.color.xyz, R0, R4;
SLT R0.x, R1.w, c[9];
MOV result.color.w, R1;
KIL -R0.x;
END
# 74 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Metalics]
Float 9 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
"ps_3_0
; 76 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c10, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c11, 128.00000000, 6.00000000, 0, 0
def c12, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
dcl_texcoord7 v7
texld r5.xyz, v0.zwzw, s0
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c10.z, c10.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c10.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mov r2.x, v1.w
mov r2.z, v3.w
mov r2.y, v2.w
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
mad r2.xyz, -r3, c10.z, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3_pp r0.x, r2, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c10.y
pow_pp r0, r1.w, c7.x
mul_pp r2.w, r5.x, r5.x
mul_pp r0.y, r5.x, r2.w
mul_pp r0.w, r0.y, c3.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.y, -r0.w, c10
mul_pp r2.w, r0.y, c11.y
add_pp r3.x, r1.w, c5
texldl r0.xyz, r2, s3
mul_pp r3.w, r3.x, r5.z
mul_pp r0.xyz, r3.w, r0
dp3_pp_sat r3.x, r0, c12
mad_pp r4.x, -r3, r3, c10.y
texld r2, v0, s2
mul_pp r2, r2, c2
mad_pp r3.xyz, r2, r0, -r0
mul_pp r4.x, r4, c8
mad_pp r4.xyz, r4.x, r3, r0
dp3_pp r3.x, v4, v4
rsq_pp r3.x, r3.x
mov_pp r0.xyz, v5
mad_pp r0.xyz, r3.x, v4, r0
mov_pp_sat r3.x, r3.w
add_pp r3.y, -r3.x, c10
dp3_pp r3.z, r0, r0
rsq_pp r3.x, r3.z
mul_pp r0.xyz, r3.x, r0
dp3_pp r0.x, r1, r0
mul_pp r2.xyz, r2, r3.y
max_pp r3.w, r0.x, c10.x
mul_pp r4.w, r0, c11.x
pow_pp r0, r3.w, r4.w
mul_pp r0.y, r1.w, r5
dp3_pp r0.w, r1, v5
mad_pp r0.y, r5, c4.x, r0
mul_pp r1.w, r0.x, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
abs_pp r1.x, r0.w
add_pp r3.w, -r2, c10.y
mul_pp r1.x, r1, r3.w
max_pp r0.w, r0, r1.x
texldp r1.x, v7, s4
mul_pp r3.xyz, r2, c0
mul_pp r0.xyz, r0, r1.w
mad_pp r0.xyz, r3, r0.w, r0
mul_pp r0.xyz, r1.x, r0
add_pp r0.w, r2, -c9.x
mul_pp r1.xyz, r2, v6
mad_pp r1.xyz, r0, c10.z, r1
cmp r0.w, r0, c10.x, c10.y
mov_pp r0, -r0.w
add_pp oC0.xyz, r1, r4
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
SetTexture 5 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 49 ALU, 6 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R1.xy, R0.wyzw, c[6].x, -c[6].y;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R1.z, R0.x;
DP3 R0.y, R1, fragment.texcoord[2];
DP3 R0.z, R1, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R1;
MOV R1.x, fragment.texcoord[1].w;
MOV R1.z, fragment.texcoord[3].w;
MOV R1.y, fragment.texcoord[2].w;
DP3 R0.w, R0, R1;
MUL R2.xyz, R0, R0.w;
MAD R1.xyz, -R2, c[6].x, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.x, R1, R0;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
MOV R0.y, c[1].x;
POW R0.x, R0.x, c[3].x;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MAD R0.x, R0, c[2], R0.y;
MUL R0.w, R0.x, R0.z;
MOV_SAT R1.w, R0;
TEX R0.xyz, R1, texture[3], CUBE;
MUL R0.xyz, R0.w, R0;
DP3_SAT R0.w, R0, c[7];
ADD R3.x, -R1.w, c[6].y;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R2, R1, c[0];
MAD R1.xyz, R2, R0, -R0;
MAD R0.w, -R0, R0, c[6].y;
MUL R0.w, R0, c[4].x;
MAD R0.yzw, R0.w, R1.xxyz, R0.xxyz;
TEX R1, fragment.texcoord[5], texture[5], 2D;
TXP R0.x, fragment.texcoord[7], texture[4], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.x, R0, c[6];
MUL R1.xyz, R1, c[6].z;
MIN R1.xyz, R1, R0.x;
MUL R2.xyz, R2, R3.x;
SLT R0.x, R2.w, c[5];
MAD result.color.xyz, R2, R1, R0.yzww;
MOV result.color.w, R2;
KIL -R0.x;
END
# 49 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Vector 0 [_Color]
Float 1 [_Shininess]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
SetTexture 5 [unity_Lightmap] 2D
"ps_3_0
; 52 ALU, 8 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 8.00000000, 6.00000000, 0, 0
def c9, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord5 v4.xy
dcl_texcoord7 v5
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c7.z, c7.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c7.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mov r1.x, v1.w
mov r1.z, v3.w
mov r1.y, v2.w
dp3 r0.w, r0, r1
mul r2.xyz, r0, r0.w
mad r1.xyz, -r2, c7.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3_pp r0.x, r1, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c7.y
pow_pp r0, r1.w, c4.x
texld r2.xz, v0.zwzw, s0
mov_pp r0.y, r0.x
mul_pp r0.z, r2.x, r2.x
mov_pp r0.x, c7.y
mul_pp r0.z, r2.x, r0
mad_pp r0.z, -r0, c1.x, r0.x
mov_pp r0.x, c2
mad_pp r0.w, r0.y, c3.x, r0.x
mul_pp r1.w, r0.z, c8.y
texldl r0.xyz, r1, s3
mul_pp r0.w, r0, r2.z
mul_pp r0.xyz, r0.w, r0
texld r1, v0, s2
mul_pp r2, r1, c0
dp3_pp_sat r3.x, r0, c9
mad_pp r1.w, -r3.x, r3.x, c7.y
mad_pp r1.xyz, r2, r0, -r0
mul_pp r1.w, r1, c5.x
mad_pp r3.xyz, r1.w, r1, r0
mov_pp_sat r0.y, r0.w
add_pp r0.y, -r0, c7
add_pp r0.x, r2.w, -c6
cmp r0.x, r0, c7, c7.y
mov_pp r1, -r0.x
mul_pp r2.xyz, r2, r0.y
texld r0, v4, s5
mul_pp r0.xyz, r0.w, r0
texldp r4.x, v5, s4
mul_pp r0.w, r4.x, c7.z
mul_pp r0.xyz, r0, c8.x
min_pp r0.xyz, r0, r0.w
mad_pp oC0.xyz, r2, r0, r3
texkill r1.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 5
//   opengl - ALU: 41 to 50
//   d3d9 - ALU: 44 to 53
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 49 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 49 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_3_0
; 52 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.w, c21.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o2, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o3, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o6.y, r2, r3
mul o4, r1, c16.w
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_8 = tmpvar_22;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_19.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_19.xyz * (1.0 - clamp (((_Reflection + tmpvar_20) * tmpvar_11.z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = normalize (xlv_TEXCOORD5);
  highp vec2 tmpvar_26;
  tmpvar_26 = vec2(dot (xlv_TEXCOORD6, xlv_TEXCOORD6));
  lowp vec3 viewDir;
  viewDir = tmpvar_25;
  lowp float atten;
  atten = texture2D (_LightTexture0, tmpvar_26).w;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_13, lightDir);
  lowp float tmpvar_28;
  tmpvar_28 = max (tmpvar_27, (abs (tmpvar_27) * (1.0 - tmpvar_22)));
  lowp float tmpvar_29;
  tmpvar_29 = dot (tmpvar_13, normalize ((lightDir + viewDir)));
  nh = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, nh);
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = (pow (tmpvar_30, (tmpvar_12 * 128.0)) * tmpvar_21);
  mediump vec3 tmpvar_32;
  tmpvar_32 = ((((tmpvar_23 * _LightColor0.xyz) * tmpvar_28) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_31)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (tmpvar_22 + (((_LightColor0.w * _SpecColor.w) * tmpvar_31) * atten));
  c_i0_i1.w = tmpvar_33;
  c = c_i0_i1;
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [_MainTex_ST]
Vector 17 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 41 ALU
PARAM c[18] = { { 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[14];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[13].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
DP3 result.texcoord[5].y, R2, R3;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 41 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_3_0
; 44 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c17.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c12.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r2, r4
dp3 o6.y, r2, r3
mul o4, r0, c12.w
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_8 = tmpvar_22;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_19.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_19.xyz * (1.0 - clamp (((_Reflection + tmpvar_20) * tmpvar_11.z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD4;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize (xlv_TEXCOORD5);
  lowp vec3 viewDir;
  viewDir = tmpvar_24;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_25;
  tmpvar_25 = dot (tmpvar_13, lightDir);
  lowp float tmpvar_26;
  tmpvar_26 = max (tmpvar_25, (abs (tmpvar_25) * (1.0 - tmpvar_22)));
  lowp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_13, normalize ((lightDir + viewDir)));
  nh = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, nh);
  nh = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (pow (tmpvar_28, (tmpvar_12 * 128.0)) * tmpvar_21);
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_23 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_i0_i1.xyz = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = (tmpvar_22 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_i0_i1.w = tmpvar_31;
  c = c_i0_i1;
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 50 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
DP4 result.texcoord[6].w, R0, c[16];
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 50 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_3_0
; 53 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.w, c21.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp4 r0.w, v0, c7
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o2, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o3, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o6.y, r2, r3
mul o4, r1, c16.w
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o7.w, r0, c15
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_8 = tmpvar_22;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_19.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_19.xyz * (1.0 - clamp (((_Reflection + tmpvar_20) * tmpvar_11.z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = normalize (xlv_TEXCOORD5);
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD6.xyz;
  highp vec2 tmpvar_26;
  tmpvar_26 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec3 viewDir;
  viewDir = tmpvar_25;
  lowp float atten;
  atten = ((float((xlv_TEXCOORD6.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD6.xy / xlv_TEXCOORD6.w) + 0.5)).w) * texture2D (_LightTextureB0, tmpvar_26).w);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_13, lightDir);
  lowp float tmpvar_28;
  tmpvar_28 = max (tmpvar_27, (abs (tmpvar_27) * (1.0 - tmpvar_22)));
  lowp float tmpvar_29;
  tmpvar_29 = dot (tmpvar_13, normalize ((lightDir + viewDir)));
  nh = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, nh);
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = (pow (tmpvar_30, (tmpvar_12 * 128.0)) * tmpvar_21);
  mediump vec3 tmpvar_32;
  tmpvar_32 = ((((tmpvar_23 * _LightColor0.xyz) * tmpvar_28) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_31)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (tmpvar_22 + (((_LightColor0.w * _SpecColor.w) * tmpvar_31) * atten));
  c_i0_i1.w = tmpvar_33;
  c = c_i0_i1;
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 49 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
MAD R2.xyz, R0, c[17].w, -vertex.position;
MOV R1.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R3;
MOV R0, c[19];
MUL R1.xyz, vertex.attrib[14].w, R1;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
DP4 result.texcoord[6].z, R0, c[15];
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 49 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_3_0
; 52 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.w, c21.x
mov r1.xyz, c17
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r3.xyz, r0, c16.w, -v0
mov r1.xyz, v1
mov r0, c10
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r4.x, c18, r1
mul r2.xyz, v1.w, r2
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mad r0.xyz, r4, c16.w, -v0
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 r1.y, r2, c4
dp3 r1.w, -r3, c4
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o2, r1, c16.w
dp3 r1.y, r2, c5
dp3 r1.w, -r3, c5
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
mul o3, r1, c16.w
dp3 r1.y, r2, c6
dp3 r1.w, -r3, c6
dp3 r1.x, v1, c6
dp3 r1.z, v2, c6
dp3 o6.y, r2, r3
mul o4, r1, c16.w
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o7.z, r0, c14
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_8 = tmpvar_22;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_19.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_19.xyz * (1.0 - clamp (((_Reflection + tmpvar_20) * tmpvar_11.z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = normalize (xlv_TEXCOORD5);
  highp vec2 tmpvar_26;
  tmpvar_26 = vec2(dot (xlv_TEXCOORD6, xlv_TEXCOORD6));
  lowp vec3 viewDir;
  viewDir = tmpvar_25;
  lowp float atten;
  atten = (texture2D (_LightTextureB0, tmpvar_26).w * textureCube (_LightTexture0, xlv_TEXCOORD6).w);
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_13, lightDir);
  lowp float tmpvar_28;
  tmpvar_28 = max (tmpvar_27, (abs (tmpvar_27) * (1.0 - tmpvar_22)));
  lowp float tmpvar_29;
  tmpvar_29 = dot (tmpvar_13, normalize ((lightDir + viewDir)));
  nh = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, nh);
  nh = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = (pow (tmpvar_30, (tmpvar_12 * 128.0)) * tmpvar_21);
  mediump vec3 tmpvar_32;
  tmpvar_32 = ((((tmpvar_23 * _LightColor0.xyz) * tmpvar_28) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_31)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = (tmpvar_22 + (((_LightColor0.w * _SpecColor.w) * tmpvar_31) * atten));
  c_i0_i1.w = tmpvar_33;
  c = c_i0_i1;
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"3.0-!!ARBvp1.0
# 47 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[19];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R2, R1;
DP3 result.texcoord[5].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP3 result.texcoord[5].z, vertex.normal, R3;
DP3 result.texcoord[5].x, vertex.attrib[14], R3;
DP4 result.texcoord[6].y, R0, c[14];
DP4 result.texcoord[6].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_3_0
; 50 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c21.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2, r0, c16.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3, r0, c16.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o5.y, r2, r4
dp3 o6.y, r2, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o6.z, v2, r3
dp3 o6.x, v1, r3
dp4 o7.y, r0, c13
dp4 o7.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (((_World2Object * tmpvar_21).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_8 = tmpvar_22;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform mediump float _Shininess;
uniform lowp float _Reflection;
uniform lowp float _Gloss;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).xyz;
  mediump float tmpvar_12;
  tmpvar_12 = (_Shininess * ((tmpvar_11.x * tmpvar_11.x) * tmpvar_11.x));
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_13);
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (reflect (tmpvar_1, tmpvar_14));
  worldRefl = tmpvar_15;
  mediump vec3 tmpvar_16;
  tmpvar_16.x = dot (tmpvar_2, tmpvar_13);
  tmpvar_16.y = dot (tmpvar_3, tmpvar_13);
  tmpvar_16.z = dot (tmpvar_4, tmpvar_13);
  worldNormal = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_18;
  tmpvar_18 = pow ((1.0 - tmpvar_17), _FrezFalloff);
  frez = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_20;
  tmpvar_20 = (frez * _FrezPow);
  frez = tmpvar_20;
  lowp float tmpvar_21;
  tmpvar_21 = ((_Gloss * tmpvar_11.y) + (tmpvar_20 * tmpvar_11.y));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_19.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_19.xyz * (1.0 - clamp (((_Reflection + tmpvar_20) * tmpvar_11.z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD4;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize (xlv_TEXCOORD5);
  lowp vec3 viewDir;
  viewDir = tmpvar_24;
  lowp float atten;
  atten = texture2D (_LightTexture0, xlv_TEXCOORD6).w;
  lowp vec4 c_i0_i1;
  mediump float nh;
  lowp float tmpvar_25;
  tmpvar_25 = dot (tmpvar_13, lightDir);
  lowp float tmpvar_26;
  tmpvar_26 = max (tmpvar_25, (abs (tmpvar_25) * (1.0 - tmpvar_22)));
  lowp float tmpvar_27;
  tmpvar_27 = dot (tmpvar_13, normalize ((lightDir + viewDir)));
  nh = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, nh);
  nh = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = (pow (tmpvar_28, (tmpvar_12 * 128.0)) * tmpvar_21);
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_23 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * (atten * 2.0));
  c_i0_i1.xyz = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = (tmpvar_22 + (((_LightColor0.w * _SpecColor.w) * tmpvar_29) * atten));
  c_i0_i1.w = tmpvar_31;
  c = c_i0_i1;
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 5
//   opengl - ALU: 62 to 73, TEX: 3 to 5
//   d3d9 - ALU: 65 to 73, TEX: 4 to 6
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 67 ALU, 4 TEX
PARAM c[10] = { program.local[0..8],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.xy, R0.wyzw, c[9].x, -c[9].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[9].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[1], R0;
DP3 R1.y, R0, fragment.texcoord[2];
DP3 R1.z, R0, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R2;
MUL R3.xyz, R1, R0.w;
MAD R2.xyz, -R3, c[9].x, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R1;
ABS R0.w, R0;
ADD R0.w, -R0, c[9].y;
POW R0.w, R0.w, c[7].x;
MUL R0.w, R0, c[6].x;
DP3 R3.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
ADD R1.x, R0.w, c[5];
MUL_SAT R2.z, R1.x, R2;
MUL R0.w, R0, R2.y;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[2];
ADD R2.z, -R2, c[9].y;
MUL R1.xyz, R1, R2.z;
DP3 R2.z, fragment.texcoord[4], fragment.texcoord[4];
MAD R0.w, R2.y, c[4].x, R0;
RSQ R2.y, R2.z;
MUL R2.yzw, R2.y, fragment.texcoord[4].xxyz;
RSQ R3.x, R3.x;
MAD R3.xyz, R3.x, fragment.texcoord[5], R2.yzww;
DP3 R2.w, R0, R2.yzww;
DP3 R2.z, R3, R3;
MUL R2.y, R2.x, R2.x;
MUL R3.w, R2.x, R2.y;
RSQ R2.z, R2.z;
MUL R2.xyz, R2.z, R3;
DP3 R0.y, R0, R2;
MUL R3.x, R3.w, c[3];
MAX R0.y, R0, c[9].z;
MUL R0.x, R3, c[9].w;
POW R0.x, R0.y, R0.x;
MUL R0.w, R0.x, R0;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
MUL R1.xyz, R1, c[0];
ABS R2.y, R2.w;
ADD R2.x, -R1.w, c[9].y;
MUL R2.x, R2.y, R2;
MAX R0.w, R2, R2.x;
MAD R0.xyz, R1, R0.w, R0;
DP3 R2.x, fragment.texcoord[6], fragment.texcoord[6];
TEX R0.w, R2.x, texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].x;
SLT R0.x, R1.w, c[8];
MOV result.color.w, R1;
KIL -R0.x;
END
# 67 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_3_0
; 68 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c9, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c10, 128.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
texld r4.xyz, v0.zwzw, s0
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c9.z, c9.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
mul_pp r3.w, r4.x, r4.x
add_pp r0.x, r0, c9.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mul_pp r3.w, r4.x, r3
mov r2.x, v1.w
mov r2.z, v3.w
mov r2.y, v2.w
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
mad r2.xyz, -r3, c9.z, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3_pp r0.x, r2, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c9.y
pow_pp r0, r1.w, c7.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.x, r1.w, c5
mul_pp_sat r2.x, r0, r4.z
texld r0, v0, s2
add_pp r3.x, -r2, c9.y
mul_pp r2, r0, c2
mul_pp r0.xyz, r2, r3.x
mul_pp r2.xyz, r0, c0
dp3_pp r0.w, v4, v4
rsq_pp r0.x, r0.w
mul_pp r3.xyz, r0.x, v4
dp3_pp r0.y, v5, v5
rsq_pp r0.x, r0.y
mad_pp r0.xyz, r0.x, v5, r3
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r0.xyz, r0.w, r0
mul_pp r0.w, r3, c3.x
dp3_pp r0.x, r1, r0
mul_pp r1.w, r1, r4.y
mul_pp r4.x, r0.w, c10
max_pp r3.w, r0.x, c9.x
pow_pp r0, r3.w, r4.x
mad_pp r0.y, r4, c4.x, r1.w
dp3_pp r0.w, r1, r3
mul_pp r1.z, r0.x, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r1.z
abs_pp r1.x, r0.w
add_pp r1.y, -r2.w, c9
mul_pp r1.x, r1, r1.y
max_pp r0.w, r0, r1.x
mad_pp r1.xyz, r2, r0.w, r0
add_pp r0.y, r2.w, -c8.x
dp3 r0.x, v6, v6
texld r0.x, r0.x, s3
mul_pp r1.xyz, r0.x, r1
cmp r0.y, r0, c9.x, c9
mov_pp r0, -r0.y
mul_pp oC0.xyz, r1, c9.z
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 62 ALU, 3 TEX
PARAM c[10] = { program.local[0..8],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R2.xy, R0.wyzw, c[9].x, -c[9].y;
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[9].y;
RSQ R0.x, R0.x;
RCP R2.z, R0.x;
DP3 R1.x, fragment.texcoord[1], R2;
DP3 R1.y, R2, fragment.texcoord[2];
DP3 R1.z, R2, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R3.xyz, R1, R0.w;
MAD R0.xyz, -R3, c[9].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R0, R1;
ABS R0.x, R0;
ADD R0.x, -R0, c[9].y;
POW R0.x, R0.x, c[7].x;
MUL R0.w, R0.x, c[6].x;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
ADD R1.x, R0.w, c[5];
MUL_SAT R0.z, R1.x, R0;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[2];
ADD R0.z, -R0, c[9].y;
MUL R1.xyz, R1, R0.z;
MUL R0.z, R0.w, R0.y;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R0.w, R0.w;
MOV R3.xyz, fragment.texcoord[4];
MAD R3.xyz, R0.w, fragment.texcoord[5], R3;
MAD R0.w, R0.y, c[4].x, R0.z;
DP3 R0.y, R3, R3;
MUL R0.z, R0.x, R0.x;
MUL R2.w, R0.x, R0.z;
RSQ R0.y, R0.y;
MUL R0.xyz, R0.y, R3;
DP3 R0.x, R2, R0;
MUL R2.w, R2, c[3].x;
MUL R0.y, R2.w, c[9].w;
MAX R0.x, R0, c[9].z;
POW R0.x, R0.x, R0.y;
MUL R2.w, R0.x, R0;
DP3 R0.w, R2, fragment.texcoord[4];
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
ABS R2.x, R0.w;
ADD R3.x, -R1.w, c[9].y;
MUL R2.x, R2, R3;
MUL R1.xyz, R1, c[0];
MUL R0.xyz, R0, R2.w;
MAX R0.w, R0, R2.x;
MAD R0.xyz, R1, R0.w, R0;
MUL result.color.xyz, R0, c[9].x;
SLT R0.x, R1.w, c[8];
MOV result.color.w, R1;
KIL -R0.x;
END
# 62 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
"ps_3_0
; 65 ALU, 4 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c9, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c10, 128.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c9.z, c9.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c9.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r2.x, v1, r1
dp3_pp r2.y, r1, v2
dp3_pp r2.z, r1, v3
mov r0.x, v1.w
mov r0.z, v3.w
mov r0.y, v2.w
dp3 r0.w, r2, r0
mul r3.xyz, r2, r0.w
mad r0.xyz, -r3, c9.z, r0
texld r3.xyz, v0.zwzw, s0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3_pp r0.x, r0, r2
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c9.y
pow_pp r0, r1.w, c7.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.x, r1.w, c5
mul_pp_sat r2.x, r0, r3.z
texld r0, v0, s2
add_pp r3.z, -r2.x, c9.y
mul_pp r2, r0, c2
mul_pp r2.xyz, r2, r3.z
dp3_pp r0.w, v5, v5
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v4
mad_pp r0.xyz, r0.w, v5, r0
dp3_pp r0.w, r0, r0
rsq_pp r3.z, r0.w
mul_pp r0.xyz, r3.z, r0
dp3_pp r0.x, r1, r0
dp3_pp r1.x, r1, v4
mul_pp r3.w, r3.x, r3.x
mul_pp r0.w, r3.x, r3
mul_pp r0.w, r0, c3.x
add_pp r1.z, -r2.w, c9.y
abs_pp r1.y, r1.x
mul_pp r1.y, r1, r1.z
mul_pp r2.xyz, r2, c0
mul_pp r3.z, r0.w, c10.x
max_pp r3.x, r0, c9
pow_pp r0, r3.x, r3.z
mul_pp r0.y, r1.w, r3
mad_pp r0.w, r3.y, c4.x, r0.y
mov_pp r1.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r1, r0
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
add_pp r0.w, r2, -c8.x
max_pp r1.x, r1, r1.y
mad_pp r1.xyz, r2, r1.x, r0
cmp r0.w, r0, c9.x, c9.y
mov_pp r0, -r0.w
mul_pp oC0.xyz, r1, c9.z
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 73 ALU, 5 TEX
PARAM c[11] = { program.local[0..8],
		{ 0, 0.5, 2, 1 },
		{ 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.xy, R0.wyzw, c[9].z, -c[9].w;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[9].w;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[1], R0;
DP3 R1.y, R0, fragment.texcoord[2];
DP3 R1.z, R0, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R2;
MUL R3.xyz, R1, R0.w;
MAD R2.xyz, -R3, c[9].z, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R1;
ABS R0.w, R0;
ADD R0.w, -R0, c[9];
POW R0.w, R0.w, c[7].x;
MUL R0.w, R0, c[6].x;
DP3 R3.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
ADD R1.x, R0.w, c[5];
MUL_SAT R2.z, R1.x, R2;
MUL R0.w, R0, R2.y;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[2];
ADD R2.z, -R2, c[9].w;
MUL R1.xyz, R1, R2.z;
MUL R1.xyz, R1, c[0];
DP3 R2.z, fragment.texcoord[4], fragment.texcoord[4];
MAD R0.w, R2.y, c[4].x, R0;
RSQ R2.y, R2.z;
MUL R2.yzw, R2.y, fragment.texcoord[4].xxyz;
RSQ R3.x, R3.x;
MAD R3.xyz, R3.x, fragment.texcoord[5], R2.yzww;
DP3 R2.w, R0, R2.yzww;
DP3 R2.z, R3, R3;
MUL R2.y, R2.x, R2.x;
MUL R3.w, R2.x, R2.y;
RSQ R2.z, R2.z;
MUL R2.xyz, R2.z, R3;
DP3 R0.y, R0, R2;
MUL R3.x, R3.w, c[3];
MAX R0.y, R0, c[9].x;
MUL R0.x, R3, c[10];
POW R0.x, R0.y, R0.x;
MUL R0.w, R0.x, R0;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
ABS R2.y, R2.w;
ADD R2.x, -R1.w, c[9].w;
MUL R2.x, R2.y, R2;
MAX R0.w, R2, R2.x;
MAD R0.xyz, R1, R0.w, R0;
RCP R2.x, fragment.texcoord[6].w;
MAD R1.xy, fragment.texcoord[6], R2.x, c[9].y;
TEX R2.w, R1, texture[3], 2D;
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
SLT R1.x, c[9], fragment.texcoord[6].z;
TEX R0.w, R0.w, texture[4], 2D;
MUL R1.x, R1, R2.w;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].z;
SLT R0.x, R1.w, c[8];
MOV result.color.w, R1;
KIL -R0.x;
END
# 73 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"ps_3_0
; 73 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c9, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c10, 2.00000000, -1.00000000, 128.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
texld r4.xyz, v0.zwzw, s0
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c10.x, c10.y
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
mul_pp r3.w, r4.x, r4.x
add_pp r0.x, r0, c9.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mul_pp r3.w, r4.x, r3
mov r2.x, v1.w
mov r2.z, v3.w
mov r2.y, v2.w
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
mad r2.xyz, -r3, c9.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3_pp r0.x, r2, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c9.y
pow_pp r0, r1.w, c7.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.x, r1.w, c5
mul_pp_sat r2.x, r0, r4.z
texld r0, v0, s2
add_pp r3.x, -r2, c9.y
mul_pp r2, r0, c2
mul_pp r0.xyz, r2, r3.x
mul_pp r2.xyz, r0, c0
dp3_pp r0.w, v4, v4
rsq_pp r0.x, r0.w
mul_pp r3.xyz, r0.x, v4
dp3_pp r0.y, v5, v5
rsq_pp r0.x, r0.y
mad_pp r0.xyz, r0.x, v5, r3
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r0.xyz, r0.w, r0
mul_pp r0.w, r3, c3.x
dp3_pp r0.x, r1, r0
mul_pp r1.w, r1, r4.y
mul_pp r4.x, r0.w, c10.z
max_pp r3.w, r0.x, c9.x
pow_pp r0, r3.w, r4.x
mad_pp r0.y, r4, c4.x, r1.w
dp3_pp r0.w, r1, r3
mul_pp r1.z, r0.x, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r1.z
abs_pp r1.x, r0.w
add_pp r1.y, -r2.w, c9
mul_pp r1.x, r1, r1.y
max_pp r0.w, r0, r1.x
mad_pp r2.xyz, r2, r0.w, r0
add_pp r0.x, r2.w, -c8
rcp r0.z, v6.w
mad r1.xy, v6, r0.z, c9.z
cmp r0.y, r0.x, c9.x, c9
dp3 r0.x, v6, v6
texld r0.w, r1, s3
cmp r0.z, -v6, c9.x, c9.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s4
mul_pp r0.x, r0.z, r0
mul_pp r1.xyz, r0.x, r2
mov_pp r0, -r0.y
mul_pp oC0.xyz, r1, c9.w
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 69 ALU, 5 TEX
PARAM c[10] = { program.local[0..8],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R0.xy, R0.wyzw, c[9].x, -c[9].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[9].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[1], R0;
DP3 R1.y, R0, fragment.texcoord[2];
DP3 R1.z, R0, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R2;
MUL R3.xyz, R1, R0.w;
MAD R2.xyz, -R3, c[9].x, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R1;
ABS R0.w, R0;
ADD R0.w, -R0, c[9].y;
POW R0.w, R0.w, c[7].x;
MUL R0.w, R0, c[6].x;
DP3 R3.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
ADD R1.x, R0.w, c[5];
MUL_SAT R2.z, R1.x, R2;
MUL R0.w, R0, R2.y;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[2];
ADD R2.z, -R2, c[9].y;
MUL R1.xyz, R1, R2.z;
MUL R1.xyz, R1, c[0];
DP3 R2.z, fragment.texcoord[4], fragment.texcoord[4];
MAD R0.w, R2.y, c[4].x, R0;
RSQ R2.y, R2.z;
MUL R2.yzw, R2.y, fragment.texcoord[4].xxyz;
RSQ R3.x, R3.x;
MAD R3.xyz, R3.x, fragment.texcoord[5], R2.yzww;
DP3 R2.w, R0, R2.yzww;
DP3 R2.z, R3, R3;
MUL R2.y, R2.x, R2.x;
MUL R3.w, R2.x, R2.y;
RSQ R2.z, R2.z;
MUL R2.xyz, R2.z, R3;
DP3 R0.y, R0, R2;
MUL R3.x, R3.w, c[3];
MAX R0.y, R0, c[9].z;
MUL R0.x, R3, c[9].w;
POW R0.x, R0.y, R0.x;
MUL R0.w, R0.x, R0;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R0.w;
ABS R2.y, R2.w;
ADD R2.x, -R1.w, c[9].y;
MUL R2.x, R2.y, R2;
MAX R0.w, R2, R2.x;
MAD R0.xyz, R1, R0.w, R0;
DP3 R1.x, fragment.texcoord[6], fragment.texcoord[6];
TEX R0.w, fragment.texcoord[6], texture[4], CUBE;
TEX R2.w, R1.x, texture[3], 2D;
MUL R0.w, R2, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].x;
SLT R0.x, R1.w, c[8];
MOV result.color.w, R1;
KIL -R0.x;
END
# 69 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"ps_3_0
; 69 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
def c9, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c10, 128.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
texld r4.xyz, v0.zwzw, s0
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c9.z, c9.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
mul_pp r3.w, r4.x, r4.x
add_pp r0.x, r0, c9.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.y, r1, v2
dp3_pp r0.z, r1, v3
dp3_pp r0.x, v1, r1
mul_pp r3.w, r4.x, r3
mov r2.x, v1.w
mov r2.z, v3.w
mov r2.y, v2.w
dp3 r0.w, r0, r2
mul r3.xyz, r0, r0.w
mad r2.xyz, -r3, c9.z, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3_pp r0.x, r2, r0
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c9.y
pow_pp r0, r1.w, c7.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.x, r1.w, c5
mul_pp_sat r2.x, r0, r4.z
texld r0, v0, s2
add_pp r3.x, -r2, c9.y
mul_pp r2, r0, c2
mul_pp r0.xyz, r2, r3.x
mul_pp r2.xyz, r0, c0
dp3_pp r0.w, v4, v4
rsq_pp r0.x, r0.w
mul_pp r3.xyz, r0.x, v4
dp3_pp r0.y, v5, v5
rsq_pp r0.x, r0.y
mad_pp r0.xyz, r0.x, v5, r3
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r0.xyz, r0.w, r0
mul_pp r0.w, r3, c3.x
dp3_pp r0.x, r1, r0
mul_pp r1.w, r1, r4.y
mul_pp r4.x, r0.w, c10
max_pp r3.w, r0.x, c9.x
pow_pp r0, r3.w, r4.x
mad_pp r0.y, r4, c4.x, r1.w
dp3_pp r0.w, r1, r3
mul_pp r1.z, r0.x, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r1.z
abs_pp r1.x, r0.w
add_pp r1.y, -r2.w, c9
mul_pp r1.x, r1, r1.y
max_pp r1.x, r0.w, r1
mad_pp r1.xyz, r2, r1.x, r0
add_pp r0.w, r2, -c8.x
cmp r0.y, r0.w, c9.x, c9
dp3 r0.x, v6, v6
texld r0.w, v6, s4
texld r0.x, r0.x, s3
mul r0.x, r0, r0.w
mul_pp r1.xyz, r0.x, r1
mov_pp r0, -r0.y
mul_pp oC0.xyz, r1, c9.z
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 64 ALU, 4 TEX
PARAM c[10] = { program.local[0..8],
		{ 2, 1, 0, 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MAD R2.xy, R0.wyzw, c[9].x, -c[9].y;
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[9].y;
RSQ R0.x, R0.x;
RCP R2.z, R0.x;
DP3 R1.x, fragment.texcoord[1], R2;
DP3 R1.y, R2, fragment.texcoord[2];
DP3 R1.z, R2, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R3.xyz, R1, R0.w;
MAD R0.xyz, -R3, c[9].x, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R0, R1;
ABS R0.x, R0;
ADD R0.x, -R0, c[9].y;
POW R0.x, R0.x, c[7].x;
MUL R0.w, R0.x, c[6].x;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
ADD R1.x, R0.w, c[5];
MUL_SAT R0.z, R1.x, R0;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MUL R1, R1, c[2];
ADD R0.z, -R0, c[9].y;
MUL R1.xyz, R1, R0.z;
MUL R0.z, R0.w, R0.y;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R0.w, R0.w;
MOV R3.xyz, fragment.texcoord[4];
MAD R3.xyz, R0.w, fragment.texcoord[5], R3;
MAD R0.w, R0.y, c[4].x, R0.z;
DP3 R0.y, R3, R3;
MUL R0.z, R0.x, R0.x;
MUL R2.w, R0.x, R0.z;
RSQ R0.y, R0.y;
MUL R0.xyz, R0.y, R3;
DP3 R0.x, R2, R0;
MUL R2.w, R2, c[3].x;
MUL R0.y, R2.w, c[9].w;
MAX R0.x, R0, c[9].z;
POW R0.x, R0.x, R0.y;
MUL R2.w, R0.x, R0;
DP3 R0.w, R2, fragment.texcoord[4];
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
ABS R2.x, R0.w;
ADD R3.x, -R1.w, c[9].y;
MUL R2.x, R2, R3;
MAX R0.w, R0, R2.x;
MUL R1.xyz, R1, c[0];
MUL R0.xyz, R0, R2.w;
MAD R0.xyz, R1, R0.w, R0;
TEX R0.w, fragment.texcoord[6], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[9].x;
SLT R0.x, R1.w, c[8];
MOV result.color.w, R1;
KIL -R0.x;
END
# 64 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Vector 2 [_Color]
Float 3 [_Shininess]
Float 4 [_Gloss]
Float 5 [_Reflection]
Float 6 [_FrezPow]
Float 7 [_FrezFalloff]
Float 8 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_3_0
; 66 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c9, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c10, 128.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2
dcl_texcoord3 v3
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xy
texld r0.yw, v0.zwzw, s1
mad_pp r1.xy, r0.wyzw, c9.z, c9.w
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c9.y
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r2.x, v1, r1
dp3_pp r2.y, r1, v2
dp3_pp r2.z, r1, v3
mov r0.x, v1.w
mov r0.z, v3.w
mov r0.y, v2.w
dp3 r0.w, r2, r0
mul r3.xyz, r2, r0.w
mad r0.xyz, -r3, c9.z, r0
texld r3.xyz, v0.zwzw, s0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3_pp r0.x, r0, r2
abs_pp r0.x, r0
add_pp r1.w, -r0.x, c9.y
pow_pp r0, r1.w, c7.x
mul_pp r1.w, r0.x, c6.x
add_pp r0.x, r1.w, c5
mul_pp_sat r2.x, r0, r3.z
texld r0, v0, s2
add_pp r3.z, -r2.x, c9.y
mul_pp r2, r0, c2
mul_pp r2.xyz, r2, r3.z
dp3_pp r0.w, v5, v5
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v4
mad_pp r0.xyz, r0.w, v5, r0
dp3_pp r0.w, r0, r0
rsq_pp r3.z, r0.w
mul_pp r0.xyz, r3.z, r0
dp3_pp r0.x, r1, r0
dp3_pp r1.x, r1, v4
mul_pp r3.w, r3.x, r3.x
mul_pp r0.w, r3.x, r3
mul_pp r0.w, r0, c3.x
mul_pp r2.xyz, r2, c0
mul_pp r3.z, r0.w, c10.x
max_pp r3.x, r0, c9
pow_pp r0, r3.x, r3.z
mul_pp r0.y, r1.w, r3
mad_pp r0.w, r3.y, c4.x, r0.y
mov_pp r1.w, r0.x
mov_pp r0.xyz, c0
mul_pp r0.w, r1, r0
mul_pp r0.xyz, c1, r0
mul_pp r0.xyz, r0, r0.w
abs_pp r0.w, r1.x
add_pp r1.y, -r2.w, c9
mul_pp r1.y, r0.w, r1
max_pp r1.x, r1, r1.y
mad_pp r1.xyz, r2, r1.x, r0
add_pp r0.w, r2, -c8.x
cmp r0.x, r0.w, c9, c9.y
texld r0.w, v6, s3
mul_pp r1.xyz, r0.w, r1
mov_pp r0, -r0.x
mul_pp oC0.xyz, r1, c9.z
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

}
	}

#LINE 27

	
}

SubShader { // Shader Model 2

	// Front Faces pass
	
	//Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	 zwrite off Cull Back Ztest Lequal
	 Blend SrcAlpha OneMinusSrcAlpha
	 colormask RGBA
	
		
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 32 to 93
//   d3d9 - ALU: 33 to 96
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_MainTex_ST]
Vector 24 [_BumpMap_ST]
"!!ARBvp1.0
# 56 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 56 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_MainTex_ST]
Vector 23 [_BumpMap_ST]
"vs_2_0
; 59 ALU
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c21
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c24.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c12.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c23.xyxy, c23
mad oT0.xy, v3, c22, c22.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_23;
  mediump vec4 normal;
  normal = tmpvar_22;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAr, normal);
  x1.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAg, normal);
  x1.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAb, normal);
  x1.z = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBr, tmpvar_27);
  x2.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBg, tmpvar_27);
  x2.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBb, tmpvar_27);
  x2.z = tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_31;
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_SHC.xyz * vC);
  x3 = tmpvar_32;
  tmpvar_23 = ((x1 + x2) + x3);
  shlight = tmpvar_23;
  tmpvar_8 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_24;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_25;
  tmpvar_25 = dot (tmpvar_11, lightDir);
  NdotL = tmpvar_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_22)));
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((tmpvar_23 * _LightColor0.xyz) * (tmpvar_26 * 2.0));
  c_i0_i1.xyz = tmpvar_27;
  c_i0_i1.w = tmpvar_22;
  tmpvar_24 = c_i0_i1;
  c = tmpvar_24;
  c.xyz = (c.xyz + (tmpvar_23 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"!!ARBvp1.0
# 32 ALU
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[13].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[13].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 32 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_2_0
; 33 ALU
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c13
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c12.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c12.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c12.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c12.w
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
mad oT4.xy, v4, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * -((((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_12;
  tmpvar_12.xyz = (tmpvar_11 * v_i0_i1.xyz);
  tmpvar_12.w = tmpvar_9.x;
  highp vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_11 * v_i0_i1_i2.xyz);
  tmpvar_14.w = tmpvar_9.y;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_11 * v_i0_i1_i2_i3.xyz);
  tmpvar_16.w = tmpvar_9.z;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_6 = tmpvar_17;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_23 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c.w = tmpvar_22;
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
Vector 25 [_BumpMap_ST]
"!!ARBvp1.0
# 62 ALU
PARAM c[26] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.y, R1, c[21];
DP4 R3.x, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[23];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[14].w, -vertex.position;
DP3 result.texcoord[4].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[4].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
END
# 62 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
Vector 25 [_BumpMap_ST]
"vs_2_0
; 65 ALU
def c26, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c23
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c16, r0
mov r0, c9
dp4 r1.y, c16, r0
dp4 r1.x, c16, r3
mov r0.xyz, c15
mov r0.w, c26.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 oT4.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT4.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c26.y
dp3 oT4.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c12.x
mad oT6.xy, r2.z, c13.zwzw, r1
mov oPos, r0
mov oT6.zw, r0
mad oT0.zw, v3.xyxy, c25.xyxy, c25
mad oT0.xy, v3, c24, c24.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * -((((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_1.xyz;
  tmpvar_13[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_13[2] = tmpvar_2;
  mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_13[0].x;
  tmpvar_14[0].y = tmpvar_13[1].x;
  tmpvar_14[0].z = tmpvar_13[2].x;
  tmpvar_14[1].x = tmpvar_13[0].y;
  tmpvar_14[1].y = tmpvar_13[1].y;
  tmpvar_14[1].z = tmpvar_13[2].y;
  tmpvar_14[2].x = tmpvar_13[0].z;
  tmpvar_14[2].y = tmpvar_13[1].z;
  tmpvar_14[2].z = tmpvar_13[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_14 * v_i0_i1.xyz);
  tmpvar_15.w = tmpvar_12.x;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_14 * v_i0_i1_i2.xyz);
  tmpvar_17.w = tmpvar_12.y;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (tmpvar_14 * v_i0_i1_i2_i3.xyz);
  tmpvar_19.w = tmpvar_12.z;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * unity_Scale.w);
  tmpvar_6 = tmpvar_20;
  mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (tmpvar_21 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_8 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_34;
  tmpvar_34 = (tmpvar_9 * 0.5);
  o_i0 = tmpvar_34;
  highp vec2 tmpvar_35;
  tmpvar_35.x = tmpvar_34.x;
  tmpvar_35.y = (tmpvar_34.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_35 + tmpvar_34.w);
  o_i0.zw = tmpvar_9.zw;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lowp float tmpvar_24;
  tmpvar_24 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  mediump vec4 tmpvar_25;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump float atten_i0;
  atten_i0 = tmpvar_24;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11, lightDir);
  NdotL = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_22)));
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((tmpvar_23 * _LightColor0.xyz) * ((tmpvar_27 * atten_i0) * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  c_i0_i1.w = tmpvar_22;
  tmpvar_25 = c_i0_i1;
  c = tmpvar_25;
  c.xyz = (c.xyz + (tmpvar_23 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
Vector 19 [_BumpMap_ST]
"!!ARBvp1.0
# 38 ALU
PARAM c[20] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP4 R1.w, vertex.position, c[4];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R1, c[7];
DP4 R1.z, vertex.position, c[3];
DP3 R0.w, -R2, c[7];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R2.xyz, R1.xyww, c[0].y;
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
MOV R0.x, R2;
MUL R0.y, R2, c[13].x;
ADD result.texcoord[6].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[6].zw, R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 38 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"vs_2_0
; 39 ALU
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c15
mov r0.w, c19.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c14.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp4 r1.w, v0, c3
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c14.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c14.w
dp3 r0.y, r1, c6
dp4 r1.z, v0, c2
dp3 r0.w, -r2, c6
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c19.y
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c14.w
mov r0.x, r2
mul r0.y, r2, c12.x
mad oT6.xy, r2.z, c13.zwzw, r0
mov oPos, r1
mov oT6.zw, r1
mad oT0.zw, v3.xyxy, c18.xyxy, c18
mad oT0.xy, v3, c17, c17.zwzw
mad oT4.xy, v4, c16, c16.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec4 o_i0;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_19;
  highp vec2 tmpvar_20;
  tmpvar_20.x = tmpvar_19.x;
  tmpvar_20.y = (tmpvar_19.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_20 + tmpvar_19.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D unity_Lightmap;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_23 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * 2.0))));
  c.w = tmpvar_22;
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [_MainTex_ST]
Vector 32 [_BumpMap_ST]
"!!ARBvp1.0
# 87 ALU
PARAM c[33] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[5].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 87 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [_MainTex_ST]
Vector 31 [_BumpMap_ST]
"vs_2_0
; 90 ALU
def c32, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c32.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c12.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c31.xyxy, c31
mad oT0.xy, v3, c30, c30.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * -((((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_1.xyz;
  tmpvar_12[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_12[2] = tmpvar_2;
  mat3 tmpvar_13;
  tmpvar_13[0].x = tmpvar_12[0].x;
  tmpvar_13[0].y = tmpvar_12[1].x;
  tmpvar_13[0].z = tmpvar_12[2].x;
  tmpvar_13[1].x = tmpvar_12[0].y;
  tmpvar_13[1].y = tmpvar_12[1].y;
  tmpvar_13[1].z = tmpvar_12[2].y;
  tmpvar_13[2].x = tmpvar_12[0].z;
  tmpvar_13[2].y = tmpvar_12[1].z;
  tmpvar_13[2].z = tmpvar_12[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_14;
  tmpvar_14.xyz = (tmpvar_13 * v_i0_i1.xyz);
  tmpvar_14.w = tmpvar_11.x;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_14 * unity_Scale.w);
  tmpvar_4 = tmpvar_15;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_16;
  tmpvar_16.xyz = (tmpvar_13 * v_i0_i1_i2.xyz);
  tmpvar_16.w = tmpvar_11.y;
  highp vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * unity_Scale.w);
  tmpvar_5 = tmpvar_17;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = (tmpvar_13 * v_i0_i1_i2_i3.xyz);
  tmpvar_18.w = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_18 * unity_Scale.w);
  tmpvar_6 = tmpvar_19;
  mat3 tmpvar_20;
  tmpvar_20[0] = _Object2World[0].xyz;
  tmpvar_20[1] = _Object2World[1].xyz;
  tmpvar_20[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_13 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = tmpvar_21;
  mediump vec3 tmpvar_24;
  mediump vec4 normal;
  normal = tmpvar_23;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAr, normal);
  x1.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAg, normal);
  x1.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAb, normal);
  x1.z = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBr, tmpvar_28);
  x2.x = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBg, tmpvar_28);
  x2.y = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBb, tmpvar_28);
  x2.z = tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_SHC.xyz * vC);
  x3 = tmpvar_33;
  tmpvar_24 = ((x1 + x2) + x3);
  shlight = tmpvar_24;
  tmpvar_8 = shlight;
  highp vec3 tmpvar_34;
  tmpvar_34 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosZ0 - tmpvar_34.z);
  highp vec4 tmpvar_38;
  tmpvar_38 = (((tmpvar_35 * tmpvar_35) + (tmpvar_36 * tmpvar_36)) + (tmpvar_37 * tmpvar_37));
  highp vec4 tmpvar_39;
  tmpvar_39 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_35 * tmpvar_21.x) + (tmpvar_36 * tmpvar_21.y)) + (tmpvar_37 * tmpvar_21.z)) * inversesqrt (tmpvar_38))) * 1.0/((1.0 + (tmpvar_38 * unity_4LightAtten0))));
  highp vec3 tmpvar_40;
  tmpvar_40 = (tmpvar_8 + ((((unity_LightColor0 * tmpvar_39.x) + (unity_LightColor1 * tmpvar_39.y)) + (unity_LightColor2 * tmpvar_39.z)) + (unity_LightColor3 * tmpvar_39.w)));
  tmpvar_8 = tmpvar_40;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec4 tmpvar_24;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_25;
  tmpvar_25 = dot (tmpvar_11, lightDir);
  NdotL = tmpvar_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_22)));
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((tmpvar_23 * _LightColor0.xyz) * (tmpvar_26 * 2.0));
  c_i0_i1.xyz = tmpvar_27;
  c_i0_i1.w = tmpvar_22;
  tmpvar_24 = c_i0_i1;
  c = tmpvar_24;
  c.xyz = (c.xyz + (tmpvar_23 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
Vector 33 [_BumpMap_ST]
"!!ARBvp1.0
# 93 ALU
PARAM c[34] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MAD R1.xyz, R0.w, c[24], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[30];
DP4 R3.y, R0, c[29];
DP4 R3.x, R0, c[28];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[31];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[5].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[16];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
DP4 R1.z, R0, c[11];
MOV R0.xyz, c[15];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[14].w, -vertex.position;
DP3 result.texcoord[4].y, R2, R1;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[14].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[14].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[4].z, vertex.normal, R1;
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MOV R1.x, R2;
MUL R1.y, R2, c[13].x;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 93 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
Vector 33 [_BumpMap_ST]
"vs_2_0
; 96 ALU
def c34, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c16, r0
mov r0, c9
dp4 r1.y, c16, r0
dp4 r1.x, c16, r3
mov r0.xyz, c15
mov r0.w, c34.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 oT4.y, r2, r1
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c14.w
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT4.z, v2, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c34.z
dp3 oT4.x, v1, r1
mov r1.x, r2
mul r1.y, r2, c12.x
mad oT6.xy, r2.z, c13.zwzw, r1
mov oPos, r0
mov oT6.zw, r0
mad oT0.zw, v3.xyxy, c33.xyxy, c33
mad oT0.xy, v3, c32, c32.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec3 unity_LightColor3;
uniform highp vec3 unity_LightColor2;
uniform highp vec3 unity_LightColor1;
uniform highp vec3 unity_LightColor0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * -((((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_1.xyz;
  tmpvar_13[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_13[2] = tmpvar_2;
  mat3 tmpvar_14;
  tmpvar_14[0].x = tmpvar_13[0].x;
  tmpvar_14[0].y = tmpvar_13[1].x;
  tmpvar_14[0].z = tmpvar_13[2].x;
  tmpvar_14[1].x = tmpvar_13[0].y;
  tmpvar_14[1].y = tmpvar_13[1].y;
  tmpvar_14[1].z = tmpvar_13[2].y;
  tmpvar_14[2].x = tmpvar_13[0].z;
  tmpvar_14[2].y = tmpvar_13[1].z;
  tmpvar_14[2].z = tmpvar_13[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_14 * v_i0_i1.xyz);
  tmpvar_15.w = tmpvar_12.x;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_4 = tmpvar_16;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_14 * v_i0_i1_i2.xyz);
  tmpvar_17.w = tmpvar_12.y;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_5 = tmpvar_18;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = (tmpvar_14 * v_i0_i1_i2_i3.xyz);
  tmpvar_19.w = tmpvar_12.z;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * unity_Scale.w);
  tmpvar_6 = tmpvar_20;
  mat3 tmpvar_21;
  tmpvar_21[0] = _Object2World[0].xyz;
  tmpvar_21[1] = _Object2World[1].xyz;
  tmpvar_21[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_14 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_22;
  mediump vec3 tmpvar_25;
  mediump vec4 normal;
  normal = tmpvar_24;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHAr, normal);
  x1.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHAg, normal);
  x1.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHAb, normal);
  x1.z = tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_30;
  tmpvar_30 = dot (unity_SHBr, tmpvar_29);
  x2.x = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = dot (unity_SHBg, tmpvar_29);
  x2.y = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = dot (unity_SHBb, tmpvar_29);
  x2.z = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_SHC.xyz * vC);
  x3 = tmpvar_34;
  tmpvar_25 = ((x1 + x2) + x3);
  shlight = tmpvar_25;
  tmpvar_8 = shlight;
  highp vec3 tmpvar_35;
  tmpvar_35 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_36;
  tmpvar_36 = (unity_4LightPosX0 - tmpvar_35.x);
  highp vec4 tmpvar_37;
  tmpvar_37 = (unity_4LightPosY0 - tmpvar_35.y);
  highp vec4 tmpvar_38;
  tmpvar_38 = (unity_4LightPosZ0 - tmpvar_35.z);
  highp vec4 tmpvar_39;
  tmpvar_39 = (((tmpvar_36 * tmpvar_36) + (tmpvar_37 * tmpvar_37)) + (tmpvar_38 * tmpvar_38));
  highp vec4 tmpvar_40;
  tmpvar_40 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_36 * tmpvar_22.x) + (tmpvar_37 * tmpvar_22.y)) + (tmpvar_38 * tmpvar_22.z)) * inversesqrt (tmpvar_39))) * 1.0/((1.0 + (tmpvar_39 * unity_4LightAtten0))));
  highp vec3 tmpvar_41;
  tmpvar_41 = (tmpvar_8 + ((((unity_LightColor0 * tmpvar_40.x) + (unity_LightColor1 * tmpvar_40.y)) + (unity_LightColor2 * tmpvar_40.z)) + (unity_LightColor3 * tmpvar_40.w)));
  tmpvar_8 = tmpvar_41;
  highp vec4 o_i0;
  highp vec4 tmpvar_42;
  tmpvar_42 = (tmpvar_9 * 0.5);
  o_i0 = tmpvar_42;
  highp vec2 tmpvar_43;
  tmpvar_43.x = tmpvar_42.x;
  tmpvar_43.y = (tmpvar_42.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_43 + tmpvar_42.w);
  o_i0.zw = tmpvar_9.zw;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _ShadowMapTexture;
uniform lowp float _Metalics;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform samplerCube _Cube;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp vec3 CubeTex;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = ((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z);
  CubeTex = (textureCube (_Cube, worldRefl).xyz * tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = clamp (dot (CubeTex, vec3(0.22, 0.707, 0.071)), 0.0, 1.0);
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (CubeTex, (CubeTex * tmpvar_17.xyz), vec3(((1.0 - (tmpvar_20 * tmpvar_20)) * _Metalics)));
  lowp float tmpvar_22;
  tmpvar_22 = tmpvar_17.w;
  lowp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_17.xyz * (1.0 - clamp (tmpvar_19, 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_22 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lowp float tmpvar_24;
  tmpvar_24 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  mediump vec4 tmpvar_25;
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump float atten_i0;
  atten_i0 = tmpvar_24;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11, lightDir);
  NdotL = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_22)));
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((tmpvar_23 * _LightColor0.xyz) * ((tmpvar_27 * atten_i0) * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  c_i0_i1.w = tmpvar_22;
  tmpvar_25 = c_i0_i1;
  c = tmpvar_25;
  c.xyz = (c.xyz + (tmpvar_23 * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_21);
  c.w = tmpvar_22;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 46 to 54, TEX: 4 to 6
//   d3d9 - ALU: 50 to 59, TEX: 5 to 7
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 52 ALU, 4 TEX
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[2], 2D;
MAD R4.xy, R1.wyzw, c[7].x, -c[7].y;
MUL R1.x, R4.y, R4.y;
MAD R1.x, -R4, R4, -R1;
ADD R1.x, R1, c[7].y;
RSQ R1.x, R1.x;
RCP R4.z, R1.x;
DP3 R3.x, R4, fragment.texcoord[1];
DP3 R3.y, R4, fragment.texcoord[2];
DP3 R3.z, R4, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R1.x, R3, R2;
MUL R1.xyz, R3, R1.x;
MAD R1.xyz, -R1, c[7].x, R2;
MUL R2, R0, c[1];
DP3 R1.w, R1, R1;
SLT R0.w, R2, c[6].x;
RSQ R1.w, R1.w;
MUL R1.xyw, R1.w, R1.xyzz;
MOV result.color.w, R2;
KIL -R0.w;
TEX R0.xyz, R1.xyww, texture[3], CUBE;
TEX R1.z, fragment.texcoord[0].zwzw, texture[0], 2D;
DP3 R0.w, R1.xyww, R3;
ABS R0.w, R0;
ADD R0.w, -R0, c[7].y;
MOV R1.x, c[2];
POW R0.w, R0.w, c[4].x;
MAD R0.w, R0, c[3].x, R1.x;
MUL R0.w, R0, R1.z;
MUL R0.xyz, R0.w, R0;
MOV_SAT R1.x, R0.w;
ADD R0.w, -R1.x, c[7].y;
MUL R1.xyz, R2, R0.w;
DP3_SAT R1.w, R0, c[8];
MAD R0.w, -R1, R1, c[7].y;
MAD R2.xyz, R2, R0, -R0;
MUL R0.w, R0, c[5].x;
MAD R2.xyz, R0.w, R2, R0;
MUL R0.xyz, R1, fragment.texcoord[5];
DP3 R0.w, R4, fragment.texcoord[4];
ABS R1.w, R0;
ADD R3.x, -R2.w, c[7].y;
MUL R1.w, R1, R3.x;
MUL R1.xyz, R1, c[0];
MAX R0.w, R0, R1;
MUL R1.xyz, R0.w, R1;
MAD R0.xyz, R1, c[7].x, R0;
ADD result.color.xyz, R0, R2;
END
# 52 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
"ps_2_0
; 58 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
texld r1, t0, s2
mul_pp r1, r1, c1
mov r2.x, t1.w
mov r2.z, t3.w
mov r2.y, t2.w
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s1
mov r0.x, r0.w
mad_pp r4.xy, r0, c7.z, c7.w
mul_pp r0.x, r4.y, r4.y
mad_pp r0.x, -r4, r4, -r0
add_pp r0.x, r0, c7.y
rsq_pp r0.x, r0.x
rcp_pp r4.z, r0.x
dp3_pp r3.x, r4, t1
dp3_pp r3.y, r4, t2
dp3_pp r3.z, r4, t3
dp3 r0.x, r3, r2
mul r0.xyz, r3, r0.x
mad r5.xyz, -r0, c7.z, r2
dp3 r2.x, r5, r5
rsq r2.x, r2.x
add_pp r0.x, r1.w, -c6
mul r5.xyz, r2.x, r5
cmp r0.x, r0, c7, c7.y
mov_pp r2, -r0.x
mov r0.y, t0.w
mov r0.x, t0.z
mov r6.xy, r0
texld r0, r5, s3
texkill r2.xyzw
texld r2, r6, s0
dp3_pp r2.x, r5, r3
abs_pp r2.x, r2
add_pp r2.x, -r2, c7.y
pow_pp r3.x, r2.x, c4.x
mov_pp r2.x, c2
mad_pp r2.x, r3.x, c3, r2
mul_pp r3.x, r2, r2.z
mov_pp_sat r2.x, r3
mul_pp r3.xyz, r3.x, r0
dp3_pp_sat r0.x, r3, c8
add_pp r2.x, -r2, c7.y
mul_pp r2.xyz, r1, r2.x
mul_pp r5.xyz, r2, t5
mad_pp r0.x, -r0, r0, c7.y
mad_pp r1.xyz, r1, r3, -r3
mul_pp r0.x, r0, c5
mad_pp r6.xyz, r0.x, r1, r3
dp3_pp r0.x, r4, t4
abs_pp r1.x, r0
add_pp r3.x, -r1.w, c7.y
mul_pp r1.x, r1, r3
mul_pp r2.xyz, r2, c0
max_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c7.z, r5
add_pp r0.xyz, r0, r6
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [unity_Lightmap] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 46 ALU, 5 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R3.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MAD R1.xy, R1.wyzw, c[6].x, -c[6].y;
MUL R1.z, R1.y, R1.y;
MAD R1.z, -R1.x, R1.x, -R1;
ADD R1.z, R1, c[6].y;
RSQ R1.z, R1.z;
RCP R1.z, R1.z;
DP3 R4.x, fragment.texcoord[1], R1;
DP3 R4.y, R1, fragment.texcoord[2];
DP3 R4.z, R1, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R1.x, R4, R2;
MUL R1.xyz, R4, R1.x;
MAD R2.xyz, -R1, c[6].x, R2;
DP3 R1.x, R2, R2;
RSQ R2.w, R1.x;
MUL R3.xyw, R2.w, R2.xyzz;
MUL R1, R0, c[0];
DP3 R2.w, R3.xyww, R4;
SLT R0.x, R1.w, c[5];
ABS R2.w, R2;
ADD R2.w, -R2, c[6].y;
POW R2.w, R2.w, c[3].x;
MOV result.color.w, R1;
TEX R2.xyz, R3.xyww, texture[3], CUBE;
KIL -R0.x;
TEX R0, fragment.texcoord[4], texture[4], 2D;
MOV R3.x, c[1];
MAD R2.w, R2, c[2].x, R3.x;
MUL R2.w, R2, R3.z;
MUL R3.xyz, R2.w, R2;
MOV_SAT R2.x, R2.w;
DP3_SAT R2.y, R3, c[7];
MAD R3.w, -R2.y, R2.y, c[6].y;
ADD R2.w, -R2.x, c[6].y;
MAD R2.xyz, R1, R3, -R3;
MUL R3.w, R3, c[4].x;
MAD R2.xyz, R3.w, R2, R3;
MUL R1.xyz, R1, R2.w;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[6].z, R2;
END
# 46 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [unity_Lightmap] 2D
"ps_2_0
; 50 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 8.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xy
mov r0.y, t0.w
mov r0.x, t0.z
mov r3.x, t1.w
mov r3.z, t3.w
mov r3.y, t2.w
texld r1, r0, s1
texld r0, t0, s2
mov r1.x, r1.w
mad_pp r1.xy, r1, c6.z, c6.w
mul_pp r2.x, r1.y, r1.y
mad_pp r2.x, -r1, r1, -r2
add_pp r2.x, r2, c6.y
rsq_pp r2.x, r2.x
rcp_pp r1.z, r2.x
dp3_pp r2.x, t1, r1
dp3_pp r2.y, r1, t2
dp3_pp r2.z, r1, t3
dp3 r1.x, r2, r3
mul r1.xyz, r2, r1.x
mad r3.xyz, -r1, c6.z, r3
dp3 r4.x, r3, r3
mul_pp r0, r0, c0
add_pp r1.x, r0.w, -c5
rsq r4.x, r4.x
mul r4.xyz, r4.x, r3
dp3_pp r2.x, r4, r2
cmp r1.x, r1, c6, c6.y
mov_pp r1, -r1.x
abs_pp r2.x, r2
mov r3.y, t0.w
mov r3.x, t0.z
mov r5.xy, r3
add_pp r2.x, -r2, c6.y
texld r3, r4, s3
texld r5, r5, s0
texkill r1.xyzw
texld r1, t4, s4
pow_pp r4.x, r2.x, c3.x
mov_pp r2.x, c1
mad_pp r2.x, r4.x, c2, r2
mul_pp r2.x, r2, r5.z
mul_pp r4.xyz, r2.x, r3
dp3_pp_sat r3.x, r4, c7
mov_pp_sat r2.x, r2
mad_pp r3.x, -r3, r3, c6.y
mad_pp r5.xyz, r0, r4, -r4
mul_pp r3.x, r3, c4
add_pp r2.x, -r2, c6.y
mad_pp r3.xyz, r3.x, r5, r4
mul_pp r0.xyz, r0, r2.x
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r1, r0
mad_pp r0.xyz, r0, c7.w, r3
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 54 ALU, 5 TEX
PARAM c[9] = { program.local[0..6],
		{ 2, 1 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R2.z, fragment.texcoord[0].zwzw, texture[0], 2D;
TXP R3.x, fragment.texcoord[6], texture[4], 2D;
MAD R3.yz, R1.xwyw, c[7].x, -c[7].y;
MUL R0, R0, c[1];
MUL R1.x, R3.z, R3.z;
MAD R1.x, -R3.y, R3.y, -R1;
ADD R1.x, R1, c[7].y;
RSQ R1.x, R1.x;
RCP R3.w, R1.x;
DP3 R2.x, R3.yzww, fragment.texcoord[1];
DP3 R2.y, R3.yzww, fragment.texcoord[2];
DP3 R2.w, R3.yzww, fragment.texcoord[3];
MOV R4.x, fragment.texcoord[1].w;
MOV R4.z, fragment.texcoord[3].w;
MOV R4.y, fragment.texcoord[2].w;
DP3 R1.x, R2.xyww, R4;
MUL R1.xyz, R2.xyww, R1.x;
MAD R1.xyz, -R1, c[7].x, R4;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R1;
SLT R1.w, R0, c[6].x;
MOV result.color.w, R0;
KIL -R1.w;
TEX R1.xyz, R4, texture[3], CUBE;
DP3 R1.w, R4, R2.xyww;
ABS R1.w, R1;
ADD R1.w, -R1, c[7].y;
MOV R2.x, c[2];
POW R1.w, R1.w, c[4].x;
MAD R1.w, R1, c[3].x, R2.x;
MUL R1.w, R1, R2.z;
MUL R1.xyz, R1.w, R1;
MOV_SAT R2.x, R1.w;
ADD R1.w, -R2.x, c[7].y;
MUL R4.xyz, R0, R1.w;
DP3_SAT R2.x, R1, c[8];
MAD R1.w, -R2.x, R2.x, c[7].y;
MAD R0.xyz, R0, R1, -R1;
MUL R1.w, R1, c[5].x;
MAD R2.xyz, R1.w, R0, R1;
DP3 R1.w, R3.yzww, fragment.texcoord[4];
ABS R0.x, R1.w;
ADD R0.y, -R0.w, c[7];
MUL R2.w, R0.x, R0.y;
MAX R1.w, R1, R2;
MUL R1.xyz, R4, fragment.texcoord[5];
MUL R0.xyz, R4, c[0];
MUL R1.w, R1, R3.x;
MUL R0.xyz, R1.w, R0;
MAD R0.xyz, R0, c[7].x, R1;
ADD result.color.xyz, R0, R2;
END
# 54 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Metalics]
Float 6 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
"ps_2_0
; 59 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c7, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c8, 0.21997070, 0.70703125, 0.07098389, 0
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
dcl t6
mov r4.x, t1.w
mov r4.z, t3.w
mov r4.y, t2.w
mov r0.y, t0.w
mov r0.x, t0.z
texld r1, r0, s1
texld r0, t0, s2
mov r1.x, r1.w
mad_pp r1.xy, r1, c7.z, c7.w
mul_pp r2.x, r1.y, r1.y
mad_pp r2.x, -r1, r1, -r2
add_pp r2.x, r2, c7.y
rsq_pp r2.x, r2.x
rcp_pp r1.z, r2.x
mul_pp r0, r0, c1
dp3_pp r2.y, r1, t2
dp3_pp r2.z, r1, t3
dp3_pp r2.x, r1, t1
dp3 r3.x, r2, r4
mul r3.xyz, r2, r3.x
mad r5.xyz, -r3, c7.z, r4
dp3 r4.x, r5, r5
rsq r4.x, r4.x
mul r5.xyz, r4.x, r5
dp3_pp r2.x, r5, r2
add_pp r3.x, r0.w, -c6
cmp r3.x, r3, c7, c7.y
mov_pp r4, -r3.x
abs_pp r2.x, r2
dp3_pp r1.x, r1, t4
mov r3.y, t0.w
mov r3.x, t0.z
mov r6.xy, r3
add_pp r2.x, -r2, c7.y
texld r3, r5, s3
texld r6, r6, s0
texkill r4.xyzw
texldp r4, t6, s4
pow_pp r5.x, r2.x, c4.x
mov_pp r2.x, r5.x
mov_pp r5.x, c2
mad_pp r2.x, r2, c3, r5
mul_pp r5.x, r2, r6.z
mov_pp_sat r2.x, r5
mul_pp r5.xyz, r5.x, r3
add_pp r3.x, -r2, c7.y
dp3_pp_sat r2.x, r5, c8
mad_pp r6.xyz, r0, r5, -r5
mul_pp r3.xyz, r0, r3.x
mad_pp r2.x, -r2, r2, c7.y
mul_pp r0.x, r2, c5
mad_pp r0.xyz, r0.x, r6, r5
mul_pp r2.xyz, r3, t5
abs_pp r6.x, r1
add_pp r5.x, -r0.w, c7.y
mul_pp r5.x, r6, r5
mul_pp r3.xyz, r3, c0
max_pp r1.x, r1, r5
mul_pp r1.x, r1, r4
mul_pp r1.xyz, r1.x, r3
mad_pp r1.xyz, r1, c7.z, r2
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
SetTexture 5 [unity_Lightmap] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 49 ALU, 6 TEX
PARAM c[8] = { program.local[0..5],
		{ 2, 1, 8 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1, fragment.texcoord[0], texture[2], 2D;
MAD R0.xy, R0.wyzw, c[6].x, -c[6].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[6].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R4.x, fragment.texcoord[1], R0;
DP3 R4.y, R0, fragment.texcoord[2];
DP3 R4.z, R0, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R4, R0;
MUL R2.xyz, R4, R0.w;
MAD R0.xyz, -R2, c[6].x, R0;
MUL R2, R1, c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
SLT R0.x, R2.w, c[5];
DP3 R0.y, R5, R4;
ABS R0.y, R0;
ADD R0.y, -R0, c[6];
MOV R0.w, c[1].x;
POW R0.y, R0.y, c[3].x;
MAD R0.y, R0, c[2].x, R0.w;
MOV result.color.w, R2;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
KIL -R0.x;
TXP R0.x, fragment.texcoord[6], texture[4], 2D;
TEX R1, fragment.texcoord[4], texture[5], 2D;
TEX R3.xyz, R5, texture[3], CUBE;
MUL R0.y, R0, R0.z;
MUL R3.xyz, R0.y, R3;
DP3_SAT R0.z, R3, c[7];
MOV_SAT R0.y, R0;
MAD R0.z, -R0, R0, c[6].y;
ADD R0.y, -R0, c[6];
MAD R4.xyz, R2, R3, -R3;
MUL R0.z, R0, c[4].x;
MAD R3.xyz, R0.z, R4, R3;
MUL R2.xyz, R2, R0.y;
MUL R0.w, R0.x, c[6].x;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, c[6].z;
MIN R0.xyz, R0, R0.w;
MAD result.color.xyz, R2, R0, R3;
END
# 49 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
Vector 0 [_Color]
Float 1 [_Reflection]
Float 2 [_FrezPow]
Float 3 [_FrezFalloff]
Float 4 [_Metalics]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_Cube] CUBE
SetTexture 4 [_ShadowMapTexture] 2D
SetTexture 5 [unity_Lightmap] 2D
"ps_2_0
; 56 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 8.00000000, 0.21997070, 0.70703125, 0.07098389
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xy
dcl t6
mov r0.y, t0.w
mov r0.x, t0.z
mov r3.x, t1.w
mov r3.z, t3.w
mov r3.y, t2.w
texld r1, r0, s1
texld r0, t0, s2
mov r1.x, r1.w
mad_pp r1.xy, r1, c6.z, c6.w
mul_pp r2.x, r1.y, r1.y
mad_pp r2.x, -r1, r1, -r2
add_pp r2.x, r2, c6.y
rsq_pp r2.x, r2.x
rcp_pp r1.z, r2.x
dp3_pp r2.y, r1, t2
dp3_pp r2.z, r1, t3
dp3_pp r2.x, t1, r1
dp3 r1.x, r2, r3
mul r1.xyz, r2, r1.x
mad r3.xyz, -r1, c6.z, r3
dp3 r4.x, r3, r3
mul_pp r0, r0, c0
rsq r4.x, r4.x
mul r5.xyz, r4.x, r3
dp3_pp r2.x, r5, r2
add_pp r1.x, r0.w, -c5
cmp r1.x, r1, c6, c6.y
mov_pp r1, -r1.x
abs_pp r2.x, r2
mov r3.y, t0.w
mov r3.x, t0.z
mov r6.xy, r3
add_pp r2.x, -r2, c6.y
texld r3, r5, s3
texld r6, r6, s0
texkill r1.xyzw
texldp r4, t6, s4
texld r1, t4, s5
pow_pp r5.x, r2.x, c3.x
mov_pp r2.x, r5.x
mov_pp r5.x, c1
mad_pp r2.x, r2, c2, r5
mul_pp r5.x, r2, r6.z
mov_pp_sat r2.x, r5
mul_pp r5.xyz, r5.x, r3
mov r3.z, c7.w
mov r3.y, c7.z
mov r3.x, c7.y
dp3_pp_sat r3.x, r5, r3
mad_pp r3.x, -r3, r3, c6.y
add_pp r2.x, -r2, c6.y
mad_pp r6.xyz, r0, r5, -r5
mul_pp r0.xyz, r0, r2.x
mul_pp r2.xyz, r1.w, r1
mul_pp r3.x, r3, c4
mad_pp r3.xyz, r3.x, r6, r5
mul_pp r1.x, r4, c6.z
mul_pp r2.xyz, r2, c7.x
min_pp r1.xyz, r2, r1.x
mad_pp r0.xyz, r0, r1, r3
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 5
//   opengl - ALU: 38 to 47
//   d3d9 - ALU: 41 to 50
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
# 46 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 46 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
; 49 ALU
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_19;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = tmpvar_17.w;
  lowp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_17.xyz * (1.0 - clamp (((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_19 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_21;
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTexture0, tmpvar_22);
  mediump vec4 tmpvar_24;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = tmpvar_23.w;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_25;
  tmpvar_25 = dot (tmpvar_11, lightDir_i0);
  NdotL = tmpvar_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_19)));
  mediump vec3 tmpvar_27;
  tmpvar_27 = ((tmpvar_20 * _LightColor0.xyz) * ((tmpvar_26 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_27;
  c_i0_i1.w = tmpvar_19;
  tmpvar_24 = c_i0_i1;
  c = tmpvar_24;
  c.w = tmpvar_19;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [_MainTex_ST]
Vector 17 [_BumpMap_ST]
"!!ARBvp1.0
# 38 ALU
PARAM c[18] = { { 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[15];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[13].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[13].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[13].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_2_0
; 41 ALU
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c14, r0
mov r0, c9
dp4 r1.y, c14, r0
dp4 r1.x, c14, r3
mov r0.xyz, c13
mov r0.w, c17.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c12.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c12.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_19;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = tmpvar_17.w;
  lowp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_17.xyz * (1.0 - clamp (((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_19 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD4;
  mediump vec4 tmpvar_21;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_22;
  tmpvar_22 = dot (tmpvar_11, lightDir_i0);
  NdotL = tmpvar_22;
  lowp float tmpvar_23;
  tmpvar_23 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_19)));
  mediump vec3 tmpvar_24;
  tmpvar_24 = ((tmpvar_20 * _LightColor0.xyz) * (tmpvar_23 * 2.0));
  c_i0_i1.xyz = tmpvar_24;
  c_i0_i1.w = tmpvar_19;
  tmpvar_21 = c_i0_i1;
  c = tmpvar_21;
  c.w = tmpvar_19;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
# 47 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
; 50 ALU
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.w, r0, c15
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_19;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = tmpvar_17.w;
  lowp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_17.xyz * (1.0 - clamp (((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_19 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_21;
  lowp float tmpvar_22;
  tmpvar_22 = texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w;
  lowp float tmpvar_23;
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_24;
  tmpvar_24 = vec2(dot (LightCoord_i0, LightCoord_i0));
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_24).w;
  mediump vec4 tmpvar_25;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = ((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_22) * tmpvar_23);
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11, lightDir_i0);
  NdotL = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_19)));
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((tmpvar_20 * _LightColor0.xyz) * ((tmpvar_27 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  c_i0_i1.w = tmpvar_19;
  tmpvar_25 = c_i0_i1;
  c = tmpvar_25;
  c.w = tmpvar_19;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
# 46 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 46 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
; 49 ALU
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c18, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c18, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c18, r2
mad r3.xyz, r3, c16.w, -v0
mov r0.xyz, c17
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c16.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c16.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c16.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_7 = tmpvar_19;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = tmpvar_17.w;
  lowp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_17.xyz * (1.0 - clamp (((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_19 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_21;
  highp vec2 tmpvar_22;
  tmpvar_22 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_LightTextureB0, tmpvar_22);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  mediump vec4 tmpvar_25;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = (tmpvar_23.w * tmpvar_24.w);
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_26;
  tmpvar_26 = dot (tmpvar_11, lightDir_i0);
  NdotL = tmpvar_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_19)));
  mediump vec3 tmpvar_28;
  tmpvar_28 = ((tmpvar_20 * _LightColor0.xyz) * ((tmpvar_27 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_28;
  c_i0_i1.w = tmpvar_19;
  tmpvar_25 = c_i0_i1;
  c = tmpvar_25;
  c.w = tmpvar_19;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
# 44 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[19];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[18];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[17].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[17].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[17].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[17].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R2, R1;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
; 47 ALU
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c18, r0
mov r0, c9
dp4 r1.y, c18, r0
dp4 r1.x, c18, r3
mov r0.xyz, c17
mov r0.w, c21.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c16.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c16.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c16.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c16.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r2, r1
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _BumpMap_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  lowp vec4 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * -((((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz)));
  mat3 tmpvar_11;
  tmpvar_11[0] = tmpvar_1.xyz;
  tmpvar_11[1] = (cross (tmpvar_2, tmpvar_1.xyz) * tmpvar_1.w);
  tmpvar_11[2] = tmpvar_2;
  mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_11[0].x;
  tmpvar_12[0].y = tmpvar_11[1].x;
  tmpvar_12[0].z = tmpvar_11[2].x;
  tmpvar_12[1].x = tmpvar_11[0].y;
  tmpvar_12[1].y = tmpvar_11[1].y;
  tmpvar_12[1].z = tmpvar_11[2].y;
  tmpvar_12[2].x = tmpvar_11[0].z;
  tmpvar_12[2].y = tmpvar_11[1].z;
  tmpvar_12[2].z = tmpvar_11[2].z;
  vec4 v_i0_i1;
  v_i0_i1.x = _Object2World[0].x;
  v_i0_i1.y = _Object2World[1].x;
  v_i0_i1.z = _Object2World[2].x;
  v_i0_i1.w = _Object2World[3].x;
  highp vec4 tmpvar_13;
  tmpvar_13.xyz = (tmpvar_12 * v_i0_i1.xyz);
  tmpvar_13.w = tmpvar_10.x;
  highp vec4 tmpvar_14;
  tmpvar_14 = (tmpvar_13 * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  vec4 v_i0_i1_i2;
  v_i0_i1_i2.x = _Object2World[0].y;
  v_i0_i1_i2.y = _Object2World[1].y;
  v_i0_i1_i2.z = _Object2World[2].y;
  v_i0_i1_i2.w = _Object2World[3].y;
  highp vec4 tmpvar_15;
  tmpvar_15.xyz = (tmpvar_12 * v_i0_i1_i2.xyz);
  tmpvar_15.w = tmpvar_10.y;
  highp vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_15 * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  vec4 v_i0_i1_i2_i3;
  v_i0_i1_i2_i3.x = _Object2World[0].z;
  v_i0_i1_i2_i3.y = _Object2World[1].z;
  v_i0_i1_i2_i3.z = _Object2World[2].z;
  v_i0_i1_i2_i3.w = _Object2World[3].z;
  highp vec4 tmpvar_17;
  tmpvar_17.xyz = (tmpvar_12 * v_i0_i1_i2_i3.xyz);
  tmpvar_17.w = tmpvar_10.z;
  highp vec4 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * unity_Scale.w);
  tmpvar_6 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_7 = tmpvar_19;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_TEXCOORD2;
varying lowp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform lowp float _Reflection;
uniform lowp vec4 _Color;
uniform sampler2D _Spec_Gloss_Reflec_Masks;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _FrezPow;
uniform mediump float _FrezFalloff;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  highp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = xlv_TEXCOORD0.xy;
  highp vec2 tmpvar_6;
  tmpvar_6 = xlv_TEXCOORD0.zw;
  lowp vec3 tmpvar_7;
  tmpvar_7.x = xlv_TEXCOORD1.w;
  tmpvar_7.y = xlv_TEXCOORD2.w;
  tmpvar_7.z = xlv_TEXCOORD3.w;
  tmpvar_1 = tmpvar_7;
  lowp vec3 tmpvar_8;
  tmpvar_8 = xlv_TEXCOORD1.xyz;
  tmpvar_2 = tmpvar_8;
  lowp vec3 tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD2.xyz;
  tmpvar_3 = tmpvar_9;
  lowp vec3 tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD3.xyz;
  tmpvar_4 = tmpvar_10;
  lowp float frez;
  lowp vec3 worldNormal;
  lowp vec3 worldRefl;
  lowp vec3 tmpvar_11;
  tmpvar_11 = ((texture2D (_BumpMap, tmpvar_6).xyz * 2.0) - 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_12.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_12.z = dot (tmpvar_4, tmpvar_11);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize (reflect (tmpvar_1, tmpvar_12));
  worldRefl = tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14.x = dot (tmpvar_2, tmpvar_11);
  tmpvar_14.y = dot (tmpvar_3, tmpvar_11);
  tmpvar_14.z = dot (tmpvar_4, tmpvar_11);
  worldNormal = tmpvar_14;
  lowp float tmpvar_15;
  tmpvar_15 = abs (dot (worldRefl, worldNormal));
  mediump float tmpvar_16;
  tmpvar_16 = pow ((1.0 - tmpvar_15), _FrezFalloff);
  frez = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = (_Color * texture2D (_MainTex, tmpvar_5));
  lowp float tmpvar_18;
  tmpvar_18 = (frez * _FrezPow);
  frez = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = tmpvar_17.w;
  lowp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_17.xyz * (1.0 - clamp (((_Reflection + tmpvar_18) * texture2D (_Spec_Gloss_Reflec_Masks, tmpvar_6).z), 0.0, 1.0)));
  float x_i0_i1;
  x_i0_i1 = (tmpvar_19 - _Cutoff);
  if ((x_i0_i1 < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD4;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  mediump vec4 tmpvar_22;
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump float atten;
  atten = tmpvar_21.w;
  lowp vec4 c_i0_i1;
  lowp float NdotL;
  mediump float tmpvar_23;
  tmpvar_23 = dot (tmpvar_11, lightDir_i0);
  NdotL = tmpvar_23;
  lowp float tmpvar_24;
  tmpvar_24 = max (NdotL, (abs (NdotL) * (1.0 - tmpvar_19)));
  mediump vec3 tmpvar_25;
  tmpvar_25 = ((tmpvar_20 * _LightColor0.xyz) * ((tmpvar_24 * atten) * 2.0));
  c_i0_i1.xyz = tmpvar_25;
  c_i0_i1.w = tmpvar_19;
  tmpvar_22 = c_i0_i1;
  c = tmpvar_22;
  c.w = tmpvar_19;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 5
//   opengl - ALU: 42 to 54, TEX: 3 to 5
//   d3d9 - ALU: 48 to 62, TEX: 4 to 6
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 48 ALU, 4 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R2.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R1, R0, c[1];
MAD R4.xy, R2.wyzw, c[6].x, -c[6].y;
SLT R0.y, R1.w, c[5].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
MOV result.color.w, R1;
TEX R0.w, R0.x, texture[3], 2D;
KIL -R0.y;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MUL R0.x, R4.y, R4.y;
MAD R0.x, -R4, R4, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R4.z, R0.x;
DP3 R3.x, R4, fragment.texcoord[1];
DP3 R3.y, R4, fragment.texcoord[2];
DP3 R3.z, R4, fragment.texcoord[3];
DP3 R0.x, R3, R2;
MUL R5.xyz, R3, R0.x;
MAD R2.xyz, -R5, c[6].x, R2;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, R2;
DP3 R0.x, R2, R3;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
POW R0.x, R0.x, c[4].x;
MOV R0.y, c[2].x;
MAD R0.y, R0.x, c[3].x, R0;
MUL_SAT R0.y, R0, R0.z;
ADD R2.x, -R0.y, c[6].y;
DP3 R0.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[4];
DP3 R0.x, R4, R0;
MUL R1.xyz, R1, R2.x;
ADD R0.z, -R1.w, c[6].y;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MAX R0.x, R0, R0.y;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].x;
END
# 48 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_2_0
; 55 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
texld r0, t0, s2
mul_pp r1, r0, c1
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r3, -r0.x
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mov r4.y, t0.w
mov r4.x, t0.z
mov r4.z, t3.w
texld r6, r0, s3
texld r0, r4, s1
texld r5, r2, s0
texkill r3.xyzw
mov r0.x, r0.w
mad_pp r2.xy, r0, c6.z, c6.w
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
add_pp r0.x, r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r3.x, r2, t1
dp3_pp r3.y, r2, t2
dp3_pp r3.z, r2, t3
mov r4.x, t1.w
mov r4.y, t2.w
dp3 r0.x, r3, r4
mul r0.xyz, r3, r0.x
mad r4.xyz, -r0, c6.z, r4
dp3 r0.x, r4, r4
rsq r0.x, r0.x
mul r0.xyz, r0.x, r4
dp3_pp r0.x, r0, r3
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r3.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r3.x, c3, r0
mul_pp_sat r3.x, r0, r5.z
add_pp r3.x, -r3, c6.y
mul_pp r1.xyz, r1, r3.x
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r2, r0
abs_pp r2.x, r0
add_pp r3.x, -r1.w, c6.y
mul_pp r2.x, r2, r3
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, r2
mul_pp r0.x, r0, r6
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 42 ALU, 3 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[0], texture[2], 2D;
MUL R1, R0, c[1];
SLT R0.x, R1.w, c[5];
MOV R3.x, fragment.texcoord[1].w;
MOV R3.z, fragment.texcoord[3].w;
MOV R3.y, fragment.texcoord[2].w;
MOV result.color.w, R1;
TEX R0.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
KIL -R0.x;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[6].x, -c[6].y;
MUL R0.w, R0.y, R0.y;
MAD R0.w, -R0.x, R0.x, -R0;
ADD R0.w, R0, c[6].y;
RSQ R0.w, R0.w;
RCP R0.w, R0.w;
DP3 R4.x, R0.xyww, fragment.texcoord[1];
DP3 R4.y, R0.xyww, fragment.texcoord[2];
DP3 R4.z, R0.xyww, fragment.texcoord[3];
DP3 R0.x, R0.xyww, fragment.texcoord[4];
DP3 R2.x, R4, R3;
MUL R2.xyz, R4, R2.x;
MAD R2.xyz, -R2, c[6].x, R3;
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R2.xyz, R2.w, R2;
DP3 R2.x, R2, R4;
ABS R2.x, R2;
ADD R2.x, -R2, c[6].y;
ABS R0.y, R0.x;
MOV R2.y, c[2].x;
POW R2.x, R2.x, c[4].x;
MAD R2.x, R2, c[3], R2.y;
MUL_SAT R0.z, R2.x, R0;
ADD R0.z, -R0, c[6].y;
MUL R1.xyz, R1, R0.z;
ADD R0.z, -R1.w, c[6].y;
MUL R0.y, R0, R0.z;
MUL R1.xyz, R1, c[0];
MAX R0.x, R0, R0.y;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].x;
END
# 42 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
"ps_2_0
; 48 ALU, 4 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
texld r0, t0, s2
mul_pp r1, r0, c1
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
mov r2.y, t0.w
mov r2.x, t0.z
mov r3.y, t0.w
mov r3.x, t0.z
mov r4.x, t1.w
mov r4.z, t3.w
mov r4.y, t2.w
texld r5, r2, s0
texkill r0.xyzw
texld r0, r3, s1
mov r0.x, r0.w
mad_pp r2.xy, r0, c6.z, c6.w
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
add_pp r0.x, r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r3.x, r2, t1
dp3_pp r3.y, r2, t2
dp3_pp r3.z, r2, t3
dp3 r0.x, r3, r4
mul r0.xyz, r3, r0.x
mad r4.xyz, -r0, c6.z, r4
dp3 r0.x, r4, r4
rsq r0.x, r0.x
mul r0.xyz, r0.x, r4
dp3_pp r0.x, r0, r3
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r3.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r3.x, c3, r0
mul_pp_sat r0.x, r0, r5.z
add_pp r0.x, -r0, c6.y
mul_pp r3.xyz, r1, r0.x
dp3_pp r0.x, r2, t4
add_pp r2.x, -r1.w, c6.y
abs_pp r1.x, r0
mul_pp r1.x, r1, r2
mul_pp r2.xyz, r3, c0
max_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 54 ALU, 5 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R3.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R2, R0, c[1];
SLT R0.w, R2, c[5].x;
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
RCP R0.x, fragment.texcoord[5].w;
MAD R4.xy, R3.wyzw, c[6].x, -c[6].y;
MAD R0.xy, fragment.texcoord[5], R0.x, c[6].w;
MOV R1.x, fragment.texcoord[1].w;
MOV R1.z, fragment.texcoord[3].w;
MOV R1.y, fragment.texcoord[2].w;
MOV result.color.w, R2;
TEX R1.w, R0.z, texture[4], 2D;
KIL -R0.w;
TEX R0.w, R0, texture[3], 2D;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MUL R0.x, R4.y, R4.y;
MAD R0.x, -R4, R4, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R4.z, R0.x;
DP3 R3.x, R4, fragment.texcoord[1];
DP3 R3.y, R4, fragment.texcoord[2];
DP3 R3.z, R4, fragment.texcoord[3];
DP3 R0.x, R3, R1;
MUL R5.xyz, R3, R0.x;
MAD R1.xyz, -R5, c[6].x, R1;
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, R1;
DP3 R0.x, R1, R3;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
MOV R0.y, c[2].x;
POW R0.x, R0.x, c[4].x;
MAD R0.x, R0, c[3], R0.y;
MUL_SAT R0.y, R0.x, R0.z;
ADD R0.y, -R0, c[6];
MUL R1.xyz, R2, R0.y;
DP3 R0.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[4];
DP3 R0.x, R4, R0;
ADD R0.z, -R2.w, c[6].y;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
SLT R0.z, c[6], fragment.texcoord[5];
MUL R0.z, R0, R0.w;
MAX R0.x, R0, R0.y;
MUL R0.z, R0, R1.w;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R0.z;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].x;
END
# 54 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
"ps_2_0
; 62 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c7, 0.50000000, 0, 0, 0
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5
texld r0, t0, s2
mul_pp r1, r0, c1
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r4, -r0.x
dp3 r2.x, t5, t5
mov r2.xy, r2.x
mov r0.y, t0.w
mov r0.x, t0.z
mov r3.xy, r0
mov r0.y, t0.w
mov r0.x, t0.z
mov r5.xy, r0
rcp r0.x, t5.w
mad r0.xy, t5, r0.x, c7.x
texkill r4.xyzw
texld r6, r2, s4
texld r2, r5, s1
texld r5, r3, s0
texld r0, r0, s3
mov r0.y, r2
mov r0.x, r2.w
mad_pp r2.xy, r0, c6.z, c6.w
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
add_pp r0.x, r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r3.x, r2, t1
dp3_pp r3.y, r2, t2
dp3_pp r3.z, r2, t3
mov r4.x, t1.w
mov r4.z, t3.w
mov r4.y, t2.w
dp3 r0.x, r3, r4
mul r0.xyz, r3, r0.x
mad r4.xyz, -r0, c6.z, r4
dp3 r0.x, r4, r4
rsq r0.x, r0.x
mul r0.xyz, r0.x, r4
dp3_pp r0.x, r0, r3
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r3.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r3.x, c3, r0
mul_pp_sat r3.x, r0, r5.z
add_pp r3.x, -r3, c6.y
mul_pp r1.xyz, r1, r3.x
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r2, r0
mul_pp r3.xyz, r1, c0
add_pp r2.x, -r1.w, c6.y
abs_pp r1.x, r0
mul_pp r1.x, r1, r2
cmp r2.x, -t5.z, c6, c6.y
mul_pp r2.x, r2, r0.w
mul_pp r2.x, r2, r6
max_pp r0.x, r0, r1
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r3
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 50 ALU, 5 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R3.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1.w, fragment.texcoord[5], texture[4], CUBE;
MUL R2, R0, c[1];
SLT R0.y, R2.w, c[5].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
MAD R4.xy, R3.wyzw, c[6].x, -c[6].y;
MOV R1.x, fragment.texcoord[1].w;
MOV R1.z, fragment.texcoord[3].w;
MOV R1.y, fragment.texcoord[2].w;
MOV result.color.w, R2;
TEX R0.w, R0.x, texture[3], 2D;
KIL -R0.y;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
MUL R0.x, R4.y, R4.y;
MAD R0.x, -R4, R4, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R4.z, R0.x;
DP3 R3.x, R4, fragment.texcoord[1];
DP3 R3.y, R4, fragment.texcoord[2];
DP3 R3.z, R4, fragment.texcoord[3];
DP3 R0.x, R3, R1;
MUL R5.xyz, R3, R0.x;
MAD R1.xyz, -R5, c[6].x, R1;
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, R1;
DP3 R0.x, R1, R3;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
MOV R0.y, c[2].x;
POW R0.x, R0.x, c[4].x;
MAD R0.x, R0, c[3], R0.y;
MUL_SAT R0.y, R0.x, R0.z;
ADD R0.y, -R0, c[6];
MUL R1.xyz, R2, R0.y;
DP3 R0.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[4];
DP3 R0.x, R4, R0;
ADD R0.z, -R2.w, c[6].y;
ABS R0.y, R0.x;
MUL R0.y, R0, R0.z;
MAX R0.x, R0, R0.y;
MUL R0.z, R0.w, R1.w;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R0.z;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[6].x;
END
# 50 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
"ps_2_0
; 57 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
texld r0, t0, s2
mul_pp r1, r0, c1
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r4, -r0.x
mov r0.y, t0.w
mov r0.x, t0.z
mov r3.xy, r0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mov r2.y, t0.w
mov r2.x, t0.z
texkill r4.xyzw
texld r6, r0, s3
texld r2, r2, s1
texld r5, r3, s0
texld r0, t5, s4
mov r0.y, r2
mov r0.x, r2.w
mad_pp r2.xy, r0, c6.z, c6.w
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
add_pp r0.x, r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r3.x, r2, t1
dp3_pp r3.y, r2, t2
dp3_pp r3.z, r2, t3
mov r4.x, t1.w
mov r4.z, t3.w
mov r4.y, t2.w
dp3 r0.x, r3, r4
mul r0.xyz, r3, r0.x
mad r4.xyz, -r0, c6.z, r4
dp3 r0.x, r4, r4
rsq r0.x, r0.x
mul r0.xyz, r0.x, r4
dp3_pp r0.x, r0, r3
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r3.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r3.x, c3, r0
mul_pp_sat r3.x, r0, r5.z
add_pp r3.x, -r3, c6.y
mul_pp r1.xyz, r1, r3.x
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r2, r0
add_pp r3.x, -r1.w, c6.y
abs_pp r2.x, r0
mul_pp r2.x, r2, r3
mul r3.x, r6, r0.w
max_pp r0.x, r0, r2
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 44 ALU, 4 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R2.yw, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R1, R0, c[1];
MAD R4.xy, R2.wyzw, c[6].x, -c[6].y;
SLT R0.x, R1.w, c[5];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
MOV R0.y, c[2].x;
MOV result.color.w, R1;
KIL -R0.x;
TEX R0.z, fragment.texcoord[0].zwzw, texture[0], 2D;
TEX R0.w, fragment.texcoord[5], texture[3], 2D;
MUL R0.x, R4.y, R4.y;
MAD R0.x, -R4, R4, -R0;
ADD R0.x, R0, c[6].y;
RSQ R0.x, R0.x;
RCP R4.z, R0.x;
DP3 R3.x, R4, fragment.texcoord[1];
DP3 R3.y, R4, fragment.texcoord[2];
DP3 R3.z, R4, fragment.texcoord[3];
DP3 R0.x, R3, R2;
MUL R5.xyz, R3, R0.x;
MAD R2.xyz, -R5, c[6].x, R2;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, R2;
DP3 R0.x, R2, R3;
ABS R0.x, R0;
ADD R0.x, -R0, c[6].y;
POW R0.x, R0.x, c[4].x;
MAD R0.x, R0, c[3], R0.y;
MUL_SAT R0.x, R0, R0.z;
ADD R0.x, -R0, c[6].y;
MUL R0.xyz, R1, R0.x;
DP3 R1.x, R4, fragment.texcoord[4];
MUL R2.xyz, R0, c[0];
ADD R1.z, -R1.w, c[6].y;
ABS R1.y, R1.x;
MUL R1.y, R1, R1.z;
MAX R0.x, R1, R1.y;
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[6].x;
END
# 44 instructions, 6 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Float 2 [_Reflection]
Float 3 [_FrezPow]
Float 4 [_FrezFalloff]
Float 5 [_Cutoff]
SetTexture 0 [_Spec_Gloss_Reflec_Masks] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_MainTex] 2D
SetTexture 3 [_LightTexture0] 2D
"ps_2_0
; 51 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 1.00000000, 2.00000000, -1.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xy
texld r0, t0, s2
mul_pp r1, r0, c1
add_pp r0.x, r1.w, -c5
cmp r0.x, r0, c6, c6.y
mov_pp r0, -r0.x
mov r2.y, t0.w
mov r2.x, t0.z
mov r3.xy, r2
mov r4.x, t1.w
mov r4.z, t3.w
mov r4.y, t2.w
mov r2.y, t0.w
mov r2.x, t0.z
texld r2, r2, s1
texld r5, r3, s0
texkill r0.xyzw
texld r0, t5, s3
mov r0.y, r2
mov r0.x, r2.w
mad_pp r2.xy, r0, c6.z, c6.w
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
add_pp r0.x, r0, c6.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r3.x, r2, t1
dp3_pp r3.y, r2, t2
dp3_pp r3.z, r2, t3
dp3 r0.x, r3, r4
mul r0.xyz, r3, r0.x
mad r4.xyz, -r0, c6.z, r4
dp3 r0.x, r4, r4
rsq r0.x, r0.x
mul r0.xyz, r0.x, r4
dp3_pp r0.x, r0, r3
abs_pp r0.x, r0
add_pp r0.x, -r0, c6.y
pow_pp r3.x, r0.x, c4.x
mov_pp r0.x, c2
mad_pp r0.x, r3.x, c3, r0
mul_pp_sat r0.x, r0, r5.z
add_pp r0.x, -r0, c6.y
mul_pp r0.xyz, r1, r0.x
mul_pp r3.xyz, r0, c0
dp3_pp r0.x, r2, t4
abs_pp r1.x, r0
add_pp r2.x, -r1.w, c6.y
mul_pp r1.x, r1, r2
max_pp r0.x, r0, r1
mul_pp r0.x, r0, r0.w
mul_pp r0.xyz, r0.x, r3
mul_pp r0.xyz, r0, c6.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

}
	}

#LINE 52

	
}
	Fallback "Diffuse"
}
