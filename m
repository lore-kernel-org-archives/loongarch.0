Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216581E5B7B
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764033461; cv=none; b=qoc7SEuzvCt+RWhwJBN7yArR6+sWWk7Pg2fMF03UuF3QCsLAA/TFM9R+UNupGTd/Kom11PsiVvStXutMfCvXw9zoyT8fjnV+TA3VrbkuBX7w3wwWfSoi2aCcgCNjwUK7nKzj1XzuFdMvgmaZcsDcn+0JRbicPceGGS+46fgxwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764033461; c=relaxed/simple;
	bh=003x4wNHrAmM6Rg1GspBzV0g2AnGWicyvQZmi9zqWiI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mPrgnB3iDDYucdBPwCI3ZKyAh82IkGJZP6ZaRgo+oV5IL75BJLBSvwVKZdqoqhKeykqC0jc2sLKDhL/8qlaDBNoPkvyeUafG6FK5XTPCtoHPqzuFcBPNhb+07WIKVPlXp49yfKO40F+UlEsNFJQluP1qYi1ii6Ze2xq3bNSb9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.239])
	by gateway (Coremail) with SMTP id _____8Dxvr+uAyVpV7knAA--.18042S3;
	Tue, 25 Nov 2025 09:17:35 +0800 (CST)
Received: from [10.20.42.239] (unknown [10.20.42.239])
	by front1 (Coremail) with SMTP id qMiowJAxT+amAyVpkyA+AQ--.32892S3;
	Tue, 25 Nov 2025 09:17:33 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Add AVEC support irqchip in kernel
To: Bibo Mao <maobibo@loongson.cn>, chenhuacai@kernel.org
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev, kernel@xen0n.name,
 linux-kernel@vger.kernel.org
References: <20251119083946.1864543-1-gaosong@loongson.cn>
 <6cabc0c2-fb96-236f-5cc0-7bdda1c27826@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <e9374c59-f54a-0be1-8743-788ae42cc5da@loongson.cn>
Date: Tue, 25 Nov 2025 09:17:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6cabc0c2-fb96-236f-5cc0-7bdda1c27826@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxT+amAyVpkyA+AQ--.32892S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=

在 2025/11/19 下午6:11, Bibo Mao 写道:
> this patch is big and hard to review :)
> suggest to split to smaller patch-set, such as avec device create, 
> intterrupt injection etc.
>
OK,  I will do . thanks for you suggestions.

Thanks.
Song Gao
> On 2025/11/19 下午4:39, Song Gao wrote:
>> Add a dintc device to set dintc msg base and msg size.
>> implement deliver the msi to vcpu and inject irq to dest vcpu.
>> add some macros for AVEC. 

