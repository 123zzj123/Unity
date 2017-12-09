using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class BuildABundle : MonoBehaviour {

    [MenuItem("Assets/Build Asset Bundles")]
    static void BuildABs()
    {
        // Put the bundles in a folder called "ABs" within the Assets folder.
        BuildPipeline.BuildAssetBundles(FileManager.RootPath, BuildAssetBundleOptions.None, BuildTarget.StandaloneWindows);
    }
}
