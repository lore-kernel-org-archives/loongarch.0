Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4275805
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 11:56:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9N11t9iRao5AA--.58716S3;
	Tue, 26 Jul 2022 19:56:38 +0800 (CST)
Subject: Re: [PATCH 3/4] LoongArch: Prefer BEQZ over "BEQ foo, zero" where
 applicable
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
References: <20220724133052.1872885-1-kernel@xen0n.name>
 <20220724133052.1872885-4-kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <d4ea44fc-1b8b-ca0b-213a-4dcdd9beb016@loongson.cn>
Date: Tue, 26 Jul 2022 19:56:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220724133052.1872885-4-kernel@xen0n.name>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf9Dxz9N11t9iRao5AA--.58716S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWfCF1xCFW8GFWkZFWrZrb_yoW5tF48pF
	WDua1kJa15uw1rAr9FkF4kur1UtrsFkry29Fy8GFyDWF9Fgr1UZFykJrykZF1UJan5AF4S
	ga1S9wn09F4UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/

On 07/24/2022 09:30 PM, WANG Xuerui wrote:

> From: WANG Xuerui <git@xen0n.name>
>
> While BEQZ and BEQ are different instructions, and the vastly expanded
> range for branch destination does not really matter in the few cases
> touched, use the BEQZ where possible for shorter lines and better
> consistency (some places used "BEQ foo, zero" while some used "BEQ zero,
> foo").
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   arch/loongarch/include/asm/atomic.h  | 8 ++++----
>   arch/loongarch/include/asm/cmpxchg.h | 2 +-
>   arch/loongarch/include/asm/futex.h   | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
> index a0a33ee793d6..0869bec2c937 100644
> --- a/arch/loongarch/include/asm/atomic.h
> +++ b/arch/loongarch/include/asm/atomic.h
> @@ -160,7 +160,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
>   		"	move	%1, %0					\n"
>   		"	blt	%0, $zero, 2f				\n"
>   		"	sc.w	%1, %2					\n"
> -		"	beq	$zero, %1, 1b				\n"
> +		"	beqz	%1, 1b					\n"
>   		"2:							\n"
>   		__WEAK_LLSC_MB
>   		: "=&r" (result), "=&r" (temp),
> @@ -173,7 +173,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
>   		"	move	%1, %0					\n"
>   		"	blt	%0, $zero, 2f				\n"
>   		"	sc.w	%1, %2					\n"
> -		"	beq	$zero, %1, 1b				\n"
> +		"	beqz	%1, 1b					\n"
>   		"2:							\n"
>   		__WEAK_LLSC_MB
>   		: "=&r" (result), "=&r" (temp),
> @@ -323,7 +323,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
>   		"	move	%1, %0					\n"
>   		"	blt	%0, $zero, 2f				\n"
Hi, Xuerui,

As you said in [PATCH4/4], the syntactic sugars named 'b[lt,le,gt,gz]z'
have been supported, too. Could we do a deep clean work about this?
Although they just are macros and have same range of destination, they
shorten lines and make better consistency as 'b[eq,ne]z' do. :-)

Thanks,
Jinyang

>   		"	sc.d	%1, %2					\n"
> -		"	beq	%1, $zero, 1b				\n"
> +		"	beqz	%1, 1b					\n"
>   		"2:							\n"
>   		__WEAK_LLSC_MB
>   		: "=&r" (result), "=&r" (temp),
> @@ -336,7 +336,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
>   		"	move	%1, %0					\n"
>   		"	blt	%0, $zero, 2f				\n"
>   		"	sc.d	%1, %2					\n"
> -		"	beq	%1, $zero, 1b				\n"
> +		"	beqz	%1, 1b					\n"
>   		"2:							\n"
>   		__WEAK_LLSC_MB
>   		: "=&r" (result), "=&r" (temp),
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
> index 9e9939196471..0a9b0fac1eee 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -57,7 +57,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
>   	"	bne	%0, %z3, 2f			\n"		\
>   	"	move	$t0, %z4			\n"		\
>   	"	" st "	$t0, %1				\n"		\
> -	"	beq	$zero, $t0, 1b			\n"		\
> +	"	beqz	$t0, 1b				\n"		\
>   	"2:						\n"		\
>   	__WEAK_LLSC_MB							\
>   	: "=&r" (__ret), "=ZB"(*m)					\
> diff --git a/arch/loongarch/include/asm/futex.h b/arch/loongarch/include/asm/futex.h
> index 170ec9f97e58..837659335fb1 100644
> --- a/arch/loongarch/include/asm/futex.h
> +++ b/arch/loongarch/include/asm/futex.h
> @@ -17,7 +17,7 @@
>   	"1:	ll.w	%1, %4 # __futex_atomic_op\n"		\
>   	"	" insn	"				\n"	\
>   	"2:	sc.w	$t0, %2				\n"	\
> -	"	beq	$t0, $zero, 1b			\n"	\
> +	"	beqz	$t0, 1b				\n"	\
>   	"3:						\n"	\
>   	"	.section .fixup,\"ax\"			\n"	\
>   	"4:	li.w	%0, %6				\n"	\
> @@ -84,7 +84,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr, u32 oldval, u32 newv
>   	"	bne	%1, %z4, 3f				\n"
>   	"	move	$t0, %z5				\n"
>   	"2:	sc.w	$t0, %2					\n"
> -	"	beq	$zero, $t0, 1b				\n"
> +	"	beqz	$t0, 1b					\n"
>   	"3:							\n"
>   	__WEAK_LLSC_MB
>   	"	.section .fixup,\"ax\"				\n"

