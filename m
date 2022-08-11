Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AE17D2
	for <loongarch@lists.linux.dev>; Thu, 11 Aug 2022 01:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1660179496; bh=OyTS99sFdIE7MIH3baHBlBv1aJd28i4z8hmNZy/UQKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eVO31LntCu1yWUk7nIK3DpJeeP9+itbBsMwL21XzJbJmCe9j9B8Nmo26VaOLy/Faz
	 mGl7u5CbdBVPfSMLoC/iHefZMZp9UEtmxJT/hi2vJXhDoqj3gQLI3EF9+khVIzq3Kf
	 e/nthtHo0pinGt7U9AExQ/a+3VJqywBcVmLPcJ04=
Received: from [192.168.9.172] (unknown [101.88.24.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E71CC60074;
	Thu, 11 Aug 2022 08:58:15 +0800 (CST)
Message-ID: <1359c52d-5194-7306-0e76-cde97b5aa31c@xen0n.name>
Date: Thu, 11 Aug 2022 08:58:15 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:105.0) Gecko/20100101
 Thunderbird/105.0a1
Subject: Re: [PATCH] LoongArch: Fix the !CONFIG_SMP build for irqchip drivers
To: Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Thomas Gleixner
 <tglx@linutronix.de>, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220810103156.1214996-1-chenhuacai@loongson.cn>
 <f92fc4f34784217206b53a3709538d5c@kernel.org>
 <CAAhV-H7DbvjEcms9Y81t_=WyDnKu5vuB4x7g7vU3f9CUhZykHQ@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H7DbvjEcms9Y81t_=WyDnKu5vuB4x7g7vU3f9CUhZykHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/22 23:38, Huacai Chen wrote:

> Hi, Marc,
>
> On Wed, Aug 10, 2022 at 7:01 PM Marc Zyngier <maz@kernel.org> wrote:
>> On 2022-08-10 11:31, Huacai Chen wrote:
>>> 1, Guard get_ipi_irq() in CONFIG_SMP;
>>> 2, Define cpu_logical_map() for the EIOINTC driver;
>>> 3, Make eiointc_set_irq_affinity() return early for !CONFIG_SMP.
>>>
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Frankly, the real question is why do you even bother? As far as
>> I can tell, LoongArch has no UP system.
>>
>> arm64 crossed that bridge a long time ago, and we never looked
>> back, because these systems hardly exist.
>>
>> I'd rather you simply have a CONFIG_SMP always set to 'y', and
>> be done with it forever.
> LoongArch also has low-end processors (even LoongArch64). Though we
> haven't translate all documents at
> https://loongson.github.io/LoongArch-Documentation/ in time, there are
> currently 4 LoongArch64 processors: Loongson-2K500 (single-core),
> Loongon-2K1000 (dual-core), Loongson-3A5000 (quad-core) and
> Loongson-3C5000 (16-core). So we indeed need a UP configuration.
> Thanks.

I remember seeing an alternatives mechanism in the works for LoongArch. 
If such alternatives mechanism is to be upstreamed in short order, why 
make SMP one more build-time time option that developers have to decide 
upon? It's not like SMP code would break, or run with unacceptable 
overhead, on UP systems AFAIK, so it's probably better to not 
preemptively support so many *possibilities* that haven't been realized 
so the *current* maintainability suffers. Practically one can't buy the 
LoongArch 2K line of products anywhere right now, and the few companies 
developing for it are likely not using upstream kernels anyway, so it's 
not like we can't wait either.


-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

