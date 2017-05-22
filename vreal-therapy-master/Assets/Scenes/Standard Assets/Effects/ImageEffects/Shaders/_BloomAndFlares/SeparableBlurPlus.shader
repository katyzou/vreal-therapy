// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/SeparableBlurPlus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	
	CGINCLUDE
	
	#include "UnityCG.cginc"
	
	struct v2f {
		half4 pos : SV_POSITION;
		half2 uv : TEXCOORD0;
		half4 uv01 : TEXCOORD1;
		half4 uv23 : TEXCOORD2;
		half4 uv45 : TEXCOORD3;
		half4 uv67 : TEXCOORD4;
	};
	
	half4 offsets;
	
	sampler2D _MainTex;
<<<<<<< HEAD
=======
<<<<<<< HEAD
	half4     _MainTex_ST;
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		
	v2f vert (appdata_img v) {
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);

		o.uv.xy = v.texcoord.xy;

<<<<<<< HEAD
=======
<<<<<<< HEAD
		o.uv01 = v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1);
		o.uv23 = v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 2.0;
		o.uv45 = v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 3.0;
		o.uv67 = v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 4.5;
		o.uv67 = v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 6.5;
=======
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		o.uv01 =  v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1);
		o.uv23 =  v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 2.0;
		o.uv45 =  v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 3.0;
		o.uv67 =  v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 4.5;
		o.uv67 =  v.texcoord.xyxy + offsets.xyxy * half4(1,1, -1,-1) * 6.5;
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff

		return o;  
	}
		
	half4 frag (v2f i) : SV_Target {
		half4 color = half4 (0,0,0,0);

<<<<<<< HEAD
=======
<<<<<<< HEAD
		color += 0.225 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv, _MainTex_ST));
		color += 0.150 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv01.xy, _MainTex_ST));
		color += 0.150 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv01.zw, _MainTex_ST));
		color += 0.110 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv23.xy, _MainTex_ST));
		color += 0.110 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv23.zw, _MainTex_ST));
		color += 0.075 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv45.xy, _MainTex_ST));
		color += 0.075 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv45.zw, _MainTex_ST));
		color += 0.0525 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv67.xy, _MainTex_ST));
		color += 0.0525 * tex2D(_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv67.zw, _MainTex_ST));
=======
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		color += 0.225 * tex2D (_MainTex, i.uv);
		color += 0.150 * tex2D (_MainTex, i.uv01.xy);
		color += 0.150 * tex2D (_MainTex, i.uv01.zw);
		color += 0.110 * tex2D (_MainTex, i.uv23.xy);
		color += 0.110 * tex2D (_MainTex, i.uv23.zw);
		color += 0.075 * tex2D (_MainTex, i.uv45.xy);
		color += 0.075 * tex2D (_MainTex, i.uv45.zw);	
		color += 0.0525 * tex2D (_MainTex, i.uv67.xy);
		color += 0.0525 * tex2D (_MainTex, i.uv67.zw);
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		
		return color;
	} 

	ENDCG
	
Subshader {
 Pass {
	  ZTest Always Cull Off ZWrite Off

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      ENDCG
  }
}
	
Fallback off
	
} // shader
