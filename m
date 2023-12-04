Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146DFEDF
	for <loongarch@lists.linux.dev>; Mon,  4 Dec 2023 02:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8Dx_+v_M21l8qE+AA--.58077S3;
	Mon, 04 Dec 2023 10:05:51 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxiuT_M21lashTAA--.55524S3;
	Mon, 04 Dec 2023 10:05:51 +0800 (CST)
Subject: Re: [PATCH v5 3/4] KVM: selftests: Add ucall test support for
 LoongArch
To: Tianrui Zhao <zhaotianrui@loongson.cn>, Shuah Khan <shuah@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Peter Xu <peterx@redhat.com>,
 Vipin Sharma <vipinsh@google.com>
References: <20231130111804.2227570-1-zhaotianrui@loongson.cn>
 <20231130111804.2227570-4-zhaotianrui@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <de23c3f6-556a-1ddb-bd1e-01bf249cfceb@loongson.cn>
Date: Mon, 4 Dec 2023 10:05:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231130111804.2227570-4-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxiuT_M21lashTAA--.55524S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAryfKF45Zr4UXF45Jr45CFX_yoW5Cw4Dpa
	4rA3WrKr4xKF17A3s3Jw1qq3Z3Grs2kF1xZ342qrWF9w42y3WxJr1xKFyjyFyxtr4ktFs5
	ZFn2ganruF1Ut3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jn3kZUUUUU=



On 2023/11/30 下午7:18, Tianrui Zhao wrote:
> Add ucall test support for LoongArch. A ucall is a "hypercall to
> userspace".
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   .../selftests/kvm/include/loongarch/ucall.h   | 28 ++++++++++++++
>   .../selftests/kvm/lib/loongarch/ucall.c       | 38 +++++++++++++++++++
>   2 files changed, 66 insertions(+)
>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/ucall.h
>   create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
> 
> diff --git a/tools/testing/selftests/kvm/include/loongarch/ucall.h b/tools/testing/selftests/kvm/include/loongarch/ucall.h
> new file mode 100644
> index 00000000000..e9033ea6fbf
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/loongarch/ucall.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTEST_KVM_UCALL_H
> +#define SELFTEST_KVM_UCALL_H
> +
> +#include "kvm_util_base.h"
> +
> +#define UCALL_EXIT_REASON       KVM_EXIT_MMIO
> +
> +/*
> + * Default base address for application loading is 0x120000000,
> + * DEFAULT_GUEST_TEST_MEM should be larger than app loading address,
> + * so that PER_VCPU_MEM_SIZE can be large enough, and kvm selftests
> + * app size is smaller than 256M in generic
> + */
> +#define DEFAULT_GUEST_TEST_MEM	0x130000000
> +
> +/*
> + * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
> + * VM), it must not be accessed from host code.
> + */
> +extern vm_vaddr_t *ucall_exit_mmio_addr;
> +
> +static inline void ucall_arch_do_ucall(vm_vaddr_t uc)
> +{
> +	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
> +}
> +
> +#endif
> diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> new file mode 100644
> index 00000000000..fc6cbb50573
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ucall support. A ucall is a "hypercall to userspace".
> + *
> + */
> +#include "kvm_util.h"
> +
> +/*
> + * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
> + * VM), it must not be accessed from host code.
> + */
> +vm_vaddr_t *ucall_exit_mmio_addr;
> +
> +void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
> +{
> +	vm_vaddr_t mmio_gva = vm_vaddr_unused_gap(vm, vm->page_size, KVM_UTIL_MIN_VADDR);
> +
> +	virt_map(vm, mmio_gva, mmio_gpa, 1);
> +
> +	vm->ucall_mmio_addr = mmio_gpa;
> +
> +	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gva);
> +}
> +
> +void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_run *run = vcpu->run;
> +
> +	if (run->exit_reason == KVM_EXIT_MMIO &&
> +	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
> +		TEST_ASSERT(run->mmio.is_write && run->mmio.len == sizeof(uint64_t),
> +			    "Unexpected ucall exit mmio address access");
> +
> +		return (void *)(*((uint64_t *)run->mmio.data));
> +	}
> +
> +	return NULL;
> +}
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

