Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3641DF980
	for <loongarch@lists.linux.dev>; Thu, 18 Jun 2026 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781743348; cv=none; b=GOtDPTXA2E5vZ3K0qwmltEqBKic+596fr5E88e2qnAdG6UB3EkZwW0cG1H4u7Kml6dVrOsJMvjNZnBgGMya+rZ1jgXEdotslF6fxt76kCuCanMB316xUsLTpPtZVpxDybPrROL0fUlzg2DsnsRj1Ex8JnzIDPSsEq1uT/1BZyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781743348; c=relaxed/simple;
	bh=LrpFbr4vBbChDMmR0Imvu3H50KZqhmElh6040CgIB2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6oLxzlkyiIh1LQUWyRc9GVQBK4HktJbaMqLn/anyzKqaf1ipwI5at4Jmh1jJUP19J/puVGjEsYRO3RGF4fcYc/1M2e92FLrH8llOuu5CphWtFPTCZ1xR0P43czbD9avVZfxg3E5J2YF5tbCHq7PPnKvl6DRL1MDFneuNAnQb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V9/MYriX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V9/MYriX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3F62640E01D8;
	Thu, 18 Jun 2026 00:42:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mnKae5aeMqOk; Thu, 18 Jun 2026 00:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781743333; bh=IBHrtVXmPuRWQ7uBhktFTKcch7hAhRcfTxyn7mn7O4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9/MYriXywS0hZanHFwwPwHTRJ7pTlal7SUCalcLgv7ntOufAz/28XqFVfI6uKyYI
	 QOLvxM7ASQ95LAHtjtKQQSW5hRFWqG+Fvm3quBJrqpCYacEpBCfDudcD5TpKxYnvZo
	 jNW2AguPUE125tOpIJbJKnbPZfOdFjNmXWtJtg63elp1Q41omZP/GgbbwBjA8nAloc
	 PfGz8IIVcrme12XEvNdKQ2rv/GJag/unT3FlgXHVllVf0VJmtzm0IKtqLKpvRH2wud
	 N8ImwjHLKfpq4lXe+fjyh782pmKmP87f26PxEGVjPzocmND+8U8oZGxvs6gpq3HXsZ
	 RRdY/zh3823W1VfUzlz9XQHpfyKj3SugSAPLBNINUSipf0eUCFnf/ASD0chGphO2wd
	 33XUogK9sPdnD3sSmcICjzmOBuNMU2bfQmSk8K3+YNoAcCC5j9/trjk57f1Z1l85fX
	 sbPK3s36Q4+q3Rp8+7TUHJs/vXdR8gu2di4PbQr9EcAMuKEYesCn08iPjUwCw7VNCD
	 XvHeVcsZsQz0RLmL5/C1IdWqyRSi8anYr36UHtEYZc5Ih+oxGgNdo8Nwmeh6BJ3ht2
	 tqkphneIWVsqRJSVfAq1ynFwyWUfOHhtgqB+aDCAQiIvDR9Ri+cXHuftygbTEx6Z0P
	 o2dtfp1sQOOLVA3iM8/qRkMM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E63DE40E015B;
	Thu, 18 Jun 2026 00:41:08 +0000 (UTC)
Date: Wed, 17 Jun 2026 17:41:06 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, rppt@kernel.org, pasha.tatashin@soleen.com,
	pratyush@kernel.org, ruirui.yang@linux.dev, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org,
	paulmck@kernel.org, leitao@debian.org, coxu@redhat.com,
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, osandov@fb.com,
	jbohac@suse.cz, cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 05/10] x86: kexec_file: Use crash_prepare_headers()
 helper to simplify code
Message-ID: <20260618004106.GCajM-oofpxU2jDsy0@fat_crate.local>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608073459.3119290-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-6-ruanjinjie@huawei.com>

On Mon, Jun 08, 2026 at 03:34:54PM +0800, Jinjie Ruan wrote:

> Subject: Re: [PATCH v16 05/10] x86: kexec_file: Use crash_prepare_headers() helper to simplify code

Use proper subject prefix: "x86/crash: ..."

> Use the newly introduced crash_prepare_headers() function to replace
> the existing prepare_elf_headers(), allocate cmem and exclude crash kernel
> memory in the crash core, which reduce code duplication.
> 
> Only the following three architecture functions need to be implemented:
> - arch_get_system_nr_ranges(). Call get_nr_ram_ranges_callback()
>   to pre-count the max number of memory ranges.
> 
> - arch_crash_populate_cmem(). Use prepare_elf64_ram_headers_callback()
>   to collect the memory ranges and fills them into cmem.
> 
> - arch_crash_exclude_ranges(). Exclude the low 1M for x86.
> 
> By the way, remove the unused "nr_mem_ranges" in

s/By the way/While at it/

> arch_crash_handle_hotplug_event().
> 
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/x86/kernel/crash.c | 89 +++++------------------------------------
>  1 file changed, 11 insertions(+), 78 deletions(-)

With those nitpicks above addressed:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
