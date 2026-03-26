Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BDA1922FD;
	Thu, 26 Mar 2026 04:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774497652; cv=none; b=eES1ja173E0gFXyN3d2nFKxpfMvsVPF2uz0fdVWZIcZ9isZ/Cf9B0w8WgJVL0NnHHcRL3tvMUpMZXn30j+fRlfABFAg6LT6qA5CoHvfov2QTbmG6Z8yzi5a1ly51A1ABNwAupa5VK87i1L5stT0QMKiJUunXv6ZAoz9LXD6kIcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774497652; c=relaxed/simple;
	bh=a9nj8mR0F2lI5537jnvwaS2ZWg+dPzAdFfkxncY9zlI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HuouyAMepeHAlyy3YE2KyAQKTZgG0Vmv/9pEyhtTbOohhfQZcrFOBYFZQDCulBghXDh0LYLRPMqSe5DlPFy5DWPp73i+zM8toZS3kuoCv522ow+l/F3mRoFYQioD7ktIUA5U7sTT83/X1Bu9HphGEz0llTsFHEeEos3cBbxKkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h2qifna9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h2qifna9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADB9C19424;
	Thu, 26 Mar 2026 04:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774497652;
	bh=a9nj8mR0F2lI5537jnvwaS2ZWg+dPzAdFfkxncY9zlI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h2qifna9aaXJnfak9+pSw26tlqsP2LAwzpD3dGgF05NQHoCHdNDKGEZMoI/Wk5xcR
	 KnLZv/LqxdRIns2Nlqb3FxRXxGoEPhC72JtyPQx0VyGaV3MLE4ojcsuotrtL3JM21n
	 PkhEdBR8W4hregCpzSCNr/8OKlRFhBrzKXyzsukU=
Date: Wed, 25 Mar 2026 21:00:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
 <kernel@xen0n.name>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
 <saravanak@kernel.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
 <dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
 <pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
 <dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
 <paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
 <ardb@kernel.org>, <leitao@debian.org>, <osandov@fb.com>,
 <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
 <sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
 <eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
 <kevin.brodsky@arm.com>, <samuel.holland@sifive.com>,
 <vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
 <liaoyuanhong@vivo.com>, <jbohac@suse.cz>, <fuqiang.wang@easystack.cn>,
 <guoren@kernel.org>, <chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>,
 <james.morse@arm.com>, <takahiro.akashi@linaro.org>,
 <lizhengyu3@huawei.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <kexec@lists.infradead.org>
Subject: Re: [PATCH v10 0/8] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <20260325210049.28cca592a001e745954b3241@linux-foundation.org>
In-Reply-To: <20260325025904.2811960-1-ruanjinjie@huawei.com>
References: <20260325025904.2811960-1-ruanjinjie@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Mar 2026 10:58:56 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.

So who is patchmonkey for this.

>  .../admin-guide/kernel-parameters.txt         |  16 +--
>  arch/arm64/kernel/machine_kexec_file.c        |  39 ++-----
>  arch/arm64/mm/init.c                          |   5 +-
>  arch/loongarch/kernel/machine_kexec_file.c    |  39 ++-----
>  arch/powerpc/include/asm/kexec_ranges.h       |   1 -
>  arch/powerpc/kexec/crash.c                    |   7 +-
>  arch/powerpc/kexec/ranges.c                   | 101 +----------------
>  arch/riscv/kernel/machine_kexec_file.c        |  38 ++-----
>  arch/riscv/mm/init.c                          |   5 +-
>  arch/x86/kernel/crash.c                       |  89 ++-------------
>  drivers/of/fdt.c                              |   9 +-
>  drivers/of/kexec.c                            |   9 ++
>  include/linux/crash_core.h                    |   9 ++
>  kernel/crash_core.c                           | 105 +++++++++++++++++-

Me, I guess, with as many arch acks as I can gather, please.

I'm seriously trying to slow things down now, but I guess I can make an
exception for non-MM material.

AI review asks a few questions:
	https://sashiko.dev/#/patchset/20260325025904.2811960-1-ruanjinjie@huawei.com

Can you please check these?  And I'm interested in learning how many of
these are valid.  Thanks.
