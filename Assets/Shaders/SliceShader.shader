Shader "Custom/SliceShader" {
	Properties {
		_DiffuseColor ("Color", Color) = (1,1,1)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }

		Cull off
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
//			float3 worldPos;
			float4 screenPos;
		};

		float4 _DiffuseColor;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
//			clip(frac(IN.worldPos.y * 10) - 0.5);
//			clip(frac((IN.screenPos.y / IN.screenPos.w) * 20) - 0.5);
			clip(frac((IN.screenPos.y / IN.screenPos.w) * 20) - 0.5);
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
