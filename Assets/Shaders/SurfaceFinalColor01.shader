Shader "Custom/SurfaceFinalColor01" {
	Properties {
		_MainTex ("Main Tex", 2D) = "white"{}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert finalcolor:fc

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void fc (Input IN, SurfaceOutput o, inout fixed4 color) {
			float r = max(0, dot(float3(0.0, 0.0, -1.0), o.Normal));
			float g = max(0, dot(float3(0.0, 1.0, 0.0), o.Normal));
			float b = max(0, dot(float3(0.0, -1.0, 0.0), o.Normal));
			color += float4(r, g, b, 1.0) * 0.5;
		}

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		ENDCG
	}
	FallBack "Diffuse"
}
