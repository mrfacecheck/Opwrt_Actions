#!/bin/bash
cd $RK3328_DIR
#use fanck0605 defconfig
wget https://github.com/fanck0605/nanopi-r2s/raw/lean/nanopi-r2_linux_defconfig
cat ./nanopi-r2_linux_defconfig > ./kernel/arch/arm64/configs/nanopi-r2_linux_defconfig
echo '
CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y
' >> ./kernel/arch/arm64/configs/nanopi-r2_linux_defconfig
#.config
rm -f friendlywrt/.config*
cat configs/config_rk3328 | grep "TARGET" >> ../seed/base_rk3328.seed
cat ../$CONFIG_FILE >> ../seed/base_rk3328.seed
cat ../seed/base_rk3328.seed > ./configs/config_rk3328
chmod -R 755 ./
exit 0
