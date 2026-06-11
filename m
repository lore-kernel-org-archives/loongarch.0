Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30D73DA5A9
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177319; cv=none; b=UYLGLi4xPBLzmtbtzRRCeYLDyaoa67YLuoHwy/YR9Ych/ayhXMIKc3mLsfzVNDbN2C0Xu4shzh4C1L826xdGM7I0gA3zE1Edb9UQ4fu7rTQzbga51XSsrNrv74776H6ZaJvKlZuEVJ18N+yFgcZ0qxFD8YzjnBhFDclt9MpZ0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177319; c=relaxed/simple;
	bh=+9wp5V6D5Bltd2jLQp5zJbp9nEjPhO/A6yZpBaLOOWw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QhEk9Yw71ADc88WrWQGNwOcX5O0FKwclFzFLovkDCb7awExTyvGzn9DDWcekkjLoUGh/+tntKMO5SDKXOWohZlTdUCpubIyHA2TSQtqpUbBoTES/UHdU8UHT+xcs40xa2a4eXyiH7/X85LUdrrOzKCC/Q9WHudG+K5eSyaQ3pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxdnjhmypq7A0TAA--.25910S3;
	Thu, 11 Jun 2026 19:28:33 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDx6+Dfmypq8N+iAA--.48063S3;
	Thu, 11 Jun 2026 19:28:32 +0800 (CST)
Subject: Re: [PATCH bpf-next v2] bpf: Fix unaligned interpreter panic on JIT
 fallback path
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org
Cc: puranjay@kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
 yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
References: <20260611101216.30153-1-yangtiezhu@loongson.cn>
 <cc40d131145e6dee4d8b34b51a5612afa7286af59c44fa7710a512445a6078d6@mail.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <26402a7d-994d-8738-b201-3cc149f1232c@loongson.cn>
Date: Thu, 11 Jun 2026 19:28:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cc40d131145e6dee4d8b34b51a5612afa7286af59c44fa7710a512445a6078d6@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx6+Dfmypq8N+iAA--.48063S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWrKr1rWF15ZF1rJFW7KFWxuFX_yoW8Jr4DpF
	1kJw42ya1vqF47u3srXw4Iyas8K3yrKa43Ga4kKry3tF909r1kWF15Gr1Fgrs3urW0kF1I
	vr1I9Fy2kF9YgFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9vb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU1A9N7UUUUU==

On 2026/6/11 下午6:54, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index 649cce41e13f..5785c8cb4dbe 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
>> @@ -2608,6 +2608,31 @@ static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *env, struc
>>   	return prog;
>>   }
>>
>> +/* Fix up helper call offsets for inlined helpers on JIT fallback path. */
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
> 
> Would it be cleaner to use bpf_helper_call(insn) here instead of the
> manual condition check?
> 
> The bpf_helper_call() helper from include/linux/bpf_verifier.h performs
> the same check and is used throughout the codebase for consistency. It
> improves readability and makes the intent more explicit.

OK, this is better.

I will send v3 after waiting for more review comments.

Thanks,
Tiezhu

