Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772A817
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 13:02:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeHe5d9iLcc5AA--.36103S3;
	Tue, 26 Jul 2022 21:02:24 +0800 (CST)
Subject: Re: [PATCH v2 5/6] LoongArch: Simplify "BLT foo, zero" with BLTZ
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
References: <20220726122920.2291947-1-kernel@xen0n.name>
 <20220726122920.2291947-6-kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <8a2ea087-ac01-e644-3460-0ceb8685e792@loongson.cn>
Date: Tue, 26 Jul 2022 21:02:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220726122920.2291947-6-kernel@xen0n.name>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf9AxKeHe5d9iLcc5AA--.36103S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr47trW7Cr1kKF45Kw1rJFb_yoW5XrWDpF
	WDuF4kGw4jgF1agF9FkrWI9r45Ja1I93y29ayfGay09FnxKr4UCw18J3s7XF13Ja95XF4I
	93Z2kry5uF4UA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Is there anything left?


diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index 7eee40271577..4c7ba5cb4574 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -47,7 +47,7 @@ SYM_FUNC_START(handle_tlb_load)
          * The vmalloc handling is not in the hotpath.
          */
         csrrd   t0, LOONGARCH_CSR_BADV
-       blt     t0, $r0, vmalloc_load
+       bltz    t0, vmalloc_load
         csrrd   t1, LOONGARCH_CSR_PGDL

  vmalloc_done_load:
@@ -210,7 +210,7 @@ SYM_FUNC_START(handle_tlb_store)
          * The vmalloc handling is not in the hotpath.
          */
         csrrd   t0, LOONGARCH_CSR_BADV
-       blt     t0, $r0, vmalloc_store
+       bltz    t0, vmalloc_store
         csrrd   t1, LOONGARCH_CSR_PGDL

  vmalloc_done_store:
@@ -378,7 +378,7 @@ SYM_FUNC_START(handle_tlb_modify)
          * The vmalloc handling is not in the hotpath.
          */
         csrrd   t0, LOONGARCH_CSR_BADV
-       blt     t0, $r0, vmalloc_modify
+       bltz    t0, vmalloc_modify
         csrrd   t1, LOONGARCH_CSR_PGDL

  vmalloc_done_modify:


Thanks,



On 07/26/2022 08:29 PM, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>
> Support for the syntactic sugar is present in upstream binutils port
> from the beginning. Use it for shorter lines and better consistency.
> Generated code should be identical.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   arch/loongarch/include/asm/atomic.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
> index 0869bec2c937..dc2ae4f22c8e 100644
> --- a/arch/loongarch/include/asm/atomic.h
> +++ b/arch/loongarch/include/asm/atomic.h
> @@ -158,7 +158,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
>   		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
>   		"	addi.w	%0, %1, %3				\n"
>   		"	move	%1, %0					\n"
> -		"	blt	%0, $zero, 2f				\n"
> +		"	bltz	%0, 2f					\n"
>   		"	sc.w	%1, %2					\n"
>   		"	beqz	%1, 1b					\n"
>   		"2:							\n"
> @@ -171,7 +171,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
>   		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
>   		"	sub.w	%0, %1, %3				\n"
>   		"	move	%1, %0					\n"
> -		"	blt	%0, $zero, 2f				\n"
> +		"	bltz	%0, 2f					\n"
>   		"	sc.w	%1, %2					\n"
>   		"	beqz	%1, 1b					\n"
>   		"2:							\n"
> @@ -321,7 +321,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
>   		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
>   		"	addi.d	%0, %1, %3				\n"
>   		"	move	%1, %0					\n"
> -		"	blt	%0, $zero, 2f				\n"
> +		"	bltz	%0, 2f					\n"
>   		"	sc.d	%1, %2					\n"
>   		"	beqz	%1, 1b					\n"
>   		"2:							\n"
> @@ -334,7 +334,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
>   		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
>   		"	sub.d	%0, %1, %3				\n"
>   		"	move	%1, %0					\n"
> -		"	blt	%0, $zero, 2f				\n"
> +		"	bltz	%0, 2f					\n"
>   		"	sc.d	%1, %2					\n"
>   		"	beqz	%1, 1b					\n"
>   		"2:							\n"

