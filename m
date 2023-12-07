Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7989814A8A
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_+vMcHFl544_AA--.60190S3;
	Thu, 07 Dec 2023 15:14:20 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxK9zLcHFl0kVXAA--.61456S3;
	Thu, 07 Dec 2023 15:14:19 +0800 (CST)
Subject: Re: [PATCH v5 0/8] Add objtool and orc support for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
References: <20231129130701.27744-1-yangtiezhu@loongson.cn>
 <CAAhV-H7VWCFJPYLN6SRuxvvhe6gsj1HHYbLgZaWFk7g8sh1LPA@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ec661951-c08d-0c47-de5c-f6b8923bbef6@loongson.cn>
Date: Thu, 7 Dec 2023 15:14:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7VWCFJPYLN6SRuxvvhe6gsj1HHYbLgZaWFk7g8sh1LPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxK9zLcHFl0kVXAA--.61456S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWkurWxCw4fJFy5Ar43Arc_yoW8XrW3pF
	y7Zrn0kr48ZFs3Cw4DA393WrWfJ39xC3yaq3Z8AryfC3yagas0q3W0yrnrJFyjgw47CrWF
	qF1F9wnFya1UuwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
	b18UUUUU=



On 12/02/2023 09:52 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> There are still some build warnings.
>
> If FUNCTION_TRACER enabled, we get
>   AS      arch/loongarch/kernel/mcount_dyn.o
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> ftrace_common+0x0: unreachable instruction
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> ftrace_caller+0x0: unreachable instruction
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> ftrace_regs_caller+0x0: unreachable instruction
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> ftrace_graph_caller+0x0: unreachable instruction
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> return_to_handler+0x0: unreachable instruction
> arch/loongarch/kernel/mcount_dyn.o: warning: objtool:
> ftrace_stub_direct_tramp+0x0: unreachable instruction
>
>   AS      arch/loongarch/kernel/rethook_trampoline.o
> arch/loongarch/kernel/rethook_trampoline.o: warning: objtool:
> arch_rethook_trampoline+0x0: unreachable instruction

I tested with the default config loongson3_defconfig,
the FUNCTION_TRACE is not enabled, let me try to fix it.

> And when I use the latest binutils/gcc for native build, there are
> some warnings in some files from the {init, kernel} directory. But
> cross-building is fine, I don't know why.

I can not reproduce it for native build, it works well,
I will analysis if it can reproduce someday.

Thanks,
Tiezhu

