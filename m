Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA7615492
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxqOiBb3FlkI4_AA--.25408S3;
	Thu, 07 Dec 2023 15:08:50 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt6Ab3Fly0RXAA--.63923S3;
	Thu, 07 Dec 2023 15:08:49 +0800 (CST)
Subject: Re: [PATCH v5 8/8] LoongArch: Add ORC stack unwinder support
To: Huacai Chen <chenhuacai@kernel.org>
References: <20231129130701.27744-1-yangtiezhu@loongson.cn>
 <20231129130701.27744-9-yangtiezhu@loongson.cn>
 <CAAhV-H6vv8=tax30iYR3zYJ5xun9CmQDAEqdJV4js0m1JbvsKA@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a5f383dd-a8d9-114a-3172-f4ef7539a106@loongson.cn>
Date: Thu, 7 Dec 2023 15:08:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6vv8=tax30iYR3zYJ5xun9CmQDAEqdJV4js0m1JbvsKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxzt6Ab3Fly0RXAA--.63923S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF48KrWkAr1xKw48GF4rZwc_yoWktrb_Gr
	17C398C34DZr1UXw1qqa43A3yqq3yxJFZYk3s3Xr42qFn8JFy5JwsIy34fZwnYywsrGFZ5
	Z3yYqFZ3Ar1j9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jntxDUUUUU=



On 12/02/2023 09:45 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Wed, Nov 29, 2023 at 9:07 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> The kernel CONFIG_UNWINDER_ORC option enables the ORC unwinder, which is
>> similar in concept to a DWARF unwinder. The difference is that the format
>> of the ORC data is much simpler than DWARF, which in turn allows the ORC
>> unwinder to be much simpler and faster.

...

>> diff --git a/arch/loongarch/kernel/lbt.S b/arch/loongarch/kernel/lbt.S
>> index 9c75120a26d8..4d6914f84c7e 100644
>> --- a/arch/loongarch/kernel/lbt.S
>> +++ b/arch/loongarch/kernel/lbt.S
>> @@ -11,6 +11,7 @@
>>  #include <asm/asm-offsets.h>
>>  #include <asm/errno.h>
>>  #include <asm/regdef.h>
>> +#include <asm/unwind_hints.h>
>>
>>  #define SCR_REG_WIDTH 8
>>
>> @@ -153,3 +154,7 @@ SYM_FUNC_END(_restore_ftop_context)
>>  .L_lbt_fault:
>>         li.w            a0, -EFAULT             # failure
>>         jr              ra
>> +
>> +#ifdef CONFIG_CPU_HAS_LBT
>> +STACK_FRAME_NON_STANDARD _restore_ftop_context
>> +#endif
> This file is only compiled if CONFIG_CPU_HAS_LBT is set, so #ifdef can
> be removed.

OK, will remove it in the next version.

Thanks,
Tiezhu

