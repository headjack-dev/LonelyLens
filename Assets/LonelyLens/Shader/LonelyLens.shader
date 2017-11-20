Shader "Hidden/LonelyLens" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "black" {}
	}
	SubShader { 
		//Render behind everything
		Tags { "RenderType"="Opaque" "Queue"="Background" }

		LOD 100
		cull off
		ZWrite off
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			struct v2f
			{
				float4 vertex : SV_POSITION;
				float3 pos : TEXCOORD0;
			};
			sampler2D _MainTex;

			//Aspect and Aperture from CS script are stored here
			half _Aspect, _Aperture;

			v2f vert (float4 vertex : POSITION)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(vertex);

				//The pixel shader needs the vertex positions
				o.pos=vertex.xyz;

				return o;
			}
			fixed4 frag (v2f i) : SV_Target
			{ 
				//The following code is based on this diagram:
				//http://paulbourke.net/dome/dualfish2sphere/diagram.pdf
				fixed2 r = float2(atan2(length(i.pos.xy),i.pos.z)*_Aperture,atan2(i.pos.y,i.pos.x));
				fixed2 uv=.5+(float2(r.x*cos(r.y),r.x*sin(r.y)*_Aspect));

				//return the position's color or return black when out of bounds
				return tex2D(_MainTex,uv)*all(ceil(uv)==1);
			}
			ENDCG
		}
	}
}
 