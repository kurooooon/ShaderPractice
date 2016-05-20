Shader "Custom/SurfaceVertexMod01" {
	Properties {
		_DiffuseColor ("Diffuse Color", Color) = (1,1,1)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma vertex vert
		#pragma surface surf Lambert// vertex:vert

		struct Input {
			float2 color:COLOR;
		};

		fixed3 _DiffuseColor;

		void vert (inout appdata_full v) {
			v.vertex.x += 0.05 * v.normal.x * sin((v.vertex.y + _Time.x * 3) * 3.14159 * 8);
			v.vertex.z += 0.05 * v.normal.z * sin((v.vertex.y + _Time.x * 3) * 3.14159 * 8);
		}

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _DiffuseColor;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
