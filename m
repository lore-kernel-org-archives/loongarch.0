Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFF71A0BF3
	for <loongarch@lists.linux.dev>; Fri, 22 May 2026 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416221; cv=none; b=PomNGJgYL9fsmrzP5sIjGkR5hDsNv+heGG40ElT0CUSRQ/WN0LGGhiygtx++PV7kwSH7dfVodECcNkGN9x/eBOAuSQsYdiv4zu48cxqVonvuvDjKCLr/pAceDkwbMPJaMEYb190rJ9MWuUMZCQqXBmJ1VssbhFTsfO3F3zVQbKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416221; c=relaxed/simple;
	bh=SAqPZSKPWWu6IIV8iwolK9/SlbXt3OXfz3aMFf+Z3xk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VSv17gohrPWG5wieM96U12NjNqXW3C8pYFqS73YrrXFni1q55StfgEOx3ipTASZUOiysxfop+raMs+XK1B+JhpKucBnH/lO34S3YU3rEfO0fnyXe82fNhCTgumW3HhA/iejVs4Wu1WmCtl4/CZtNig5S+sNmX8WxFLTrU+RiAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx13iYvA9qeT0MAA--.11018S3;
	Fri, 22 May 2026 10:16:56 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxD8OXvA9qGCyMAA--.3852S3;
	Fri, 22 May 2026 10:16:56 +0800 (CST)
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
 <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
 <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
 <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn>
 <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c4e4cd61-b909-dfb8-c265-437b86d6c2e7@loongson.cn>
Date: Fri, 22 May 2026 10:16:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H57233=4Sr+yRDsxp6WaTiDj3OdBqG34WE5dR+HLE_5mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxD8OXvA9qGCyMAA--.3852S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==

On 2026/5/21 下午8:52, Huacai Chen wrote:
> On Thu, May 21, 2026 at 10:37 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

...

> OK, but I want to remove preempt_enable_no_resched() in Patch#4
> because all other architectures have no.

As the commit message said, this is to balance the preemption count.

We don't want to be preempted for the entire duration of kprobe
processing, preempt_disable() is called at the start of
kprobe_breakpoint_handler(), so preempt_enable_no_resched()
should also be called at each exit path.

So, it should keep the code as is.

Thanks,
Tiezhu

