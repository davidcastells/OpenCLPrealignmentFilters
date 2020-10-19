echo "1) KERNEL SHD_3_100_100"
echo "========================================================"
grep "Kernel fmax" shd_3_100_100/build/acl_quartus_report.txt
head -n 90 shd_3_100_100/build/output_files/afu_fit.flow.rpt | tail -n 22

echo "2) KERNEL KMERS"
echo "========================================================"
grep "Kernel fmax" kmers/build/acl_quartus_report.txt
head -n 90 kmers/build/output_files/afu_fit.flow.rpt | tail -n 22
