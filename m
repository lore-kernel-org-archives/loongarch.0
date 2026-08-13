Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E00400962
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614948; cv=none; b=NyNMPhsftqmVJ9Ifumrp+P/qqMXiAKyLXmeeYOwRU1NkVVtBxdfPBmrrNllHwYPfT6p+rtQGLgpQOWirGGKTRzNMrrYqEPbJBYDcUPiovr/8xhAPD5nfeY1yFf/ij5jQYbJiY/R4QEI2BHxKOkdXhoOeXYwTt0QoNrmpvKhnQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614948; c=relaxed/simple;
	bh=F04N1peBUwepLTeaXKDKgAsihEQPER6BXi7QYYEGulQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GnCMUVwKFvrYOewBPdWAeNa5l6lhfy41r/FPrYssAbeeDx3zyjmOV2swbSrQwckctLXUpoYdJmlViEhGN+Xr5VzoLWvnF2GEN1iZqTOeDO2Yhni6EGE7FYT3MhcKqrK2gdVnG1vVO6nIHGzfgV1Cpx0e/d1QZOMCVJZ2HUu0KXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxfdKflH1qPN4AAA--.2739S3;
	Thu, 13 Aug 2026 17:55:44 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs+elH1qLDoDAA--.21615S2;
	Thu, 13 Aug 2026 17:55:43 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Use current_stack_pointer in
 current_pt_regs()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260813090506.15574-1-yangtiezhu@loongson.cn>
 <CAAhV-H7wh+8E1HEG2tAwg=7MEa228oTHRKKKqMA6wDJc4vFmZw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0de41ba9-ad21-85da-bc90-54e0f4698b9f@loongson.cn>
Date: Thu, 13 Aug 2026 17:55:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7wh+8E1HEG2tAwg=7MEa228oTHRKKKqMA6wDJc4vFmZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPs+elH1qLDoDAA--.21615S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1Uuw18XFyDZw48Wr1rAFc_yoW8Ary8p3
	95u3Z2yF4DJr4xC348ta18XFy3CrZ7Kr47CryFqw18Aws8u3s0qrZrKFWagFW8Cwn5Gw1j
	vF4UtryDZanIyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jb_-PUUUUU=

On 2026/8/13 下午5:32, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Thu, Aug 13, 2026 at 5:05 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> The current implementation of current_pt_regs() relies on the compiler
>> __builtin_frame_address(0). This introduces an unnecessary dependency
>> on the frame pointer register, which forces the compiler to generate
>> redundant prologue and epilogue code, create a larger stack frame, and
>> perform redundant memory operations to preserve the frame pointer even
>> in functions where it is otherwise unnecessary.
>>
>> Optimize this by switching to current_stack_pointer, which explicitly
>> maps to the hardware stack pointer register. This allows the compiler
>> to compute the stack alignment directly from the natively maintained
>> $sp register, completely eliminating the overhead of preserving and
>> restoring the frame pointer on the stack memory.
>>
>> As a prominent example, this optimization significantly improves the
>> hot-path function copy_thread(). A localized disassembly comparison
>> of copy_thread() illustrates the elimination of the frame pointer,
>> the reduction of stack frame size from 48 bytes down to 32 bytes,
>> and a more compact epilogue path:
> 3 instructions and 16 bytes stack space. There is improvement, but not
> "significantly".

I used "significantly" from the perspective of hot-path sensitivity,
but I agree that 3 instructions and 16 bytes might be inaccurate.

If the code itself looks good to you, please feel free to update the
commit message as you see fit when applying.

Alternatively, let me know if you prefer me to send a v2 with a more
accurate description.

Thanks,
Tiezhu

