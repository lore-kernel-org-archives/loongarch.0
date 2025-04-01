Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C602D05E
	for <loongarch@lists.linux.dev>; Tue,  1 Apr 2025 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471610; cv=none; b=LwsioY1z0HUSVWIhSqwOFebKOaBlqlgZWItPO51cRtprSdBcIKIrbU/+ZjVLl4RHNCvbQZZHwMph/abPmwKvHAKq30SpUHQGV2j/ibRakcF88Rm/TAE/+m0pyrZDRwYQwU+DGPebx/jjXwy8nKeKS7HvoGDX7r6q1jkO4fapJQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471610; c=relaxed/simple;
	bh=Ln079lz0yzjobmwJiN0OVPo+66Jkvv2FG4dAT0dZWOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JaCJCkrtZVpJkkRl402GQNq0MTpbrT/s/y0uL4GAzshtWv4WMeC+OTlMsqwEIxkq/LeN7cgF/8wpR22eIJuJjZVD6PjhABSOxmB2JkVvTIrZ8dE9yYcmaGQadfLPA6dV+kjjlew0JncyCxcKMtcp4v1QJfMIaFL+Nh09/T5TUIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r3y1bId/; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r3y1bId/"
Message-ID: <d9b6f34c-95f2-45f6-b5dc-89098d1f8d22@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743471604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9ohi78hJmC8ZbZkUbSfn1oReFwEpPo/O49EMuN7f7U=;
	b=r3y1bId/Oq6Q+U02X4bb5gIfLFeBuu1LrKdBUBdSdiBo+rCUJxcBW9Hd8HR+h5jtqkUk9z
	EnY4fkQO6lEOGRJPOg29JTy318DZJcwTB2tWwZw/V8NPPWUNuWoUVQm6qsm4yfUV+XNElf
	vcKHzZ5Dzk3wJCWMbONGk9oi96TsNdc=
Date: Tue, 1 Apr 2025 09:39:57 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] Docs/LoongArch: Add Advanced Extended-Redirect IRQ
 model description
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, tglx@linutronix.de,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-2-zhangtianyang@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250331064116.32540-2-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/31/25 2:41 PM, Tianyang Zhang 写道:
> Introduce the redirect interrupt controllers.When the redirect interrupt
> controller is enabled, the routing target of MSI interrupts is no longer a
> specific CPU and vector number, but a specific redirect entry. The actual
> CPU and vector number used are described by the redirect entry.
>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   .../arch/loongarch/irq-chip-model.rst         | 38 +++++++++++++++++++
>   .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 ++++++++++++++++++
>   2 files changed, 75 insertions(+)
>
> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
> index a7ecce11e445..84fafb86ec17 100644
> --- a/Documentation/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
> @@ -181,6 +181,44 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then go to CPUINTC directly::
>                | Devices |
>                +---------+
>   

> +Advanced Extended IRQ model (with redirection)
> +===============

Did you do the build test?


> +
> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go
> +to REDIRECT for remapping it to AVEC, and then go to CPUINTC directly, while all
> +other devices interrupts go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then
> +go to CPUINTC directly::
> +
> + +-----+     +-----------------------+     +-------+
> + | IPI | --> |        CPUINTC        | <-- | Timer |
> + +-----+     +-----------------------+     +-------+
> +              ^          ^          ^
> +              |          |          |
> +       +---------+ +----------+ +---------+     +-------+
> +       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
> +       +---------+ +----------+ +---------+     +-------+
> +            ^            ^
> +            |            |
> +            |      +----------+
> +            |      | REDIRECT |
> +            |      +----------+
> +            |            ^
> +            |            |
> +       +---------+  +---------+
> +       | PCH-PIC |  | PCH-MSI |
> +       +---------+  +---------+
> +         ^     ^           ^
> +         |     |           |
> + +---------+ +---------+ +---------+
> + | Devices | | PCH-LPC | | Devices |
> + +---------+ +---------+ +---------+
> +                  ^
> +                  |
> +             +---------+
> +             | Devices |
> +             +---------+
> +
>   ACPI-related definitions
>   ========================
>   
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> index d4ff80de47b6..5d82cba07482 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> @@ -174,6 +174,43 @@ CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVECINTC，
>                | Devices |
>                +---------+
>   

> +高级扩展IRQ模型 (带重定向)
> +===============

ditto


Thanks,

Yanteng

