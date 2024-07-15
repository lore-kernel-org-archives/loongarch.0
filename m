Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B37187329
	for <loongarch@lists.linux.dev>; Mon, 15 Jul 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037372; cv=none; b=od0bNvCaMyzgB3Th5si4vAVNhy+pkUH42O8dWgE+V5vlmCcRmrc2mtSpP2wN5SjXrmNUQwxiqXRv8oFEaUXQora0DZ9wfiE9gmMh8Bqb5bDKZC0h7/b4dMAulp4kXmJviJrWbvVqE1ATalfXq1401F5NdlyJVBGWVyhKXEfZ2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037372; c=relaxed/simple;
	bh=1LT6bGdap7nmLMQbwo1fJ5WrO61MDan0T38QyFzr18E=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UWP0qz+wgqcTqZf/2fQ8nP2MdY3ocPzNalOpK8UW+NZ9WCDcxn1xp5E1exB+PAEgM3I4FmFvXYhaj/XHrNX7GZino+tKo0g58dtInu6bQ3JfEolbDrRPK7Q9yhZJVcSaQDqo3rM/p7ucFh8sRGxnUbgGyceGXxFLb2967u/gEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axh+o28pRmMJAEAA--.2930S3;
	Mon, 15 Jul 2024 17:56:07 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx08Q18pRmP6dJAA--.24803S3;
	Mon, 15 Jul 2024 17:56:05 +0800 (CST)
Subject: Re: [RFC PATCH 0/4] Add jump table support for objtool on LoongArch
To: Jinyang He <hejinyang@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20240712091506.28140-1-yangtiezhu@loongson.cn>
 <307bcd3e-f4fe-8cc0-c557-4069c97c6072@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bad4a7fd-e487-498d-f6ab-b9a17e049dd7@loongson.cn>
Date: Mon, 15 Jul 2024 17:56:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <307bcd3e-f4fe-8cc0-c557-4069c97c6072@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bx08Q18pRmP6dJAA--.24803S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyDAw17Jr1kZr45WrWfZwc_yoW8Kry8pF
	WUu34ftFs8JanagwnrXr129ay3CayDG3yDtr45G348uw4aqr1IvF4vkF9IvanrArs3ZrWa
	vF17K3srKa1vyacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QV
	y3UUUUU==

On 07/12/2024 06:19 PM, Jinyang He wrote:
> Are we always avoid our problems?
>
> 1, When text section not support "R_LARCH_32_PCREL", update compiler
>    to add AS_HAS_THIN_ADD_SUB.
> 2, When not support jump-table, use "-fno-jump-tables" to avoid it,
>    (and now update compiler to add CC_HAS_ANNOTATE_TABLEJUMP).
> 3, When not support relax, use "-mno-relax" to avoid it.
> 4, When some where in asm can be backtraced but generate warning,
>    use STACK_FRAME_NON_STANDARD to avoid it.
> 5, When the goto-table cannot be handled (I guess the Ruoyao's
>    patch cannot handle goto table), use CONFIG_BPF_JIT_ALWAYS_ON
>    to avoid compile ___bpf_prog_run.
> 6, And other $fp warnings not be solved in clang. Do we only care gcc?
>
> So how to do in the future if compilers have other changed? Do we
> need update compilers (both gcc and clang) again and again? Why
> not just update objtool codes to solves these problems? As many
> RISC arch not support directly find jump table, can we support
> more generic ways to find it?

This is a choose and balance. In principle, I want to make the kernel
code clear and simple to enhance the readability and maintainability,
I do not want to modify too much architecture independent code of the
objtool framework, I just want to implement the architecture specific
function.

As the gcc patch "LoongArch: Add support to annotate tablejump" said,
the objtool program needs to analysis the control flow of each .o file
generated by compiler toolchain, if a jump table is used, objtool has
to correlate the jump instruction with the table, on x86 it's simple:
a relocation entry natrually correlates them because one instruction is
used for table-based jump, but on an RISC machine objtool would have to
reconstruct the data flow if it must find out the correlation on its own,
so emit an additional section to store the correlation info as pairs of
addresses, each pair contains the address of a jump instruction (jr) and
the address of the jump table. This is very trivial to implement in GCC.

For jump table support of objtool on LoongArch, it makes life much easier
with the gcc changes. As far as I can see, the remain issues (goto table
in ___bpf_prog_run() and jump table in assemble code) are only related
with kernel and can be solved with kernel changes.

Thanks,
Tiezhu

