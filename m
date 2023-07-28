Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F17AD45
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 06:17:47 +0000 (UTC)
X-UUID: 396d4dbed1354d1eab9d06acfbe96f85-20230728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:475f62b3-5a79-4e92-8548-a55a316fe131,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:6
X-CID-INFO: VERSION:1.1.28,REQID:475f62b3-5a79-4e92-8548-a55a316fe131,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:6
X-CID-META: VersionHash:176cd25,CLOUDID:18c58c42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230728112732139381RX,BulkQuantity:2,Recheck:0,SF:24|17|19|43|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: 396d4dbed1354d1eab9d06acfbe96f85-20230728
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 189198503; Fri, 28 Jul 2023 14:01:35 +0800
From: Enze Li <lienze@kylinos.cn>
To: Jackie Liu <liu.yun@linux.dev>
Cc: chenhuacai@kernel.org,  kernel@xen0n.name,  loongarch@lists.linux.dev,
  glider@google.com,  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 4/4 v2] LoongArch: Add KFENCE support
In-Reply-To: <fa3dcc1b-03b2-567c-b143-8e3a100af9f6@linux.dev> (Jackie Liu's
	message of "Tue, 25 Jul 2023 22:34:50 +0800")
References: <20230725061451.1231480-1-lienze@kylinos.cn>
	<20230725061451.1231480-5-lienze@kylinos.cn>
	<fa3dcc1b-03b2-567c-b143-8e3a100af9f6@linux.dev>
Date: Fri, 28 Jul 2023 14:01:25 +0800
Message-ID: <87sf98a822.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25 2023 at 10:34:50 PM +0800, Jackie Liu wrote:

> =E5=9C=A8 2023/7/25 14:14, Enze Li =E5=86=99=E9=81=93:
>> The LoongArch architecture is quite different from other architectures.
>> When the allocating of KFENCE itself is done, it is mapped to the direct
>> mapping configuration window [1] by default on LoongArch.  It means that
>> it is not possible to use the page table mapped mode which required by
>> the KFENCE system and therefore it should be remapped to the appropriate
>> region.
>>
>> This patch adds architecture specific implementation details for KFENCE.
>> In particular, this implements the required interface in <asm/kfence.h>.
>>
>> Tested this patch by running the testcases and all passed.
>>
>> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN=
.html#virtual-address-space-and-address-translation-mode
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>   arch/loongarch/Kconfig               |  1 +
>>   arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>>   arch/loongarch/include/asm/pgtable.h | 14 ++++++-
>>   arch/loongarch/mm/fault.c            | 22 ++++++----
>>   4 files changed, 90 insertions(+), 9 deletions(-)
>>   create mode 100644 arch/loongarch/include/asm/kfence.h
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 70635ea3d1e4..5b63b16be49e 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -91,6 +91,7 @@ config LOONGARCH
>>   	select HAVE_ARCH_AUDITSYSCALL
>>   	select HAVE_ARCH_JUMP_LABEL
>>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>> +	select HAVE_ARCH_KFENCE
>>   	select HAVE_ARCH_MMAP_RND_BITS if MMU
>>   	select HAVE_ARCH_SECCOMP_FILTER
>>   	select HAVE_ARCH_TRACEHOOK
>> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/includ=
e/asm/kfence.h
>> new file mode 100644
>> index 000000000000..fb39076fe4d7
>> --- /dev/null
>> +++ b/arch/loongarch/include/asm/kfence.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * KFENCE support for LoongArch.
>> + *
>> + * Author: Enze Li <lienze@kylinos.cn>
>> + * Copyright (C) 2022-2023 KylinSoft Corporation.
>> + */
>> +
>> +#ifndef _ASM_LOONGARCH_KFENCE_H
>> +#define _ASM_LOONGARCH_KFENCE_H
>> +
>> +#include <linux/kfence.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/tlb.h>
>> +
>> +static inline bool arch_kfence_init_pool(void)
>> +{
>> +	char *kfence_pool =3D __kfence_pool;
>> +	struct vm_struct *area;
>> +	int err;
>> +
>> +	area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
>> +				    KFENCE_AREA_START, KFENCE_AREA_END,
>> +				    __builtin_return_address(0));
>> +	if (!area)
>> +		return false;
>> +
>> +	__kfence_pool =3D (char *)area->addr;
>
> I think there should be something wrong here.
>
>> +	err =3D ioremap_page_range((unsigned long)__kfence_pool,
>> +				 (unsigned long)__kfence_pool + KFENCE_POOL_SIZE,
>> +				 virt_to_phys((void *)kfence_pool),
>> +				 PAGE_KERNEL);
>> +	if (err) {
>> +		free_vm_area(area);
>
> If err > 0, return area->addr here, It's not correct.

Hi Jackie,

Good catch!  I'll fix this issue in v3.

Cheers!
Enze

