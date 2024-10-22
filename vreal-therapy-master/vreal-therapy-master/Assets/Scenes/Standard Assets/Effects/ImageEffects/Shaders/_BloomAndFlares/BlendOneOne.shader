// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/BlendOneOne" {
	Properties {
		_MainTex ("-", 2D) = "" {}
	}
	
	CGINCLUDE

	#include "UnityCG.cginc"
	
	struct v2f {
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
	};
		
	sampler2D _MainTex;
<<<<<<< HEAD
	half4     _MainTex_ST;
=======
>>>>>>> refs/remotes/origin/master
	half _Intensity;
		
	v2f vert( appdata_img v ) {
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
<<<<<<< HEAD
		o.uv = UnityStereoScreenSpaceUVAdjust(v.texcoord.xy, _MainTex_ST);
=======
		o.uv =  v.texcoord.xy;
>>>>>>> refs/remotes/origin/master
		return o;
	}
	
	half4 frag(v2f i) : SV_Target {
		return tex2D(_MainTex, i.uv) * _Intensity;
	}

	ENDCG
	
Subshader {

  Pass {
  		BlendOp Add
  		Blend One One
  
	  ZTest Always Cull Off ZWrite Off

      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
      ENDCG
  }
}

Fallback off
	
}
