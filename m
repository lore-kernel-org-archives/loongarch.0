Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D071100A7
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 18:08:45 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1bb962ada0dso1040045ad.2
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690999725; x=1691604525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoApKlnA3BOMzrINClENLRSkWlEARK57ybrSJylcOSk=;
        b=mj8VbGefF2duwlheVOgxf6z54EG8zmMmwTerkgYKRlKthiOTNJifWNjqGPpmd4UZ+U
         jjcOJOa08SbKJsGvXjtH9ppHkQYcI5kWP9kAzRpXklc+WxAV4dGSR9oFYXt04TzNoPIz
         IUQigpkiYepYDIpfvkkuk8E2MptKkOHgh4xjhGnNHqYRhj6SfsgdRH7Hto6bXzz5ErOv
         OMqP/Q2jm6rY5LXXUeKeOFb/e1cztAh+2HFBnvBi1IFIs/YsWXNMY2SE/bz7t/l04EXv
         uK6l60t/yG7NWonZPOCCnfaL51hwuUDMw1osNl0M+Bnv5Ea/cbFAhozDp05c++rkQODw
         WIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999725; x=1691604525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoApKlnA3BOMzrINClENLRSkWlEARK57ybrSJylcOSk=;
        b=I8aPYVzB1/i9Y35LwGlDQzHPQJuHQKOx75lDIpKvyh9fBewoTuo6xHQaLXkWtnu5jb
         UvNbFC4patqMGAC8x4xTdS6MX7BNEn1ymEEHTwxnZUVbHlDkWiG8KgO7EAs8V8FFWR3E
         Vo0VG78g6M82BLPfnmXCi4I8U2t2VQd4QMj2S34pMuUnVy/DQ/FIRTs4iB8gEZU0iiys
         r5F9WrvKsevPDPlyIm12xFCrDyYaxwdtLNsXY4nsySI5EpgnCh9e/lsDbbQN08WmwOWy
         mlqlFqkWNo6r1Fjn6t7b0MM9Fm8hSvfGlWxo2dXilBoHkLUuoZgnTbGULsG3nnou454d
         N//w==
X-Gm-Message-State: ABy/qLaWXWu0sk30BpMfXYjoTBCEUS7uCkjwF1I/qO2v8n3YmjsdXwjN
	Ulyzv/Js7kVplCrg+zY8xfyEJGaJ2tc=
X-Google-Smtp-Source: APBJJlEeF7I0FXR0/6QBoPjTbpdgB66W+HdBQlQvhmyKptIb79nGiaNg42b1W+sntglGzdI0lqKbdFcMnCs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e5c1:b0:1b7:edcd:8dcf with SMTP id
 u1-20020a170902e5c100b001b7edcd8dcfmr98398plf.4.1690999724892; Wed, 02 Aug
 2023 11:08:44 -0700 (PDT)
Date: Wed, 2 Aug 2023 11:08:43 -0700
In-Reply-To: <20230801020206.1957986-4-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn> <20230801020206.1957986-4-zhaotianrui@loongson.cn>
Message-ID: <ZMqbqwuCdI2XpJ9q@google.com>
Subject: Re: [PATCH v1 3/4] selftests: kvm: Add ucall tests for LoongArch KVM
From: Sean Christopherson <seanjc@google.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 01, 2023, Tianrui Zhao wrote:
> Add ucall tests for LoongArch KVM, it means that VM use hypercall

s/tests/support

> to return to userspace and handle the mmio exception.
> 
> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  .../selftests/kvm/lib/loongarch/ucall.c       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
> 
> diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> new file mode 100644
> index 000000000000..b32f7c7f6548
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> @@ -0,0 +1,44 @@
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
> +static vm_vaddr_t *ucall_exit_mmio_addr;
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
> +void ucall_arch_do_ucall(vm_vaddr_t uc)
> +{
> +

Extra newline.

> +	WRITE_ONCE(*ucall_exit_mmio_addr, uc);
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
> -- 
> 2.39.1
> 
