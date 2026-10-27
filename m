Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074230;
	b=x2Jq+sN9FESde5krXAR+mE4Tx+eJyvVuonTI59NEn2yY51vWxtimNiulTX/7i0b/DnRg
	 ArOfZtHAEhI5yAyJyIDjOTUzauEEDNWHrgIkMLIjGLrO9WrepegCVZ7luNKFaO6aKEMY9
	 aTfJlJEKoyF7VR7aCZExS4fekFnFHn+3zT/iIorJiA7NHwMT/KVrxbAXYokiHO81ozO83
	 TE4AISEL39guuhGgCA2/XeKb80sexbQT0tbh4YRbPCpKOkgd9zLwUpDDZhy8bNg3xYdv3
	 wtMJch8M9pRXr2Ozda2Ry7atip5GouDoUAdy0ORDtJX9y4n6BAOp0REu5AQY6QvS+Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074230;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=/8PAWzs/4v7CmdiFS6NRHGflhDZfELTmdZRWhE8jV00=;
	b=gpoq+2GODQBD3PP8Vcu44JvrR2YjRZgIfNZVwpj+Zs5YjXgy9eq8HvBvgue4BlDf3vgk
	 Lc3sVRdOsk49/GFhFDQiquWddvOicojhHfn7fwuJSphCsGnxp5td+QHdPRDThH8njjjmE
	 E4MCUrhx9TGA9rCG9ZrgWIjzm2IrhI9ECHNUPM0JKv2WdfltWvacW1zTTBdpW/U2P4Dud
	 pIVvg4EpyacckH2rVWgTqSkJ6aX/LCHRIJq4aoELy3L4WJg3j1AfWVl7u9HH4wfA+OcT4
	 0X46sS26AGCMVMjIDG1YHeQCW0NhLXQYiHH0KZYJnPjxrMRVI92AD+4f7vE1bv7aw2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CC7606A31B
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 04:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxX9MxJOBqqbIZAA--.9147S3;
	Tue, 27 Oct 2026 12:10:26 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxlMwxJOBq+o0wAA--.8791S2;
	Tue, 27 Oct 2026 12:10:25 +0800 (CST)
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016081006.26069-1-yangtiezhu@loongson.cn>
 <20261016081006.26069-4-yangtiezhu@loongson.cn>
 <CAEyhmHQe5T6Ai0LXiJnwXzBgy_Xu5=upeqWHbMz7J3X6QntWBA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b5c793ec-c951-930f-fc9d-06de6f49ac9e@loongson.cn>
Date: Tue, 27 Oct 2026 12:10:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEyhmHQe5T6Ai0LXiJnwXzBgy_Xu5=upeqWHbMz7J3X6QntWBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMwxJOBq+o0wAA--.8791S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr4Utw47JF4fZF1UKF4Utrc_yoW8Wr4UpF
	sxWa9Iqa1DXa42kF12yF4DAFsxKwn5Way8Xr45A34vkF98J3Z8KayqgrsY9Fn5J3s5Ww4F
	vF17X34DZa1qg3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ewZ7UUUUU==

On 2026/10/27 上午10:02, Hengqi Chen wrote:
> On Fri, Oct 16, 2026 at 4:10 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Currently, the LoongArch BPF JIT emits numerous redundant zero and sign
>> extensions across 32-bit operations, bloating the final JIT image size
>> and also leading to runtime overhead, particularly in the division and
>> modulo operations. Thus, it is necessary to optimize 32-bit operations
>> by emitting LoongArch native 32-bit word instructions.

...

>> +               if (cpu_has_div32) {
>> +                       if (!off)
>> +                               emit_insn(ctx, divwu, dst, dst, src);
>> +                       else
>> +                               emit_insn(ctx, divw, dst, dst, src);
> 
> For ALU32 SDIV, off != 0, it seems like there is a overflow in S32_MIN / -1.
> verifier_sdiv.c has related test cases but annotate with
> __arch_x86_64, so it is not run on LoongArch.

After enabling the signed division and modulo overflow tests for
LoongArch, here are the test results:

$ sudo ./test_progs -t verifier_sdiv | grep "MIN/-1"
#731/121 verifier_sdiv/SDIV64, overflow r/r, LLONG_MIN/-1:OK
#731/123 verifier_sdiv/SDIV64, overflow r/i, LLONG_MIN/-1:OK
#731/125 verifier_sdiv/SDIV32, overflow r/r, INT_MIN/-1:OK
#731/127 verifier_sdiv/SDIV32, overflow r/i, INT_MIN/-1:OK
#731/129 verifier_sdiv/SMOD64, overflow r/r, LLONG_MIN/-1:OK
#731/131 verifier_sdiv/SMOD64, overflow r/i, LLONG_MIN/-1:OK
#731/133 verifier_sdiv/SMOD32, overflow r/r, INT_MIN/-1:OK
#731/135 verifier_sdiv/SMOD32, overflow r/i, INT_MIN/-1:OK

That is to say, the current jit code is no problem.

Thanks,
Tiezhu

