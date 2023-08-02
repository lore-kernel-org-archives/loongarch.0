Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD579FF
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 17:01:36 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1bba7a32a40so1241025ad.0
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690995696; x=1691600496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoCuB3mffhSds51iMp00O5xm+yzIoOPBsVBHjFLh+kk=;
        b=KLHPbrCvHeyGLM2mw8D5f6rzBwkaj3O8dVqo8w7auH/ZjSB06l2wTkYC5pFLHf/78U
         5h8Frwj4ZSV54PbzQvd+uXOKXkwOmgjwEu90JEHUoJUxwWxSqbk0T2DrxN+GkE60zh7B
         hVQQbPhTOOd7h08BeGFSpCTp41ZpkKcaJOJfWvHgm9lPTMiVCxJAe66XjXBKR1V9KMFW
         4r9yr9u6C7TVLn2QStyR38cAdCj+fJaYtTsO1ZEym7WH4ByLunYi25lH1aj4eeWNla8Q
         nqyiuY6+o/3nPaNg/RiYAe9+5rTbvOU74ZvT0zz4vknk6DL0cOcQyOa57BUKgB0wDf31
         2mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995696; x=1691600496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoCuB3mffhSds51iMp00O5xm+yzIoOPBsVBHjFLh+kk=;
        b=lvKFLiLUhRlIM1ttje2Etyv9Y7gO032JodW/KbOh8gJY4+HZwQY8cCvNaHkDE9wzBV
         ElZLV0vbiy0ZimRjuX172iyaB6kmYBM/LLAzIG/RdMLDuHCmHNWpgjf/2GXcvpDJ89iW
         cyjXxRJoTsKQn4jPSlh/imLeSy3OJczdxokwD6hQuERxdSbUeAZqu/6/B1jEPvOYTUAc
         lM6QNZJpSPZ3FsO8nqgmGWTxP7GSoF7ONRHO/yoHyiHjKcY3KXO11/auTAfR/xGAxJa6
         ws5ylO13wl9EvSZqWEcTk9HmIJBYgjJ7UMawjb4czHcg70flz/PtXS+5Q/pWJyWKRLEE
         liQg==
X-Gm-Message-State: ABy/qLbsqp6D+WuShHVco2NoDMkhaWa2tVXeE5L1Hi3mBh2B6ANmoOVj
	GOuZtBNvJznHvYj0tLH/S0epoo13I4g=
X-Google-Smtp-Source: APBJJlHiO+JpDgTKgRQGQ+Hh7FpiBTRtLukpNuLqe7/AFsaAEDroKU0qv4eRDCr6/t6SMvae6PfaaoF5yL0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f682:b0:1b1:7336:2637 with SMTP id
 l2-20020a170902f68200b001b173362637mr92471plg.11.1690995695687; Wed, 02 Aug
 2023 10:01:35 -0700 (PDT)
Date: Wed, 2 Aug 2023 10:01:34 -0700
In-Reply-To: <20230801020206.1957986-2-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn> <20230801020206.1957986-2-zhaotianrui@loongson.cn>
Message-ID: <ZMqL7qPyngxOH4Y0@google.com>
Subject: Re: [PATCH v1 1/4] selftests: kvm: Add kvm selftests header files for LoongArch
From: Sean Christopherson <seanjc@google.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 01, 2023, Tianrui Zhao wrote:
> Add kvm selftests header files for LoongArch, including processor.h,
> sysreg.h, and kvm_util_base.h. Those mainly contain LoongArch CSR
> register defines and page table information.
> 
> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     |  5 ++
>  .../kvm/include/loongarch/processor.h         | 28 ++++++
>  .../selftests/kvm/include/loongarch/sysreg.h  | 89 +++++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/processor.h
>  create mode 100644 tools/testing/selftests/kvm/include/loongarch/sysreg.h
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 07732a157ccd..8747127e0bab 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -197,6 +197,11 @@ extern enum vm_guest_mode vm_mode_default;
>  #define MIN_PAGE_SHIFT			12U
>  #define ptes_per_page(page_size)	((page_size) / 8)
>  
> +#elif defined(__loongarch__)
> +#define VM_MODE_DEFAULT			VM_MODE_P36V47_16K
> +#define MIN_PAGE_SHIFT			14U
> +#define ptes_per_page(page_size)	((page_size) / 8)
> +
>  #endif
>  
>  #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
> diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
> new file mode 100644
> index 000000000000..d67796af51a0
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * LoongArch processor specific defines

Nit, my preference is to not bother with these types of comments, it should be
quite obvious from the file name that that everything in here is LoongArch
specific.

> + */
> +#ifndef SELFTEST_KVM_PROCESSOR_H
> +#define SELFTEST_KVM_PROCESSOR_H
> +
> +#include <linux/compiler.h>
> +#define _PAGE_VALID_SHIFT	0
> +#define _PAGE_DIRTY_SHIFT	1
> +#define _PAGE_PLV_SHIFT		2  /* 2~3, two bits */
> +#define _CACHE_SHIFT		4  /* 4~5, two bits */
> +#define _PAGE_PRESENT_SHIFT	7
> +#define _PAGE_WRITE_SHIFT	8
> +
> +#define PLV_KERN		0
> +#define PLV_USER		3
> +#define PLV_MASK		0x3
> +
> +#define _PAGE_VALID		(0x1UL << _PAGE_VALID_SHIFT)
> +#define _PAGE_PRESENT		(0x1UL << _PAGE_PRESENT_SHIFT)
> +#define _PAGE_WRITE		(0x1UL << _PAGE_WRITE_SHIFT)
> +#define _PAGE_DIRTY		(0x1UL << _PAGE_DIRTY_SHIFT)
> +#define _PAGE_USER		(PLV_USER << _PAGE_PLV_SHIFT)
> +#define __READABLE		(_PAGE_VALID)
> +#define __WRITEABLE		(_PAGE_DIRTY | _PAGE_WRITE)
> +#define _CACHE_CC		(0x1UL << _CACHE_SHIFT) /* Coherent Cached */
> +#endif
> diff --git a/tools/testing/selftests/kvm/include/loongarch/sysreg.h b/tools/testing/selftests/kvm/include/loongarch/sysreg.h
> new file mode 100644
> index 000000000000..04f53674c9d8
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/loongarch/sysreg.h

Any reason these can't simply go in processor.h?  Neither file is particular large,
especially for CPU definition files.

> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTEST_KVM_SYSREG_H
> +#define SELFTEST_KVM_SYSREG_H
> +
> +/*
> + * note that this declaration raises a checkpatch warning, but
> + * no good way to avoid it.
> + */

Definitely drop this comment, once the patch is applied the fact that checkpatch
complains is irrelevant.

> +#define zero	$r0
