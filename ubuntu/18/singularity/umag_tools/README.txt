Sequence of build steps:
1) Start from a container from cuda_base
2) Build first stage using prep/prep.def on the container from Step 1
3) Build second stage from the container from Step 2 to get golang in
4) Build second stage using muview/muview.def on the container from Step 3
5) Build third stage using oommf/oommf.def on the container from Step 4
6) "singularity shell" into the container from Step 5 and do the following:
    6.1) Extract the OOMMF archive that is saved in /opt during Step 5
    6.2) Enter the extracted directory and run the "make_oommf.sh" script in this directory
    6.3) "cd" back to parent directory of the directory extracted in Step 6.1
    6.4) Rename the directory extracted from Step 6.1 to the version of OOMMF
    6.5) "tar czf oommf.tgz" the renamed directory from Step 6.4
    6.6) Exit the singularity container
7) After oommf.tgz has been created from Step 6, build final stage using finalize_oommf.def
8) Build final stage using mumax/mumax.def on the container from Step 7
