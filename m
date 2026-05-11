Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A8630BF68
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 07:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483215; cv=none; b=dxmmeCxBZ+mm29E4iFIBVwxLWT31vmKI43pjJGhaMEmJG0iswvm0KduvHrCIOxHHPKIGcFSFUo+2ABebOUZIt8FurYgcnCu3MsRSclIo5z+kO4x/Ikoix9j4JiR0TqX7BMYflS8PTkk4C34WotDGIMRORFRq00Otv4g7rNb6vcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483215; c=relaxed/simple;
	bh=DzY3vVqr/7DSs0lBAsbK1QIH9OFYtM3cIXdiQty5+AM=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=etLzHFcJ487KLbdxo7UL4dH+qiMcFheM6W+j3Sf8RrJX9nFFoh1RY8wV3L5zkrhbgIedgf+yIYZwNgJ8xXjAPIv/QfWKVqmqQK6T1aHw8CtF3Vj8W9LAR5DUgxLoweezFKMtHmS0y86C7e5gYHflIWIUmGtIxFsZSwKkhCeu/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxVegJgAFqdo4IAA--.20626S3;
	Mon, 11 May 2026 15:06:51 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDx6+AJgAFqk+p+AA--.45507S3;
	Mon, 11 May 2026 15:06:49 +0800 (CST)
Subject: Re: [PATCH 0/5] Small enhancement about interrupt injection
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260511065146.680650-1-maobibo@loongson.cn>
Message-ID: <96f15a3c-5401-d654-6a4a-0a5d41a1bafa@loongson.cn>
Date: Mon, 11 May 2026 15:03:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260511065146.680650-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx6+AJgAFqk+p+AA--.45507S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF1fAFy8Kr1DXF1kuFyfAFc_yoWDurc_WF
	1Iya45uw48GF4UtFyFvr9ay34DGr48XrWftanF9r4xWwnrAr93GF1DZF13ZryS9rWUJrs8
	JrZ8tr1fZry2gosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=

Soryy, that is too quick.
The tile of this patchset should add "LoongArch: KVM:"

Regards
Bibo Mao

On 2026/5/11 下午2:51, Bibo Mao wrote:
> Here make intterupt status acquire interface simpler, add new interface
> kvm_vcpu_sync_intr() to sync pending interrupt to software ESTAT
> register, and remove expensive vcpu_load() and vcpu_put() function call.
> 
> Also interrupt inject is handled with batch method, rather one by one.
> 
> Bibo Mao (5):
>    LoongArch: KVM: Check msgint feature in interrupt post
>    LoongArch: KVM: Use existing macro about interrupt bit mask
>    LoongArch: KVM: Clear interrupt with batch mode
>    LoongArch: KVM: Deliver interrupt with batch method
>    LoongArch: KVM: Simple interrupt status acquire interface
> 
>   arch/loongarch/include/asm/kvm_vcpu.h |  40 +++++---
>   arch/loongarch/kvm/interrupt.c        | 140 +++++++++++++-------------
>   arch/loongarch/kvm/vcpu.c             |  22 ++--
>   3 files changed, 106 insertions(+), 96 deletions(-)
> 
> 
> base-commit: 917719c412c48687d4a176965d1fa35320ec457c
> 

