Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9C79FD
	for <loongarch@lists.linux.dev>; Wed, 27 Sep 2023 20:54:48 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c5b80fe118so162726465ad.3
        for <loongarch@lists.linux.dev>; Wed, 27 Sep 2023 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695848088; x=1696452888; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ojApjJdra5G2e9VG7iCI1/QYu+pQelbcKUfyRfxvagM=;
        b=F3xdXNVgiCx3gz13IRp3+C9WUV/1NPS44OJXqkAJRY7algNG4/bmSlzQG6vtNkLYi3
         PiC/V63ic58rsPT7G+yZE7gf4nUYavm7ByHjdx6LcL1N26qqZMxXvwokEFyQ6tS/xNjt
         5g11Txwg7aWwas4U8bkXZVmrjoqw3m8h8IALuphmq+7AniaM/UztDQHebpgUz8x8Y688
         xFVoODDT9cVsarC0msbuPfCT/vsliQu0ou7IlINB4jaK2+yrfrnTacXPGKkaM8fZsVZB
         vsJ8mzDU7gtPB/j/FHUydiXEZNwUdiONBYanoWiABob1gmom68Gb+YaXoS1GzUQmzZVe
         9aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695848088; x=1696452888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojApjJdra5G2e9VG7iCI1/QYu+pQelbcKUfyRfxvagM=;
        b=hLq+HhgYhZAow6Dj9U8XtyFGJLlo/wm1dwv5mA/pAlTrA7tUHn0F9Op/d23dwfPZeg
         x2+RZsfD5rED5p+Ip0FMCrbMF0TD16oPWD6fO4EJF7TcXFtfNhZml7cRkz6nHmqnLnWr
         1jdneMVfgoyOhk/6E4NNPy9qMUH41lH+ak0jNNZdFnz5oH+irNL7rW5iaPTHf2IoLWVQ
         //b9+W+hudO3PP5itE0TZYTYnMpFfmLN3z+upgGC5atGzbm5LYcfIC2gsxTBwSlWfHyk
         Y0g46zD8VNECP0nyE4B9kZVAmPOUWUDmVaAdNi3n5KhzDtaehTyn+XUp10RYQUb/Aq+W
         dQZA==
X-Gm-Message-State: AOJu0YzEYFTPCAfDn/iC3MN+UZeETGpav+67UZA6CYc+gTZJ1XLID409
	j8UUpboASaeIFBUmTHlS0NG8iD1fEW0=
X-Google-Smtp-Source: AGHT+IFj1EdT+JgGVa0wI51EvOhfb55LdAwkzQLPbe8TUXZIGLvgHWRpoJJlNYQvgrk8VKDZMzPRxZN9+I4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2452:b0:1bc:4c3d:eb08 with SMTP id
 l18-20020a170903245200b001bc4c3deb08mr39333pls.8.1695848088093; Wed, 27 Sep
 2023 13:54:48 -0700 (PDT)
Date: Wed, 27 Sep 2023 13:54:46 -0700
In-Reply-To: <20230807065137.3408970-4-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230807065137.3408970-1-zhaotianrui@loongson.cn> <20230807065137.3408970-4-zhaotianrui@loongson.cn>
Message-ID: <ZRSWlqS3zQBSLFVK@google.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: Add ucall test support for LoongArch
From: Sean Christopherson <seanjc@google.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 07, 2023, Tianrui Zhao wrote:
> Add ucall test support for LoongArch. A ucall is a "hypercall to
> userspace".

Nit, can you explain why LoongArch uses MMIO to trigger ucall, and what alternatives
were considred (if any)?  The main reason for the ask is because we've tossed
around the idea of converting all architectures (except s390) to MMIO-based ucall
in order to reduce the number of "flavors" of ucall we have to worry about it.
If MMIO is the only reasonable choice for LoongArch, that's another reason to
double down on MMIO as the primary choice for ucall.

> Based-on: <20230803022138.2736430-1-zhaotianrui@loongson.cn>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  .../selftests/kvm/lib/loongarch/ucall.c       | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/lib/loongarch/ucall.c
> 
> diff --git a/tools/testing/selftests/kvm/lib/loongarch/ucall.c b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> new file mode 100644
> index 000000000000..72868ddec313
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/loongarch/ucall.c
> @@ -0,0 +1,43 @@
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
> +	WRITE_ONCE(*ucall_exit_mmio_addr, uc);

Another uber nit, you might want to put this in the header as a static inline to
avoid function calls.  I doubt it'll actually matter, but we've had enough weird,
hard-to-debug issues with ucall that minimizing the amount of generated code might
save some future pain.
