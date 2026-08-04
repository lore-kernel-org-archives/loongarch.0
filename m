Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C00A3FBB72
	for <loongarch@lists.linux.dev>; Tue,  4 Aug 2026 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813610; cv=none; b=iErqzYVDdeMIIl4DikBMoNs0jwifu8yjV3lS8VSDi+M3PV6fk1uBNswMUTYbk4VYX5J/yIHTD9eZAJrGag7YDejOTZe0LxeEjXKJs4V8kB7z/E5YdLllIv/n+RHs28Gm8fLSrQue0nI/edJPNPxY3vii/YkWI6ibWDnMm6CFKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813610; c=relaxed/simple;
	bh=oAoLlpVBHu9+aPIXf8SCnelrPknNeVmldY1sjk5npes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phpHqm94GBrHy0cofjic0SnVJteCj+L1XbBIBAvWhuR/I9QvEu4ZJLe5Et70j/mgv72yQ+JDHm/pUyzP+9RZPtt0WEdHueDLIncstNbQhQl3CqMP8neAlk1SSST5fbYKbv3z8Ja9Gy3zDNWAgYDq3IZTFhGkMrX6Hr67Lz5EoKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.102])
	by gateway (Coremail) with SMTP id _____8BxVeplWnFqoicKAA--.31786S3;
	Tue, 04 Aug 2026 11:20:05 +0800 (CST)
Received: from [10.20.42.102] (unknown [10.20.42.102])
	by front1 (Coremail) with SMTP id qMiowJDxDcdkWnFqde8iAA--.57585S2;
	Tue, 04 Aug 2026 11:20:04 +0800 (CST)
Message-ID: <6a7f9cf6-3998-4365-b949-fad33ea14dbe@loongson.cn>
Date: Tue, 4 Aug 2026 11:19:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Huacai Chen <chenhuacai@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>,
 Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
References: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
 <CAAhV-H4gQ=DZC+TmvMtrtV4FM7wrRibHFu-dAyVkxo0j2Fkbrg@mail.gmail.com>
Content-Language: en-US
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
In-Reply-To: <CAAhV-H4gQ=DZC+TmvMtrtV4FM7wrRibHFu-dAyVkxo0j2Fkbrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxDcdkWnFqde8iAA--.57585S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr1ruw4fGrWfGw1UCF1xJFc_yoWrZry5pF
	47C3WYkr45trnruanaqry7ZFyavrs5KFZFqrs7ta48Cr9Fy3s7XFyfKr42kF9rCryrGFyI
	vas8Gr4xuF1DJFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU


在 2026/8/3 16:25, Huacai Chen 写道:
> Hi, Qunqin,
>
> On Thu, Jul 30, 2026 at 2:45 PM Qunqin Zhao <zhaoqunqin@loongson.cn> wrote:
>> From: Wang Jinwei <wangjinwei@loongson.cn>
>>
>> On Loongson multi-node systems, memory controllers are distributed
>> across multiple nodes. Encode node and MC information into mc_idx
>> so that sysfs entries uniquely identify each controller.
>>
>> The driver gets mc-idx from ACPI _DSD property 'mc-idx' if firmware
>> provides it. If not, it falls back to edac_device_alloc_index() for
>> legacy firmware compatibility.
>>
>> The number of memory controllers per node (mc-per-node) is obtained
>> from firmware via ACPI _DSD property, with a default of 4 for
>> backward compatibility. The node and MC IDs are decoded from mc_idx:
>>       node = mc_idx / mc_per_node
>>       mc = mc_idx % mc_per_node
>>
>> For example, with mc-per-node=4:
>>       mc-idx 0-3   -> node0 mc0-mc3
>>       mc-idx 4-7   -> node1 mc0-mc3
>>       ...
>>       mc-idx 28-31 -> node7 mc0-mc3
>>
>> The dmesg output looks like this：
>> Before: (no _DSD mc-idx)
>> EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
>> page:0x0 offset:0x0 grain:8 syndrome:0x0)
>>
>> After: (_DSD mc-idx)
>> EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
>> page:0x0 offset:0x0 grain:8 syndrome:0x0 - node:0 mc:3)
>>
>> Cc: Yulong Wang <wangyulong@loongson.cn>
>> Cc: Dongyan Qian <qiandongyan@loongson.cn>
>> Cc: Chao Li <lichao@loongson.cn>
>> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
>> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>> ---
>>   drivers/edac/loongson_edac.c | 38 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
>> index 38745800ed..f2452e98f5 100644
>> --- a/drivers/edac/loongson_edac.c
>> +++ b/drivers/edac/loongson_edac.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/property.h>
>>   #include "edac_module.h"
>>
>>   #define ECC_CS_COUNT_REG       0x18
>> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
>>           * register state.
>>           */
>>          int last_ce_count;
>> +       int mc_per_node;
> I think mcs_per_node is better than mc_per_node.
>
>> +       bool mc_idx_valid;
>>   };
>>
>>   static int read_ecc(struct mem_ctl_info *mci)
>> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>>   static void edac_check(struct mem_ctl_info *mci)
>>   {
>>          struct loongson_edac_pvt *pvt = mci->pvt_info;
>> -       int new, add;
>> +       char other_detail[64];
> Use char other_detail[64] = {0}, then we can drop the 'else' branch below.
>
>> +       int new, add, node, mc;
>>
>>          new = read_ecc(mci);
>>          add = new - pvt->last_ce_count;
>> @@ -52,8 +56,17 @@ static void edac_check(struct mem_ctl_info *mci)
>>          if (add <= 0)
>>                  return;
>>
>> +       if (pvt->mc_idx_valid) {
>> +               node = mci->mc_idx / pvt->mc_per_node;
>> +               mc = mci->mc_idx % pvt->mc_per_node;
>> +               snprintf(other_detail, sizeof(other_detail),
>> +                               "node:%d mc:%d", node, mc);
> The snprintf() can be put in oneline.
>
>> +       } else {
>> +               other_detail[0] = '\0';
>> +       }
>> +
>>          edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
>> -                            0, 0, 0, 0, 0, -1, "error", "");
>> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>>   }
>>
>>   static void dimm_config_init(struct mem_ctl_info *mci)
>> @@ -72,20 +85,26 @@ static void dimm_config_init(struct mem_ctl_info *mci)
>>          dimm->grain = 8;
>>   }
>>
>> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
>> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
>> +               bool mc_idx_valid, int mc_per_node)
> The function definition can be put in one line.
>
>>   {
>>          struct loongson_edac_pvt *pvt = mci->pvt_info;
>>
>>          pvt->ecc_base = vbase;
>>          pvt->last_ce_count = read_ecc(mci);
>> +       pvt->mc_idx_valid = mc_idx_valid;
>> +       pvt->mc_per_node = mc_per_node;
>>   }
>>
>>   static int edac_probe(struct platform_device *pdev)
>>   {
>>          struct edac_mc_layer layers[2];
>>          struct mem_ctl_info *mci;
>> +       struct device *dev = &pdev->dev;
>>          void __iomem *vbase;
>> +       u32 mc_per_node;
>>          int ret;
>> +       bool mc_idx_valid;
> Use bool mc_idx_valid = true, then we can drop the 'else' branch below.

Will fix all,

Thanks

>
> Huacai
>
>
>

