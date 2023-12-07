Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAE1199BF
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxRuiJd3Fls5A_AA--.7764S3;
	Thu, 07 Dec 2023 15:43:06 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxbNyId3FlwktXAA--.62372S3;
	Thu, 07 Dec 2023 15:43:04 +0800 (CST)
Subject: Re: [PATCH v5 8/8] LoongArch: Add ORC stack unwinder support
To: Xi Ruoyao <xry111@xry111.site>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20231129130701.27744-1-yangtiezhu@loongson.cn>
 <20231129130701.27744-9-yangtiezhu@loongson.cn>
 <e860c6d42dc67e2c662c732ce56309874456f21b.camel@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c172bf73-1e4e-9d4a-4b82-6aeb0f6f4ff8@loongson.cn>
Date: Thu, 7 Dec 2023 15:43:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e860c6d42dc67e2c662c732ce56309874456f21b.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxbNyId3FlwktXAA--.62372S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr4kKw4ruw13GrWrGFW7trc_yoW8GF4rpa
	ykGr4qkr4kXF4kXr17Aw4rJ39aqanrGrs8Xw42gayUCwsIqrsIgr4IkF45Ca47GrsFkFnF
	vFs3t3ZYv3W5C3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcqXdUU
	UUU



On 12/03/2023 09:20 PM, Xi Ruoyao wrote:
> On Wed, 2023-11-29 at 21:07 +0800, Tiezhu Yang wrote:
>> +KBUILD_AFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
>> +KBUILD_CFLAGS			+= $(call cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)-mthin-add-sub)
>> +
>> +ifdef CONFIG_OBJTOOL
>> +KBUILD_CFLAGS			+= -fno-optimize-sibling-calls -fno-jump-tables -falign-functions=4 -falign-labels=4
>> +endif
>
> I still hate regressing the optimization with a passion.

Yes, I agree in general.

>
> And -falign-labels=4 implies -falign-functions=4 so at least we can
> remove -falign-functions=4.

Thanks.

>
> And in GCC >= 14 the defaults are -falign-labels=16 and -falign-
> functions=32.  These values are determined by benchmarking on LA464 so
> I'd suggest using them (maybe unless CONFIG_CC_OPTIMIZE_FOR_SIZE).
>

The initial aim to add "-falign-functions=4 -falign-labels=4" is to
avoid generating nop instructions in .o file with -mrelax option
by default, otherwise the orc info can not match the symbol address
in vmlinux.

I want to add -mno-relax option and remove the extra option
"-falign-functions=4 -falign-labels=4", then the offsets in
each .o file and vmlinux are same, and it is not necessary
to do the special handling about local labels, I think
it will make life easier.

Thanks,
Tiezhu

