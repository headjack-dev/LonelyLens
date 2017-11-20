using UnityEngine;
[ExecuteInEditMode]
public class LonelyLens : MonoBehaviour {
	private MeshRenderer meshRenderer;
	[Range(1f,360f)]
	public float angle=180;
	[Range(0f, 2f)]
	public float width = 1;
	
	//Execute only when visible
	void OnWillRenderObject()
	{
		if (meshRenderer == null)
		{
			GetMeshRenderer();
			return;
		}

		//Only apply when the material is present with a texture
		if (meshRenderer.sharedMaterial != null && meshRenderer.sharedMaterial.mainTexture != null)
		{
			//Aspect ratio and Aperture are calculated here once, then they are stored in the material's properties
			Material m = meshRenderer.sharedMaterial;
			m.SetFloat("_Aspect", (1f / m.mainTexture.height) / (1f / m.mainTexture.width));
			m.SetFloat("_Aperture", 1f / ((angle / 360 * Mathf.PI * 2) / width));
		}
	}

	//Grabs the meshrenderer and stores it in a cached variable
	private void GetMeshRenderer()
	{
		if (GetComponent<MeshRenderer>() != null)
		{
			meshRenderer = GetComponent<MeshRenderer>();
		}
	}
}
