Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EA432937A
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167213; cv=none; b=GK4tkmODKZRRe5xduMtDmdlC5yuzEUdoYxU9klnUvngXrHyiE1HtyCUDzjz19cYkos1+k6kV8skl4k4wSoC3M2D0oJX9KOTprLbs/9weXSXYiB31ioGDt4KyCkylFi5cZfY+3ltMu49HADuj4QTIYzXO+0pEfUlpzcihJH6X04Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167213; c=relaxed/simple;
	bh=6rH52f7mPeRjAgcKXhUl+7F2bjlYwn8Qjl9TnoFlsFY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=a3veWh4Amo5BKgMdgEnY3LU2HompSXMFefw4osqpy6YHJG97NbLu8BQmT8NPokeENxPH8V3PznidTnpM/QYfPyIJXBnJf/tbmx38rsmV3yCAycLuO4Zre7OdizOUbuaNDGBnrt6Cmy4usF2k7sAigvp/rE8I54iYzSbdP/vDuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axp3hpdCpqRQMTAA--.25740S3;
	Thu, 11 Jun 2026 16:40:09 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxTMJodCpq0bqiAA--.44375S3;
	Thu, 11 Jun 2026 16:40:08 +0800 (CST)
Subject: Re: [PATCH bpf-next v1] bpf: Fix unaligned interpreter panic on JIT
 fallback path
To: Leon Hwang <leon.hwang@linux.dev>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260611070009.26257-1-yangtiezhu@loongson.cn>
 <aaca5c93-3b03-4fa2-9653-87c396e5ec7e@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <af1920f1-5b8b-434e-c265-5d679af624b4@loongson.cn>
Date: Thu, 11 Jun 2026 16:40:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aaca5c93-3b03-4fa2-9653-87c396e5ec7e@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMJodCpq0bqiAA--.44375S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF1rKFy5uryrGw18Kr1kCrX_yoW8uw4fpF
	WDG342yF47JayIga9rJ3W3uw15K3yrKr4UG3yrtryDA3Z0vrn3GF15KrZY9FZ3Cr1xCw12
	vr4jvF17uF1kGFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

On 2026/6/11 下午3:37, Leon Hwang wrote:
> On 11/6/26 15:00, Tiezhu Yang wrote:
> [...]
>>   
>> +/*
>> + * Rewrite the helper call offset for inlined helpers when fallback to
>> + * the interpreter happens due to JIT compilation failure or JIT disabled.
>> + */
>> +static void bpf_fixup_fallback_inline_helpers(struct bpf_verifier_env *env, struct bpf_prog *fp)
>> +{
>> +	struct bpf_insn *insn = fp->insnsi;
>> +	const struct bpf_func_proto *fn;
>> +	int i;
>> +
>> +	if (!env || !env->ops->get_func_proto)
>> +		return;
>> +
>> +	for (i = 0; i < fp->len; i++, insn++) {
>> +		if (insn->code == (BPF_JMP | BPF_CALL) && insn->src_reg == 0) {
>> +			if (bpf_jit_inlines_helper_call(insn->imm)) {
>> +				fn = env->ops->get_func_proto(insn->imm, fp);
>> +				if (fn && fn->func)
>> +					insn->imm = fn->func - __bpf_call_base;
> 
> Might have pointer-to-integer warning?

Thanks for the review!

I followed the existing implementation patterns in bpf_do_misc_fixups(),
where it explicitly assigns the delta directly without an explicit cast:

   insn->imm = fn->func - __bpf_call_base;

Keeping it this way ensures maximum consistency with the native code
style in the BPF subsystem, and it does not trigger pointer-to-integer
conversion warnings during my compilation tests.

>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct bpf_prog *fp,
>>   					   int *err)
>>   {
>> @@ -2639,6 +2663,15 @@ struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
>>   
>>   		fp = bpf_prog_jit_compile(env, fp);
>>   		bpf_prog_jit_attempt_done(fp);
>> +
>> +		/*
>> +		 * If JIT compilation failed or is disabled (!fp->jited), we are
>> +		 * about to fall back to the interpreter path. Fix up the call
>> +		 * offsets to prevent unaligned memory access panic.
>> +		 */
>> +		if (!fp->jited)
>> +			bpf_fixup_fallback_inline_helpers(env, fp);
>> +
> 
> Better to move it after (!fp->jited && jit_needed)?

This is a very sharp catch!

Moving it after (!fp->jited && jit_needed) avoids redundant instruction
traversal on mandatory JIT failure paths. I will update the placement
in the next vision.

Thanks,
Tiezhu

