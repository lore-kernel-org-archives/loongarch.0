Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FA15372DE
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081020; cv=none; b=XTgTy0lrCMihBS6sHCe2FO4a08xPF17BcAYELY3GRF76kCoN9SNeJ+wbZIcQe/uLIPzKWOQfBSvrt/NyVi4ZK1fHkA/qLTYTy8ubuGbO6G5kHkhrOG5pZXeM4JeZodOuCZ5qBmgWPMNjKRhE1rSh75GYJnMT2nw2fBzL8diSbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081020; c=relaxed/simple;
	bh=GtOrmSkQPj/MT55mET9mJ2+3to25SkUAyuPp0xdVmOg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=t4a3eAfqoDpdLmQiDAxQ/GYL/ue5nGRhK7mOMYMB8m/YDxMigaS2RM9YneMNlV+GBpnheNGYIbCA6K+ciSlwKWgtXGNHXc67mkH+7FZQrZP991fujMjO04jMCq2Vw0tDHRoJkSCSgnQur58OvCenLg1A5/o0u941o0I8Mg2/nsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxntL4d7Jq0aEOAA--.42763S3;
	Tue, 22 Sep 2026 20:43:36 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxpMz3d7Jq_8EjAA--.49446S2;
	Tue, 22 Sep 2026 20:43:36 +0800 (CST)
Subject: Re: [PATCH 0/2] LoongArch: KVM: Code cleanup with MSI intterupt
 injection
To: Tao Cui <cui.tao@linux.dev>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260909083259.1910290-1-maobibo@loongson.cn>
 <fb08279a-eb1b-44b1-b4af-f354fb81f112@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b72618c1-f8b0-9f17-8a56-af42b0bf4aef@loongson.cn>
Date: Tue, 22 Sep 2026 20:43:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fb08279a-eb1b-44b1-b4af-f354fb81f112@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpMz3d7Jq_8EjAA--.49446S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWrKrW5ZFWUZw4DWrW5Ww47Jrc_yoW8JrWxpF
	ZxCFnxurWkKFZ5GrnF93W5Xr1Dtw43Gr4Sqa42ya48Ar4YvF1Fqry8JrZavF98GayrJw4k
	X3WfKws8ZF1UCabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==



On 2026/9/10 上午11:06, Tao Cui wrote:
> Hi, Bibo
> 
> 在 2026/9/9 16:32, Bibo Mao 写道:
>> Here is to remove some unnecessary parameter checking when injecting
>> MSI interrupt, include MSI level parameter and vcpu::arch::dmsintc_state
>> NULL pointer etc.
>>
>> Bibo Mao (2):
>>    LoongArch: KVM: Remove parameter line when inject MSI
>>    LoongArch: KVM: Remove duplicated checking with DMSI irq injection
>>
>>   arch/loongarch/include/asm/kvm_dmsintc.h |  3 +--
>>   arch/loongarch/include/asm/kvm_pch_pic.h |  2 +-
>>   arch/loongarch/kvm/intc/dmsintc.c        | 19 +++----------------
>>   arch/loongarch/kvm/intc/pch_pic.c        |  6 +++---
>>   arch/loongarch/kvm/irqfd.c               |  6 +++---
>>   5 files changed, 11 insertions(+), 25 deletions(-)
>>
>>
>> base-commit: df2908090cda368b01ff43709f51890076c56157
> 
> The series looks good to me.
> 
> Reviewed-by: Tao Cui <cuitao@kylinos.cn>
> 
> Minor question: kvm_set_msi() now returns -EINVAL for !level instead
> of -1. Since MSI is edge-triggered, returning 0 to ignore a deassert
yes, it seems that returning 0 is better, since there is such usage with
level == 0 when injecting MSI interrupt.

Regards
Bibo Mao
> would also work, though nothing looks at the return value today.
> 

