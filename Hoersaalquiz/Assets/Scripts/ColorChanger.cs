using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ColorChanger : MonoBehaviour
{
    [SerializeField] private Material mainBG;

    private Color topLeft;
    private Color topRight;
    private Color bottomLeft;
    private Color bottomRight;
    
    private void Start()
    {
        SetColor(0, new Color32(31, 171, 84, 255));
        SetColor(1, new Color32(126, 217, 87, 255));
        SetColor(2, new Color32(17, 171, 135, 255));
        SetColor(3, new Color32(17, 101, 48, 255));
    }

    private void SetColor(int colorPosition, Color color)
    {
        switch (colorPosition)
        {
            case 0:
                mainBG.SetColor("_TopLeftColor", color);
                break;

            case 1:
                mainBG.SetColor("_TopRightColor", color);
                break;

            case 2:
                mainBG.SetColor("_BottomLeftColor", color);
                break;

            case 3:
                mainBG.SetColor("_BottomRightColor", color);
                break;

            default:
                return;
        }
    }
}
