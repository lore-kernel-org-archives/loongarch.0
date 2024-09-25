Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB30B1547E3
	for <loongarch@lists.linux.dev>; Wed, 25 Sep 2024 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727245082; cv=none; b=rrgGZamfWkOq2LrJlFmqXXso/R75dmgOtC7y2m+zE70lrZJAaV5el9TgIYpVLnUQsILp6WVM6y4RJkhVR4hIhaS4EnI9K1l1ZOcMLa86+ccef1qunbeCDxGiIzjau5ODno6ivOtCZNCrDOZ5u5OKZQGxFQSoEYlujN4Rg2YcvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727245082; c=relaxed/simple;
	bh=aHAbNSWKzAKrphe975SpARTujH9GMH69NKz2hP+CtPw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=e+gC2x3MXglHoKgGLkYA/UVX4b1xouIGNTe2l09ralCZJAtZFMWdLVyb0kM5oxveYAugAo8qUfmfFUzTGmAsfELGyKDU/jEUgY015QtrF+Xln6MxpPwwOjCpJbAATn6pGA3uw7GKrQOwhs4VG4f0akzJBNr/4euQL3VuRMp7ZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8AxffAUq_NmyBsAAA--.450S3;
	Wed, 25 Sep 2024 14:17:56 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front2 (Coremail) with SMTP id qciowMAxEuQSq_NmkvcRAA--.6832S2;
	Wed, 25 Sep 2024 14:17:55 +0800 (CST)
Subject: Re: [PATCH v5 2/2] Loongarch: EDAC driver for loongson memory
 controller
To: Huacai Chen <chenhuacai@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, bp@alien8.de,
 tony.luck@intel.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@xen0n.name, james.morse@arm.com,
 mchehab@kernel.org, rric@kernel.org, loongarch@lists.linux.dev
References: <20240925024038.9844-1-zhaoqunqin@loongson.cn>
 <20240925024038.9844-3-zhaoqunqin@loongson.cn>
 <CAAhV-H5e4TxqeZtSRjKUVs7=U=EZsGu8+TLVxv+qCknYkNCBFQ@mail.gmail.com>
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
Message-ID: <e5b5aa3f-c766-2966-72f1-0dbf08b1e19a@loongson.cn>
Date: Wed, 25 Sep 2024 14:17:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5e4TxqeZtSRjKUVs7=U=EZsGu8+TLVxv+qCknYkNCBFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qciowMAxEuQSq_NmkvcRAA--.6832S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF47ZrW5KF4DJFyDWw47Jrc_yoW3AFWDpF
	n8Aa1rCr48tr17GwsYvrWUXF1Yvw4fKF12k3y7tayakr9Fyryku3sYgry2kFn7Cr1DGr40
	va4rKwsruFs8KrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07j0WlkUUUUU=


