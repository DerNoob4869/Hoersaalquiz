Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _TopLeftColor ("Top Left Color", Color) = (1,1,1,1)
        _TopRightColor ("Top Right Color", Color) = (0,1,1,1)
        _BottomLeftColor ("Bottom Left Color", Color) = (0,0,1,1)
        _BottomRightColor ("Bottom Right Color", Color) = (0,0,0,1)
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"= "Transparent" }
        LOD 100
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            fixed4 _TopLeftColor;
            fixed4 _TopRightColor;
            fixed4 _BottomLeftColor;
            fixed4 _BottomRightColor;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // Blend horizontally first
                fixed4 bottom = lerp(_BottomLeftColor, _BottomRightColor, i.uv.x);
                fixed4 top = lerp(_TopLeftColor, _TopRightColor, i.uv.x);
                // Then blend vertically
                return lerp(bottom, top, i.uv.y);
            }
            ENDCG
        }
        
    }
    
}
