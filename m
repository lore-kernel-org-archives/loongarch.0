Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C3318131
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 09:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767174167; cv=none; b=Dwfu/Epq1ZgVGxK7x5umvMeULX6FIVgwrVU2UkxxSBG2zWDrxaT4g3eFOnJskxx7ryWmoHsN1RPVgs2QqxOs9AfNM+da/rmEykHe+57Wnxc/bGwwzD+kpUIZOJBT2DatomMgBeI5/PWHg5ktz6eZcdjNSvCrf4VJ0VDIYYwQ3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767174167; c=relaxed/simple;
	bh=6NyyhcRHSRbBjOQ8whZAS+PjNnfwKSUqmF6OUVwGHdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDGNaV6cgKN8o+58HWo6eYfmnC6GsrXfJZuvRbO8L2aq7NDrtexRAQYiLg7YtAwvBjs4Kp3clJ+aBnc9swrQs1xxRidPw4Ps1P+6AFUdOz9GnSmcBMnwOZoClUksamJfQBQ3BExtbDTiNmBWRqubKurYjy8C9G9GBWmL7Z/ISM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhIW2eSO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhIW2eSO"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso13412723a12.1
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767174164; x=1767778964; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhQC3hnAx6vo8ybVJwyWTzkkYGMOha8q8BXdXCtNSM8=;
        b=VhIW2eSOp5FBXBy+V9LUe1HNGQ3gOUukWRXzr4BGEeSiRzLvu1nZdB9hno7aI3XDht
         PvLM6F/LK2VpqeRJ2M3MSrjwL87+YgXJhLDaHnpeTY5fUf9W8U+BhfnklWXWcz09Bgo1
         j+w+cUL5OSXwdzQQUZJzKJgmDYvxA/cXDZdT1gI5foI/JTXKX+7LaX00MB0edyjFpybk
         Eyf5dvVPrdYxJxbE1zfhFQ1rbmCPwb8silOckXImwKhost8HrnAQienU7GQuMenFR/A4
         R9DfZMmog83bg2n3RPCLLCAMGmbAJOa8qp0dSf7XeKfCpMtHyoRflpCIOVreETY8lAuP
         3X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767174164; x=1767778964;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhQC3hnAx6vo8ybVJwyWTzkkYGMOha8q8BXdXCtNSM8=;
        b=fr9g/SQK6gnTip5DlK2Hwb4oGGNiSjMjTv3LNjxcVUTghplSGHwWZFh5VexJCilgjZ
         5hYTLxYprDOrhSWbXxvUvTyYIMCvk09Z/EbM8VaBIPfpSj3F6hz4EB0bvXKRyI0rdvs0
         Ln1PYts6vv9Dl6YW3IzZ4UPB7s8rn0ZfeTVcpOCNR/plhSsf0tfiH3OykVuc5vLQHeAN
         IidaDgd+n2K84V3YOLkuEh24tNC7xGGuR9r7z8G+qwUvEEw70zVMvy2/Qhy1KaM5wPJI
         TkxO7p+az/V3FisMn+88n1yboo8ixQLzXtIGYo9sANCZyJggO359Vb7b+zT+95iXJJBH
         Ii9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKi/cc8DGm19jXvrQro0LQj0y3vJXPX6h3ufD0Lbhs8ShR+n4KnQU0sa0EzYUVGJLzNnHaAbMYGLo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPLNj3vvFD5vJhoGGIKV0MqhQICZmnobTI/f0mzR7scN8pd/Nf
	915pImzQLunLGUz2U9+hBnnfMsTsaCFKigWHddM7/oPfKKnFYdwCa5vi
