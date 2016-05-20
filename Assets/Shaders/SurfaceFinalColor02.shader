Shader "Custom/SurfaceFinalColor02" {
	Properties {
		_MainTex ("Main Tex", 2D) = "white"{}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma vertex vert
		#pragma surface surf Lambert finalcolor:fc

		struct Input {
			float2 uv_MainTex;
			float customData;
		};

		sampler2D _MainTex;

		void fc (Input IN, SurfaceOutput o, inout fixed4 color) {
			color += float4(1.0, 0.0, 0.0, 1.0) * IN.customData;
		}

		void vert(inout appdata_full v, out Input data) {
			UNITY_INITIALIZE_OUTPUT(Input, data);
			data.customData = max(0, 0.5 * sin((v.vertex.y + _Time.x * 5) * 3.14159 * 8));
		}

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		ENDCG
	}
	FallBack "Diffuse"
}
