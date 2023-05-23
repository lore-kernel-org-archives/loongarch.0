Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47C1E501
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1684837640; bh=Rz/jMDI3oh2zrPusaXmjU04cYzz6hGQWeOgOEHalzd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+zjYF5TpdsF52OTYDOxRLNuSsDFqIM3ZaPTqSGcWba5wKmKaSFNIfXz/kWtW8/D2
	 jpOc3vobIycxsYyGlYOfhL08n2YfCo69J7M2h2NAMPv78M7OtpfJePRdo96mH2qNzo
	 qBe84T+MmH3a7osEVPx1SpWyXFv8D9ey2OcvPl9g=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E29C160115;
	Tue, 23 May 2023 18:27:19 +0800 (CST)
Message-ID: <29a9c6b4-96b8-3fb5-9b7a-2f9dba97e06f@xen0n.name>
Date: Tue, 23 May 2023 18:27:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v10 00/30] Add KVM LoongArch support
Content-Language: en-US
To: maobibo <maobibo@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Mark Brown <broonie@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 Tianrui Zhao <zhaotianrui@loongson.cn>
References: <20230515021522.2445551-1-zhaotianrui@loongson.cn>
 <02f07d8e-e1c2-2ec0-59c3-f5b4ef0463dc@loongson.cn>
 <4529ee5b-364a-7819-c727-71cf94057b8b@xen0n.name>
 <99371487-717a-64d6-1c3d-aaeaee6f20db@loongson.cn>
 <90b2fc60-af26-4ba6-f775-7db2514a62f4@xen0n.name>
 <1218d3f9-4955-7176-afbd-a0dfa0bd7565@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <1218d3f9-4955-7176-afbd-a0dfa0bd7565@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/5/23 10:54, maobibo wrote:
> 
> [snip]
> 
> I hate parse_r helper also, it is hard to understand, the kernel about
> LoongArch has the same issue. How about using a fixed register like this?
> 
> /* GCSR */
> static __always_inline u64 gcsr_read(u32 reg)
> {
> 	u64 val = 0;
> 
> 	BUILD_BUG_ON(!__builtin_constant_p(reg));
> 	/* Instructions will be available in binutils later */
> 	asm volatile (
> 		"parse_r __reg, %[val]\n\t"

Isn't this still parse_r-ing things? ;-)

> 		/*
> 		 * read val from guest csr register %[reg]
> 		 * gcsrrd %[val], %[reg]
> 		 */
> 		".word 0x5 << 24 | %[reg] << 10 | 0 << 5 | __reg\n\t"
> 		: [val] "+r" (val)
> 		: [reg] "i" (reg)
> 		: "memory");
> 
> 	return val;
> }
> 
> /* GCSR */
> static __always_inline u64 gcsr_read(u32 reg)
> {
>          register unsigned long val asm("t0");

I got what you're trying to accomplish here. At which point you may just 
refer to how glibc implements its inline syscall templates and hardcode 
both the input and output arguments, then simply hard-code the whole 
instruction word. If others don't have opinions about doing things this 
way, I wouldn't either.

(CSR operations are not expected to become performance-sensitive in any 
case, so you may freely choose registers here, and t0 for output seems 
okay. I'd recommend stuffing "reg" to a temporary value bound to a0 though.)

> 
>          BUILD_BUG_ON(!__builtin_constant_p(reg));
>          /* Instructions will be available in binutils later */
>          asm volatile (
>                  "parse_r __reg, %[val]\n\t"
>                  /*
>                   * read val from guest csr register %[reg]
>                   * gcsrrd %[val], %[reg]
>                   */
>                  ".word 0x5 << 24 | %[reg] << 10 | 0 << 5 | 12 \n\t"
>                  : : [reg] "i" (reg)
>                  : "memory", "t0");
> 
>          return val;
> }

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

