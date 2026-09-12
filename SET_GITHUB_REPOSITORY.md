# Wire the final GitHub repository into MJMP

MJMP's update checker is intentionally dormant until the repository slug is known.

After creating the repository, set the CMake cache value to the exact `OWNER/REPOSITORY` slug before producing the public binary:

```powershell
cmake -S . -B out\build\x64-release -DMJMP_GITHUB_REPOSITORY="OWNER/MJMP" -DMJMP_PUBLIC_VERSION="1"
```

Your normal MJMP build script may already run CMake for you. In that case, set the same CMake cache variables in the project/build configuration rather than invoking a separate configure command.

The final executable must contain the real repository slug before `MJMPv1.exe` is uploaded to the GitHub Release. No repository URL is hard-coded in the publication skeleton itself.
