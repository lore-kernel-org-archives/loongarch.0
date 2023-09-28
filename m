Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F129379CC
	for <loongarch@lists.linux.dev>; Thu, 28 Sep 2023 04:04:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.40.46.158])
	by gateway (Coremail) with SMTP id _____8BxIvBM+xRliawtAA--.21179S3;
	Thu, 28 Sep 2023 12:04:29 +0800 (CST)
Received: from [192.168.124.126] (unknown [10.40.46.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvi9K+xRlXwEVAA--.43483S3;
	Thu, 28 Sep 2023 12:04:28 +0800 (CST)
Subject: Re: [PATCH v2 3/4] KVM: selftests: Add ucall test support for
 LoongArch
To: Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
References: <20230807065137.3408970-1-zhaotianrui@loongson.cn>
 <20230807065137.3408970-4-zhaotianrui@loongson.cn>
 <ZRSWlqS3zQBSLFVK@google.com>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <8ac800d7-144d-22f4-fe2c-206aecc9a5dd@loongson.cn>
Date: Thu, 28 Sep 2023 12:04:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZRSWlqS3zQBSLFVK@google.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Dxvi9K+xRlXwEVAA--.43483S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxurW7Kw4Uur43uF1ktF4UZFc_yoW5Jw4kpa
	4kC3W5Kr4rKry7AasxXw1vq3WSyrZ7KF4rZr1ayryF9wsFyr1fAr1fKF1jkFy5ua4vgr1k
	ZFn2gwnIkF1qk3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzksgUU
	UUU


ÔÚ 2023/9/28 ÉÏÎç4:54, Sean Christopherson Ð´µÀ:
> On Mon, Aug 07, 2023, Tianrui Zhao wrote:
>> Add ucall test support for LoongArch. A ucall is a "hypercall to
>> userspace".
> Nit, can you explain why LoongArch uses MMIO to trigger ucall, and what alternatives
> were considred (if any)?  The main reason for the ask is because we've tossed
> around the idea of converting all architectures (except s390) to MMIO-based ucall
> in order to reduce the number of "flavors" of ucall we have to worry about it.
> If MMIO is the only reasonable choice for LoongArch, that's another reason to
> double down on MMIO as the primary choice for ucall.
Thanks for your reminding about ucall, and our guest can also use 
hypercall instruction to trigger ucall, so this change will not affect us.

Thanks
Tianrui Zhao
>
>> Based-on: <20230803022138.2736430-1-zhaotianrui@loongson.cn>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   .../selftests/kvm/lib/loongarch/ucall.c       | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
>>
>> diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
>> new file mode 100644
>> index 000000000000..72868ddec313
>> --- /dev/null
>> +++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
>> @@ -0,0 +1,43 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ucall support. A ucall is a "hypercall to userspace".
>> + *
>> + */
>> +#include "kvm_util.h"
>> +
>> +/*
>> + * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
>> + * VM), it must not be accessed from host code.
>> + */
>> +static vm_vaddr_t *ucall_exit_mmio_addr;
>> +
>> +void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
>> +{
>> +	vm_vaddr_t mmio_gva = vm_vaddr_unused_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
>> +
>> +	virt_map(vm, mmio_gva, mmio_gpa, 1);
>> +
>> +	vm->ucall_mmio_addr = mmio_gpa;
>> +
>> +	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gva);
>> +}
>> +
>> +void ucall_arch_do_ucall(vm_vaddr_t uc)
>> +{
>> +	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
> Another uber nit, you might want to put this in the header as a static inline to
> avoid function calls.  I doubt it'll actually matter, but we've had enough weird,
> hard-to-debug issues with ucall that minimizing the amount of generated code might
> save some future pain.

