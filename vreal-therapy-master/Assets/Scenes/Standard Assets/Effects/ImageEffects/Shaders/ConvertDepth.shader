// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/ConvertDepth" {
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
	sampler2D_float _CameraDepthTexture;
<<<<<<< HEAD
		
=======
<<<<<<< HEAD
	
	half4 _CameraDepthTexture_ST;

=======
		
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
	v2f vert( appdata_img v ) 
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
<<<<<<< HEAD
		o.uv =  v.texcoord.xy;
=======
<<<<<<< HEAD
		o.uv = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _CameraDepthTexture_ST);
=======
		o.uv =  v.texcoord.xy;
>>>>>>> refs/remotes/origin/master
>>>>>>> 87fb0707558dbdf9a88b039e2227592365d113ff
		return o;
	}
	
	half4 frag(v2f i) : SV_Target 
	{
		float d = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv.xy);
		d = Linear01Depth(d);
			 
		if(d>0.99999)
			return half4(1,1,1,1);
		else
			return EncodeFloatRGBA(d); 
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
