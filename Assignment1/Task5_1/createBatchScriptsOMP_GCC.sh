#!/bin/bash

jobType="516-ONLY_OMP_GCC" #this means only omp
outFolder="\$HOME/PoS/output"

for indexVar in {1..16}
do
        fileNameBase="jobtype$jobType-ncpus1-nthreads$indexVar-jobid\$JOB_ID"
        tempFileName="$fileNameBase.out"
        outFileName="$fileNameBase.csv"
        batchFileName="job-jobtype$jobType-nthreads$indexVar.cmd"

        echo -e "#!/bin/bash" \
        "\n#@ wall_clock_limit = 00:20:00"\
        "\n#@ job_name = pos-lulesh-openmp$indexVar"\
        "\n#@ job_type = MPICH"\
        "\n#@ class = test"\
        "\n#@ output = pos_lulesh_openmp_nthreads$indexVar-jobid\$(jobid).out" \
        "\n#@ error = pos_lulesh_openmp_nthreads$indexVar-jobid\$(jobid).out" \
        "\n#@ node = 1" \
        "\n#@ total_tasks = 16" \
        "\n#@ node_usage = not_shared" \
        "\n#@ energy_policy_tag = lulesh" \
        "\n#@ minimize_time_to_solution = yes" \
        "\n#@ island_count = 1" \
        "\n#@ environment = JOB_ID=\$(jobid);" \
        "\n#@ queue" \
        "\n. /etc/profile" \
        "\n. /etc/profile.d/modules.sh" \
        "\nexport OMP_NUM_THREADS=$indexVar" \
        "\n\$HOME/PoS/Assignment1/lulesh2.0.3_PRODUCTION/lulesh2.0_OMP_GCC > $tempFileName"\
        "\necho \"Run finished. Contents of temp. file ($tempFileName):\"; echo"\
        "\ncat $tempFileName"\
        "\nmkdir -p $outFolder"\
        "\n\$HOME/PoS/Assignment1/extractPerformanceMeasures.sh $tempFileName > $outFolder/$outFileName"\
        "\necho; echo \"Extraction finished. Contents of output file ($outFileName) in $outFolder:\"; echo"\
        "\ncat $outFolder/$outFileName" > "$batchFileName"
done