X-Gm-Gg: AY/fxX5nxn2vYLK2h5O3lQLZnsRh9eSI1qh4F694lUXAJrkLCc5WNuaFDiTYE6at6lf
	fJ2fLKQPgCnPQtyXnM44jczBxS47uuJPCNovbZeNqm9T296rulsMt48MfK1KMn04erWin7qEVVV
	eRxd2kkEAUJ/98A20Mhs6UaapA+wPkX07OU5v2bzjWd7BlhF7ZpcYazmigEGXBJxfclNjKw+AcK
	uEn1bt3ydYnd+FoHjCb984qW3RjDCROsq5RDkXo537MUUk88l24mo2P4OEbeDYl4q0g10A2RD5a
	ylVoOw6Sb6XlNs+9jFTLY6kyr/Ke/B0GvNLkj2GJfSL/LSjuBqDO6RTQgL3kB8qtiiDZlddtVXj
	6LdH3/Sb1iNvHu3tkQlVyZgXW4P+316Ev2YY55r0wXK5QmpLsTdK7AHc2veUmoi8YUASKieXuNZ
	ElS7Z5d2R5gg==
X-Google-Smtp-Source: AGHT+IG6BnZXWofbdukBItAk61uwrC2j9z3+nQpSf68E/xI1yNmjywUHcnARSPenSAEDWkU1hfWn1g==
X-Received: by 2002:a05:6402:2356:b0:64d:4f75:aa28 with SMTP id 4fb4d7f45d1cf-64d4f75adb0mr30963979a12.18.1767174163924;
        Wed, 31 Dec 2025 01:42:43 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105655asm37568985a12.9.2025.12.31.01.42.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Dec 2025 01:42:43 -0800 (PST)
Date: Wed, 31 Dec 2025 09:42:43 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
	david@kernel.org, ioworker0@gmail.com, linmag7@gmail.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3 7/7] mm: make PT_RECLAIM depends on
 MMU_GATHER_RCU_TABLE_FREE
Message-ID: <20251231094243.zmjs7kgflm7q6k73@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1765963770.git.zhengqi.arch@bytedance.com>
 <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac2bdb2a66da1edb24f60d1da1099e2a0b734880.1765963770.git.zhengqi.arch@bytedance.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Dec 17, 2025 at 05:45:48PM +0800, Qi Zheng wrote:
>From: Qi Zheng <zhengqi.arch@bytedance.com>
>
>The PT_RECLAIM can work on all architectures that support
>MMU_GATHER_RCU_TABLE_FREE, so make PT_RECLAIM depends on
>MMU_GATHER_RCU_TABLE_FREE.
>
>BTW, change PT_RECLAIM to be enabled by default, since nobody should want
>to turn it off.
>
>Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>---
> arch/x86/Kconfig | 1 -
> mm/Kconfig       | 9 ++-------
> 2 files changed, 2 insertions(+), 8 deletions(-)
>
>diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>index 80527299f859a..0d22da56a71b0 100644
>--- a/arch/x86/Kconfig
>+++ b/arch/x86/Kconfig
>@@ -331,7 +331,6 @@ config X86
> 	select FUNCTION_ALIGNMENT_4B
> 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
> 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>-	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
> 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
> 	select SCHED_SMT			if SMP
> 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>diff --git a/mm/Kconfig b/mm/Kconfig
>index bd0ea5454af82..fc00b429b7129 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -1447,14 +1447,9 @@ config ARCH_HAS_USER_SHADOW_STACK
> 	  The architecture has hardware support for userspace shadow call
>           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
> 
>-config ARCH_SUPPORTS_PT_RECLAIM
>-	def_bool n
>-
> config PT_RECLAIM
>-	bool "reclaim empty user page table pages"
>-	default y
>-	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
>-	select MMU_GATHER_RCU_TABLE_FREE
>+	def_bool y
>+	depends on MMU_GATHER_RCU_TABLE_FREE
> 	help
> 	  Try to reclaim empty user page table pages in paths other than munmap
> 	  and exit_mmap path.

Hi, Qi

I am new to PT_RECLAIM, when reading related code I got one question.

Before this patch,  we could have this config combination:

    CONFIG_MMU_GATHER_RCU_TABLE_FREE & !CONFIG_PT_RECLAIM

This means tlb_remove_table_free() is rcu version while tlb_remove_table_one()
is semi rcu version.

I am curious could we use rcu version tlb_remove_table_one() for this case?
Use rcu version tlb_remove_table_one() if CONFIG_MMU_GATHER_RCU_TABLE_FREE. Is
there some limitation here?

Thanks in advance for your explanation.


-- 
Wei Yang
Help you, Help me
