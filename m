Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2FFC07
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 18:10:53 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1bb962ada0dso1053915ad.2
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690999853; x=1691604653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNOi1ejB1pS9dlnPvTd4BYpS5FGTlhXd3925hg/0fm0=;
        b=1OE6veZg59gsoeCLHSoB+UkPlLRLs1s07mLxso/osH78WHkdAyjyM4PFg5Fl4ie4bF
         8Qo+8PDNUg50lP5ODwwCYp4j7hvQjDe7PTVUeYd+qQ8VWZ0FPNt4U58Lca5UL+4tPn+h
         P2AQIfN8/ciTQ7eTvI9WfNCJ2Yw8sJqnjprqmUrBmOebKgbeUxbvIcy83OAqQuxMlUHz
         Ka/cmhhuQX+2eepM+r+ZZwEm9yWdteKzIfjvrX0OC7HWPhtD3ANjTNIcySs2o1S1qbtD
         6F64Y2wQS7ACru2HtGrPU40xivGqU91vFZx/cKdsS27iWoCyFLSe/lPv3rzAL4XHHGha
         Kwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999853; x=1691604653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNOi1ejB1pS9dlnPvTd4BYpS5FGTlhXd3925hg/0fm0=;
        b=iJ3tWrKB7jU/SDi2u9UrrtvQLYbawH+c2t7xrHrET9U3I0SV2W43YnsRO0MXb+VXIa
         XURx592lyq6lVv6U/dRQ/8f3qWAwDc/n6WMIhRyl9rUA9k8N8mgwkJDQWOCOs540DU5H
         pGsgcKqCdyxGVkKzbedcmS1dLWxAMgTZMfhjVYyG6rjiIpJ27c0Fnpd6CbrHhuvMEhW2
         gNVUloyX3z/CHNp+IDAXvVRM1DMI51dixuUqUsTEKJ/IoyThWcDImv/tl51Hz1v0OKZY
         rT7X1wXr0hOq3Cn+MJpcNH36BL49Nl8PgPPgZ+2+b/iBWBtind7IY9BHRo6Qv5SvPNay
         edPQ==
X-Gm-Message-State: ABy/qLa6ClLgGU8yoCZRpP4ZegRMtssOSdCAzqkfSp7jEM3Ka+/kEWtN
	nN+wYM0OdXxGmv6ObC2aPIl/dHkFJcw=
X-Google-Smtp-Source: APBJJlF95ARaqLNa81cSoeQ/yVAVuvkJNFxH1E7bSipo61hU/hVILuvCTY7msX2mF/eehqZ1FtZW+rjYsqE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e5c1:b0:1b7:edcd:8dcf with SMTP id
 u1-20020a170902e5c100b001b7edcd8dcfmr98453plf.4.1690999853513; Wed, 02 Aug
 2023 11:10:53 -0700 (PDT)
Date: Wed, 2 Aug 2023 11:10:51 -0700
In-Reply-To: <20230801020206.1957986-5-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230801020206.1957986-1-zhaotianrui@loongson.cn> <20230801020206.1957986-5-zhaotianrui@loongson.cn>
Message-ID: <ZMqcKzrSsw9WGeTC@google.com>
Subject: Re: [PATCH v1 4/4] selftests: kvm: Add LoongArch tests into makefile
From: Sean Christopherson <seanjc@google.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 01, 2023, Tianrui Zhao wrote:
> Add LoongArch tests into selftests/kvm makefile.

Please elaborate on how the lists of tests was chosen.  E.g. explaing why
LoongArch isn't supporting kvm_binary_stats_test, rseq_test, etc.

> Based-on: <20230720062813.4126751-1-zhaotianrui@loongson.cn>
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  tools/testing/selftests/kvm/Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index c692cc86e7da..36a808c0dd4c 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -55,6 +55,10 @@ LIBKVM_s390x += lib/s390x/ucall.c
>  LIBKVM_riscv += lib/riscv/processor.c
>  LIBKVM_riscv += lib/riscv/ucall.c
>  
> +LIBKVM_loongarch += lib/loongarch/processor.c
> +LIBKVM_loongarch += lib/loongarch/ucall.c
> +LIBKVM_loongarch += lib/loongarch/exception.S
> +
>  # Non-compiled test targets
>  TEST_PROGS_x86_64 += x86_64/nx_huge_pages_test.sh
>  
> @@ -181,6 +185,13 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
>  TEST_GEN_PROGS_riscv += set_memory_region_test
>  TEST_GEN_PROGS_riscv += kvm_binary_stats_test
>  
> +TEST_GEN_PROGS_loongarch += kvm_create_max_vcpus
> +TEST_GEN_PROGS_loongarch += demand_paging_test
> +TEST_GEN_PROGS_loongarch += kvm_page_table_test
> +TEST_GEN_PROGS_loongarch += set_memory_region_test
> +TEST_GEN_PROGS_loongarch += memslot_modification_stress_test
> +TEST_GEN_PROGS_loongarch += memslot_perf_test
> +
>  TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
>  TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
>  TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
> -- 
> 2.39.1
> 