在 2024/9/25 下午12:46, Huacai Chen 写道:
> Hi, Qunqin,
>
> The title should be "EDAC: Add EDAC driver for loongson memory controller"
Will fix
> On Wed, Sep 25, 2024 at 10:40 AM Zhao Qunqin <zhaoqunqin@loongson.cn> wrote:
>> Reports single bit errors (CE) only.
>>
>> Signed-off-by: Zhao Qunqin <zhaoqunqin@loongson.cn>
>> ---
>> Changes in v5:
>>          - Drop the loongson_ prefix from all static functions.
>>          - Align function arguments on the opening brace.
>>          - Drop useless comments and useless wrapper. Drop side comments.
>>          - Reorder variable declarations.
>>
>> Changes in v4:
>>          - None
>>
>> Changes in v3:
>>          - Addressed review comments raised by Krzysztof and Huacai
>>
>> Changes in v2:
>>          - Addressed review comments raised by Krzysztof
>>
>>   MAINTAINERS                  |   1 +
>>   arch/loongarch/Kconfig       |   1 +
>>   drivers/edac/Kconfig         |   8 ++
>>   drivers/edac/Makefile        |   1 +
>>   drivers/edac/loongson_edac.c | 168 +++++++++++++++++++++++++++++++++++
>>   5 files changed, 179 insertions(+)
>>   create mode 100644 drivers/edac/loongson_edac.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6cc8cfc8f..5b4526638 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13242,6 +13242,7 @@ M:      Zhao Qunqin <zhaoqunqin@loongson.cn>
>>   L:     linux-edac@vger.kernel.org
>>   S:     Maintained
>>   F:     Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
>> +F:     drivers/edac/loongson_edac.c
>>
>>   LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>>   M:     Sathya Prakash <sathya.prakash@broadcom.com>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 70f169210..9c135f1a2 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -181,6 +181,7 @@ config LOONGARCH
>>          select PCI_MSI_ARCH_FALLBACKS
>>          select PCI_QUIRKS
>>          select PERF_USE_VMALLOC
>> +       select EDAC_SUPPORT
>>          select RTC_LIB
>>          select SPARSE_IRQ
>>          select SYSCTL_ARCH_UNALIGN_ALLOW
>> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
>> index 81af6c344..719bb6ca7 100644
>> --- a/drivers/edac/Kconfig
>> +++ b/drivers/edac/Kconfig
>> @@ -564,5 +564,13 @@ config EDAC_VERSAL
>>            Support injecting both correctable and uncorrectable errors
>>            for debugging purposes.
>>
>> +config EDAC_LOONGSON3
>> +       tristate "Loongson-3 Memory Controller"
>> +       depends on LOONGARCH || COMPILE_TEST
>> +       help
>> +         Support for error detection and correction on the Loongson-3
>> +         family memory controller. This driver reports single bit
>> +         errors (CE) only. Loongson-3A5000/3C5000/3D5000/3C5000L/3A6000/3C6000
>> +         are compatible.
>>
>>   endif # EDAC
>> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
>> index faf310eec..e72ca1be4 100644
>> --- a/drivers/edac/Makefile
>> +++ b/drivers/edac/Makefile
>> @@ -88,3 +88,4 @@ obj-$(CONFIG_EDAC_DMC520)             += dmc520_edac.o
>>   obj-$(CONFIG_EDAC_NPCM)                        += npcm_edac.o
>>   obj-$(CONFIG_EDAC_ZYNQMP)              += zynqmp_edac.o
>>   obj-$(CONFIG_EDAC_VERSAL)              += versal_edac.o
>> +obj-$(CONFIG_EDAC_LOONGSON3)           += loongson_edac.o
> Change the Kconfig name to CONFIG_EDAC_LOONGSON, or change the file
> name to loongson3_edac.c may be a little better.
>
> Huacai
Will fix
>> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
>> new file mode 100644
>> index 000000000..2721dfba5
>> --- /dev/null
>> +++ b/drivers/edac/loongson_edac.c
>> @@ -0,0 +1,168 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024 Loongson Technology Corporation Limited.
>> + */
>> +
>> +#include <linux/edac.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "edac_module.h"
>> +
>> +enum ecc_index {
>> +       ECC_SET = 0,
>> +       ECC_RESERVED,
>> +       ECC_COUNT,
>> +       ECC_CS_COUNT,
>> +       ECC_CODE,
>> +       ECC_ADDR,
>> +       ECC_DATA0,
>> +       ECC_DATA1,
>> +       ECC_DATA2,
>> +       ECC_DATA3,
>> +};
>> +
>> +struct loongson_edac_pvt {
>> +       u64 *ecc_base;
>> +       int last_ce_count;
>> +};
>> +
>> +static int read_ecc(struct mem_ctl_info *mci)
>> +{
>> +       struct loongson_edac_pvt *pvt = mci->pvt_info;
>> +       u64 ecc;
>> +       int cs;
>> +
>> +       if (!pvt->ecc_base)
>> +               return pvt->last_ce_count;
>> +
>> +       ecc = pvt->ecc_base[ECC_CS_COUNT];
>> +       /* cs0 -- cs3 */
>> +       cs = ecc & 0xff;
>> +       cs += (ecc >> 8) & 0xff;
>> +       cs += (ecc >> 16) & 0xff;
>> +       cs += (ecc >> 24) & 0xff;
>> +
>> +       return cs;
>> +}
>> +
>> +static void edac_check(struct mem_ctl_info *mci)
>> +{
>> +       struct loongson_edac_pvt *pvt = mci->pvt_info;
>> +       int new, add;
>> +
>> +       new = read_ecc(mci);
>> +       add = new - pvt->last_ce_count;
>> +       pvt->last_ce_count = new;
>> +       if (add <= 0)
>> +               return;
>> +
>> +       edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
>> +                            0, 0, 0, 0, 0, -1, "error", "");
>> +       edac_mc_printk(mci, KERN_INFO, "add: %d", add);
>> +}
>> +
>> +static int get_dimm_config(struct mem_ctl_info *mci)
>> +{
>> +       struct dimm_info *dimm;
>> +       u32 size, npages;
>> +
>> +       /* size not used */
>> +       size = -1;
>> +       npages = MiB_TO_PAGES(size);
>> +
>> +       dimm = edac_get_dimm(mci, 0, 0, 0);
>> +       dimm->nr_pages = npages;
>> +       snprintf(dimm->label, sizeof(dimm->label),
>> +                "MC#%uChannel#%u_DIMM#%u", mci->mc_idx, 0, 0);
>> +       dimm->grain = 8;
>> +
>> +       return 0;
>> +}
>> +
>> +static void pvt_init(struct mem_ctl_info *mci, u64 *vbase)
>> +{
>> +       struct loongson_edac_pvt *pvt = mci->pvt_info;
>> +
>> +       pvt->ecc_base = vbase;
>> +       pvt->last_ce_count = read_ecc(mci);
>> +}
>> +
>> +static int edac_probe(struct platform_device *pdev)
>> +{
>> +       struct edac_mc_layer layers[2];
>> +       struct loongson_edac_pvt *pvt;
>> +       struct mem_ctl_info *mci;
>> +       u64 *vbase;
>> +       int ret;
>> +
>> +       vbase = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(vbase))
>> +               return PTR_ERR(vbase);
>> +
>> +       /* allocate a new MC control structure */
>> +       layers[0].type = EDAC_MC_LAYER_CHANNEL;
>> +       layers[0].size = 1;
>> +       layers[0].is_virt_csrow = false;
>> +       layers[1].type = EDAC_MC_LAYER_SLOT;
>> +       layers[1].size = 1;
>> +       layers[1].is_virt_csrow = true;
>> +       mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(*pvt));
>> +       if (mci == NULL)
>> +               return -ENOMEM;
>> +
>> +       mci->mc_idx = edac_device_alloc_index();
>> +       mci->mtype_cap = MEM_FLAG_RDDR4;
>> +       mci->edac_ctl_cap = EDAC_FLAG_NONE;
>> +       mci->edac_cap = EDAC_FLAG_NONE;
>> +       mci->mod_name = "loongson_edac.c";
>> +       mci->ctl_name = "loongson_edac_ctl";
>> +       mci->dev_name = "loongson_edac_dev";
>> +       mci->ctl_page_to_phys = NULL;
>> +       mci->pdev = &pdev->dev;
>> +       mci->error_desc.grain = 8;
>> +       /* Set the function pointer to an actual operation function */
>> +       mci->edac_check = edac_check;
>> +
>> +       pvt_init(mci, vbase);
>> +       get_dimm_config(mci);
>> +
>> +       ret = edac_mc_add_mc(mci);
>> +       if (ret) {
>> +               edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
>> +               edac_mc_free(mci);
>> +               return ret;
>> +       }
>> +       edac_op_state = EDAC_OPSTATE_POLL;
>> +
>> +       return 0;
>> +}
>> +
>> +static void edac_remove(struct platform_device *pdev)
>> +{
>> +       struct mem_ctl_info *mci = edac_mc_del_mc(&pdev->dev);
>> +
>> +       if (mci)
>> +               edac_mc_free(mci);
>> +}
>> +
>> +static const struct of_device_id loongson_edac_of_match[] = {
>> +       { .compatible = "loongson,ls3a5000-mc-edac", },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, loongson_edac_of_match);
>> +
>> +static struct platform_driver loongson_edac_driver = {
>> +       .probe          = edac_probe,
>> +       .remove         = edac_remove,
>> +       .driver         = {
>> +               .name   = "loongson-mc-edac",
>> +               .of_match_table = loongson_edac_of_match,
>> +       },
>> +};
>> +module_platform_driver(loongson_edac_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>");
>> +MODULE_DESCRIPTION("EDAC driver for loongson memory controller");
>> --
>> 2.43.0
>>
>>

