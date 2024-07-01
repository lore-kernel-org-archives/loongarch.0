Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71303381AA
	for <loongarch@lists.linux.dev>; Mon,  1 Jul 2024 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719814973; cv=none; b=p0EA/vwfhux8HgwKpX2oy99T2nOnNFeZSR8DCXxaAeWY5Nd68mC5FdsIdYiK7+KsmnUApUms+3vgCuJCEq1RPfbDM6UzYyfyXv3EkQP61ztSCvCVKK/LFEX8YMKnr4yoey80N4B7XTFOjksSR7qm3ROH+YSrbyRYVb9J+1KYnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719814973; c=relaxed/simple;
	bh=vodbmlWePU0fqHsCtlWb2D6JH4N4gZ0QSc01Jd4e3VY=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=r6lxDOxqY9VohflqiOJl7PkNIAr7T1pHfZ4uphHZrBSVzDhbkUJdlcG2ItyYZYZiFxU/019YVMmbbLH6KlWFD9KOmEg8QaIKB5bs9FwRAqsIh00EPnXBJTuunK65uLoglgWIhc3JE1/zLdXsb66jUWqF5vNhnVqBvKrsYnRoKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxvOo4S4JmL88LAA--.44821S3;
	Mon, 01 Jul 2024 14:22:48 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxMMQ2S4Jmriw3AA--.26764S3;
	Mon, 01 Jul 2024 14:22:47 +0800 (CST)
Subject: Re: [PATCH] LoongArch: make the users of larch_insn_gen_break()
 constant
To: Oleg Nesterov <oleg@redhat.com>, Huacai Chen <chenhuacai@kernel.org>
References: <20240627173806.GC21813@redhat.com>
 <37f79351-a051-3fa9-7bfb-960fb2762e27@loongson.cn>
 <20240629133747.GA4504@redhat.com>
 <CAAhV-H4tCrTuWJa88JE96N93U2O_RUsnA6WAAUMOWR6EzM9Mzw@mail.gmail.com>
 <20240629150313.GB4504@redhat.com>
Cc: andrii.nakryiko@gmail.com, andrii@kernel.org, bpf@vger.kernel.org,
 jolsa@kernel.org, kernel@xen0n.name, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 mhiramat@kernel.org, nathan@kernel.org, rostedt@goodmis.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0ed72555-372a-64ff-5d0e-a6567650bd91@loongson.cn>
Date: Mon, 1 Jul 2024 14:22:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240629150313.GB4504@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxMMQ2S4Jmriw3AA--.26764S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww17tF13Kr43Kr4rZr1DurX_yoW8Xry8pa
	nFyr43urs8J3ykJryDXw15ZFyxAw4kGw42grsIy3y5Gay5XwnxGFy8Wr47JryYvryrKay8
	ta1vg3y2qa4UArgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU

On 06/29/2024 11:03 PM, Oleg Nesterov wrote:
> LoongArch defines UPROBE_SWBP_INSN as a function call and this breaks
> arch_uprobe_trampoline() which uses it to initialize a static variable.
>
> Add the new "__builtin_constant_p" helper, __emit_break(), and redefine
> the current users of larch_insn_gen_break() to use it.
>
> The patch adds check_emit_break() into kprobes.c and uprobes.c to test
> this change. They can be removed if LoongArch boots at least once, but
> otoh these 2 __init functions will be discarded by free_initmem().
>
> Fixes: ff474a78cef5 ("uprobe: Add uretprobe syscall to speed up return probe")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20240614174822.GA1185149@thelio-3990X/
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Tested on LoongArch machine with Loongson-3A5000 and Loongson-3A6000
CPU, based on 6.10-rc3,

KPROBE_BP_INSN == larch_insn_gen_break(BRK_KPROBE_BP)
KPROBE_SSTEPBP_INSN == larch_insn_gen_break(BRK_KPROBE_SSTEPBP)
UPROBE_SWBP_INSN  == larch_insn_gen_break(BRK_UPROBE_BP)
UPROBE_XOLBP_INSN == larch_insn_gen_break(BRK_UPROBE_XOLBP)

The two functions check_emit_break() can be removed in
arch/loongarch/kernel/kprobes.c and arch/loongarch/kernel/uprobes.c

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

