Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC7B10F9;
	Tue, 27 Jun 2023 09:29:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8BxlfD6q5pkWAUDAA--.4773S3;
	Tue, 27 Jun 2023 17:29:31 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxniP5q5pkwcULAA--.7400S3;
	Tue, 27 Jun 2023 17:29:29 +0800 (CST)
Message-ID: <b0a6db96-1062-ce90-f8da-b9866b3c8166@loongson.cn>
Date: Tue, 27 Jun 2023 17:29:29 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/8] LoongArch: Simplify the invtlb wrappers
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, Xi Ruoyao <xry111@xry111.site>,
 loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 WANG Xuerui <git@xen0n.name>
References: <20230625095644.3156349-1-kernel@xen0n.name>
 <20230625095644.3156349-6-kernel@xen0n.name>
From: bibo mao <maobibo@loongson.cn>
In-Reply-To: <20230625095644.3156349-6-kernel@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxniP5q5pkwcULAA--.7400S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr1UCr1xCw17JF4xCr17Arc_yoW5tw4fpF
	y3CF47KFs7tF1fWa97Jr1vvr43Jrn8G34SvF9IgFnYkF1DX340grs8Ar4qyry5Ja9YyrW7
	ZF4Yyry5uFsYv3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4R6wDU
	UUU



在 2023/6/25 17:56, WANG Xuerui 写道:
> From: WANG Xuerui <git@xen0n.name>
> 
> The invtlb instruction has been supported by upstream LoongArch
> toolchains from day one, so ditch the raw opcode trickery and just use
> plain inline asm for it.
> 
> While at it, also make the invtlb asm statements barriers, for proper
> modeling of the side effects. The functions are also marked as
> __always_inline instead of just "inline", because they cannot work at
> all if not inlined: the op argument will not be compile-time const in
> that case, thus failing to satisfy the "i" constraint.
> 
> The signature of the other more specific invtlb wrappers contain unused
> arguments right now, but these are not removed right away in order for
> the patch to be focused. In the meantime, assertions are added to ensure
> no accidental misuse happens before the refactor. (The more specific
> wrappers cannot re-use the generic invtlb wrapper, because the ISA
> manual says $zero shall be used in case a particular op does not take
> the respective argument: re-using the generic wrapper would mean losing
> control over the register usage.)
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/include/asm/tlb.h | 43 ++++++++++++++------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/tlb.h b/arch/loongarch/include/asm/tlb.h
> index 0dc9ee2b05d2..da7a3b5b9374 100644
> --- a/arch/loongarch/include/asm/tlb.h
> +++ b/arch/loongarch/include/asm/tlb.h
> @@ -88,52 +88,47 @@ enum invtlb_ops {
>  	INVTLB_GID_ADDR = 0x16,
>  };
>  
> -/*
> - * invtlb op info addr
> - * (0x1 << 26) | (0x24 << 20) | (0x13 << 15) |
> - * (addr << 10) | (info << 5) | op
> - */
> -static inline void invtlb(u32 op, u32 info, u64 addr)
> +static __always_inline void invtlb(u32 op, u32 info, u64 addr)
>  {
>  	__asm__ __volatile__(
> -		"parse_r addr,%0\n\t"
> -		"parse_r info,%1\n\t"
> -		".word ((0x6498000) | (addr << 10) | (info << 5) | %2)\n\t"
> -		:
> -		: "r"(addr), "r"(info), "i"(op)
> +		"invtlb %0, %1, %2\n\t"
>  		:
> +		: "i"(op), "r"(info), "r"(addr)
> +		: "memory"
>  		);
>  }
>  
> -static inline void invtlb_addr(u32 op, u32 info, u64 addr)
> +static __always_inline void invtlb_addr(u32 op, u32 info, u64 addr)
>  {
> +	BUILD_BUG_ON(!__builtin_constant_p(info) || info != 0);
>  	__asm__ __volatile__(
> -		"parse_r addr,%0\n\t"
> -		".word ((0x6498000) | (addr << 10) | (0 << 5) | %1)\n\t"
> -		:
> -		: "r"(addr), "i"(op)
> +		"invtlb %0, $zero, %1\n\t"
>  		:
> +		: "i"(op), "r"(addr)
> +		: "memory"
>  		);
>  }
>  
> -static inline void invtlb_info(u32 op, u32 info, u64 addr)
> +static __always_inline void invtlb_info(u32 op, u32 info, u64 addr)
>  {
> +	BUILD_BUG_ON(!__builtin_constant_p(addr) || addr != 0);
>  	__asm__ __volatile__(
> -		"parse_r info,%0\n\t"
> -		".word ((0x6498000) | (0 << 10) | (info << 5) | %1)\n\t"
> -		:
> -		: "r"(info), "i"(op)
> +		"invtlb %0, %1, $zero\n\t"
>  		:
> +		: "i"(op), "r"(info)
> +		: "memory"
>  		);
>  }
macro parse_r is not used here, and it is not used any more.
Can you remove definition of this macro also?

Regards
Bibo Mao

>  
> -static inline void invtlb_all(u32 op, u32 info, u64 addr)
> +static __always_inline void invtlb_all(u32 op, u32 info, u64 addr)
>  {
> +	BUILD_BUG_ON(!__builtin_constant_p(info) || info != 0);
> +	BUILD_BUG_ON(!__builtin_constant_p(addr) || addr != 0);
>  	__asm__ __volatile__(
> -		".word ((0x6498000) | (0 << 10) | (0 << 5) | %0)\n\t"
> +		"invtlb %0, $zero, $zero\n\t"
>  		:
>  		: "i"(op)
> -		:
> +		: "memory"
>  		);
>  }
>  

