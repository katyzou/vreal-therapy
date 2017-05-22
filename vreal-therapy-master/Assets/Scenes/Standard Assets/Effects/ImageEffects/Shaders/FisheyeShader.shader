// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/FisheyeShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	
	// Shader code pasted into all further CGPROGRAM blocks
	CGINCLUDE
	
	#include "UnityCG.cginc"
	
	struct v2f {
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
	};
	
	sampler2D _MainTex;
<<<<<<< HEAD
	
=======
<<<<<<< HEAD
	half4 _MainTex_ST;

=======
	
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
	float2 intensity;
	
	v2f vert( appdata_img v ) 
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv = v.texcoord.xy;
		return o;
	} 
	
	half4 frag(v2f i) : SV_Target 
	{
		half2 coords = i.uv;
		coords = (coords - 0.5) * 2.0;		
		
		half2 realCoordOffs;
		realCoordOffs.x = (1-coords.y * coords.y) * intensity.y * (coords.x); 
		realCoordOffs.y = (1-coords.x * coords.x) * intensity.x * (coords.y);
		
<<<<<<< HEAD
		half4 color = tex2D (_MainTex, i.uv - realCoordOffs);	 
=======
<<<<<<< HEAD
		half4 color = tex2D (_MainTex, UnityStereoScreenSpaceUVAdjust(i.uv - realCoordOffs, _MainTex_ST));
=======
		half4 color = tex2D (_MainTex, i.uv - realCoordOffs);	 
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
