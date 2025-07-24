Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3501534EC
	for <loongarch@lists.linux.dev>; Thu, 24 Jul 2025 01:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753321906; cv=none; b=ifqF73jkGZ5apQ0KunH2n+m48/aACniGDY1K2DrQmcZSfFX8ca/wRkVlHWDBj51Y+TZBE7aMsRThlTeWcbbetrHp3n7T4+OjuaAU6j9RKJDSn7n3neky2xJywnH43CFjGwJ4XKl6IAl3zOkq0c+bIDBGkJea5KUWBtcVtFaaMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753321906; c=relaxed/simple;
	bh=5gFsPbAXW59mepTuWRnPPsjYPaC7EOK30HvNtYThJGM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XA6BL7xqQfpSghy11BxyJp1AZshItzmIPAjyeb744zhlMh1BCLNun0ZVPwrKaplOnubpdYZ9qy+PcO9KtRxKgT1aPF7OBYZEUC3Gwot+6/OJ3Frt2AifgPisTquhHZGVWH7zPq89VJNlRW72xFxftz3v8lUJ7vv1HRpDWVQv+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxnOKtkYFoYswwAQ--.63396S3;
	Thu, 24 Jul 2025 09:51:41 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxzsGrkYFoSQkkAA--.28881S3;
	Thu, 24 Jul 2025 09:51:41 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Move kvm_iocsr tracepoint out of generic
 code
To: Steven Rostedt <rostedt@goodmis.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20250722094734.4920545b@gandalf.local.home>
 <2c2f5036-c3ae-3904-e940-8a8b71a65957@loongson.cn>
 <20250723214659.064b5d4a@gandalf.local.home>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <15e46f69-f270-0520-1ad4-874448439d2b@loongson.cn>
Date: Thu, 24 Jul 2025 09:49:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250723214659.064b5d4a@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsGrkYFoSQkkAA--.28881S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07j0dgAUUUUU=



On 2025/7/24 上午9:46, Steven Rostedt wrote:
> On Thu, 24 Jul 2025 09:39:40 +0800
> Bibo Mao <maobibo@loongson.cn> wrote:
> 
>>>    #define kvm_fpu_load_symbol	\
>>>    	{0, "unload"},		\
>>>    	{1, "load"}
>>>    
>> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> 
> Thanks,
> 
> Should this go through the loongarch tree or should I take it?
Huacai,

What is your point about this?

Regards
Bibo Mao
> 
> Either way works for me.
> 
> -- Steve
> 

