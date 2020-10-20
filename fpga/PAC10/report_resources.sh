echo "1) KERNEL SHD_3_VAR"
echo "========================================================"
grep "Kernel fmax" shd_3_var/build/acl_quartus_report.txt
head -n 90 shd_3_var/build/output_files/afu_fit.flow.rpt | tail -n 22

echo "2) KERNEL SHD_3_100_100"
echo "========================================================"
grep "Kernel fmax" shd_3_100_100/build/acl_quartus_report.txt
head -n 90 shd_3_100_100/build/output_files/afu_fit.flow.rpt | tail -n 22

echo "3) KERNEL KMERS_VAR"
echo "========================================================"
grep "Kernel fmax" kmers_var/quartus_sh_compile.log
head -n 90 kmers_var/build/output_files/afu_fit.flow.rpt | tail -n 22

echo "4) KERNEL KMERS_100_100"
echo "========================================================"
grep "Kernel fmax" kmers_100_100/quartus_sh_compile.log
head -n 90 kmers_100_100/build/output_files/afu_fit.flow.rpt | tail -n 22
