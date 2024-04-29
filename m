Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A513FEED4
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714375944; cv=none; b=N06acjy2NckjdL7pH4ghrh8M7AKxbRjmH2ojHSU3fV5wBIEhl2gZLRagxy6yyKtvAhEtIJI62i4e2cTxjwnQNfghhS0h+0dv8vWvl45Zgot6MYoOZIHZRFiSgzg9xg6lRW9NHsjFgA/zqrRsZwB9LCAm8UaJqlypycQNJcEU0Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714375944; c=relaxed/simple;
	bh=XRXKieqHp1DvJ7IC6w1mftvCxe3LJrs0wxu9R+nqtiU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QjRPR+TRO87iatWjZc8c1rGyHJyryhZKjgNi0LBTQKX6oTcVdVFpSKVygQoAb14s4KKwyyFj+KcQEkLUoJ+pJbKaKHnn2jT95RmwfRHBfpxG2vwgVngtuUQ4Ll9BChgTR2X/0YPBwpnk9hklNhVs4pnvtJu2RXx/9MllTqqeYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.239])
	by gateway (Coremail) with SMTP id _____8Ax6un8TC9m1NUEAA--.4483S3;
	Mon, 29 Apr 2024 15:32:13 +0800 (CST)
Received: from [10.20.42.239] (unknown [10.20.42.239])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxIlb5TC9meN8JAA--.7916S3;
	Mon, 29 Apr 2024 15:32:11 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch: KVM: Add PMU support
To: Markus Elfring <Markus.Elfring@web.de>, loongarch@lists.linux.dev,
 kernel-janitors@vger.kernel.org, maobibo@loongson.cn
Cc: LKML <linux-kernel@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Wang Xuerui <kernel@xen0n.name>
References: <20240424091813.1471440-1-gaosong@loongson.cn>
 <e68e09e0-75f3-43b8-b947-22cc0d1a0dae@web.de>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b8818597-2770-f2a3-03bd-1653cd26fc78@loongson.cn>
Date: Mon, 29 Apr 2024 15:32:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e68e09e0-75f3-43b8-b947-22cc0d1a0dae@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxIlb5TC9meN8JAA--.7916S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW3JF15ur13GFWUJw15WrX_yoW8ArW3pF
	4ruan0y3yDtF10kw4kX3yvyry7WrZ8Jr13urn7X3Z8JrZ8ZwnYvr1fZr1agFyDZ34rKFW2
	q3Z3ArWF9FyDtFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjQ6JUUU
	UU=

在 2024/4/25 下午3:18, Markus Elfring 写道:
> …
>> On KVM side. we save the host PMU CSRs into structure kvm_context.
>> If the host supports the PMU feature. When entering guest mode.
>> we save the host PMU CSRs and restore the guest PMU CSRs.
> …
>
> I suggest to reconsider the usage of a few dots in such a wording approach.
>
>
> …
> Signed-off-by: Song Gao <gaosong@loongson.cn>
>
> v2->V3:
> …
>
> * Please put your version descriptions behind a marker line.
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9-rc5#n713
Got  it,  thank for you suggestion.
> * How do you think about to avoid the repetition of version identifiers here?
I'm new to this, is the following example correct?

[...]

Signed-off-by: Song Gao <gaosong@loongson.cn>
---

v4:
   - Use the macro kvm_read_clear_hw_gcsr to optimize the code
     and remove redundant code.

V3:
   - When saving the PMU context, clear the CTRL register
      before reading the CNTR register.
   - Put kvm_lose_pmu() in kvm_handler_exit().

v2:
   - Add new vcpu->request flag KVM_REQ_PMU. If we use PMU,
     We need to set this flag;
   - Add kvm_check_pmu() to kvm_pre_enter_guest();
   - On _kvm_setcsr(), after modifying the PMU CSR register value,
      if we use PMU, we need to set KVM_REQ_PMU.

Patch v3: 
https://lore.kernel.org/all/20240424091813.1471440-1-gaosong@loongson.cn/
Patch v2: 
https://lore.kernel.org/all/20240417065236.500011-1-gaosong@loongson.cn/
Patch v1: 
https://lore.kernel.org/all/20240410095812.2943706-1-gaosong@loongson.cn/

---

[...]

Regards.
Song Gao
>
> Regards,
> Markus

