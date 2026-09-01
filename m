Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455FC3451C8
	for <loongarch@lists.linux.dev>; Tue,  1 Sep 2026 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225353; cv=none; b=HcvuCQGjjM8+PQTCZ9yPnEhhHSF+B/Pf+NekZdn+LmDndsY3uQmd0NIVcral/y2yWyO6SdOyhL4CKEjiyv0+pXg0hE9AyGR/KkCPOaIionoNFr9cjFh4bGuJDzVaftuSErWUS7iTAgvq4i4SYU+XRUvBEhZqFOVqiF+aoR946jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225353; c=relaxed/simple;
	bh=1K1IOftsUjhFTWQ4EUqxCVyFzZP8AIM7bIw+sa7JFKM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kndL+qgEW/EtNJPScqfYZmvVQmVUHEGMK6tAaOPgVu5e6LD8JqV4jrPASrKhhRo3TgpBzBzutoT9OfUQ5kF32yJUXvNuNg6g290wc/IsQZdu53mjtJoO/xkvtZ/Df0MX7WE7pCpcO5lIDkqCJS8NIXKOjS18Jlw4794KdC8rfn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxS_A_J5ZqGDcHAA--.20386S3;
	Tue, 01 Sep 2026 09:15:43 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxBc0+J5ZqipQYAA--.24106S2;
	Tue, 01 Sep 2026 09:15:42 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Free init resources if kvm_init() fails
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>,
 zhaotianrui@loongson.cn, chenhuacai@kernel.org
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260817123918.2738447-1-nagachaithanya9911@gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <813b686a-8e79-990f-e7d1-c161c73ebb4a@loongson.cn>
Date: Tue, 1 Sep 2026 09:15:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260817123918.2738447-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc0+J5ZqipQYAA--.24106S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFy5JF1rArW5Jw48JFyfKrX_yoW8Gw4fpr
	y7ur4Dtr48GrsrAF9rJw1DWr1DXrZ7Gr12v3WSkay5Aw4jvrW8Jr48Gr9F9FyDA3y8C3WF
	vF4SqF42v3WDA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
	UUU==



On 2026/8/17 下午8:39, Chaithanya Lagisetty wrote:
> kvm_loongarch_init() calls kvm_loongarch_env_init() to allocate the
> per-CPU kvm_context (vmcs) and kvm_loongarch_ops and to register the
> perf callbacks, and then calls kvm_init(). If kvm_init() fails its
> result is returned directly, but since module_init() does not run
> module_exit() on failure, kvm_loongarch_env_exit() is never called and
> those resources are leaked.
> 
> Call kvm_loongarch_env_exit() when kvm_init() fails, matching the
> teardown-on-failure pattern used by riscv_kvm_init().
> 
> Fixes: 2bd6ac687261 ("LoongArch: KVM: Implement kvm module related interface")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>   arch/loongarch/kvm/main.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index 3e1005526f4b..b6ddf5827c03 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -428,7 +428,11 @@ static int kvm_loongarch_init(void)
>   	if (r)
>   		return r;
>   
> -	return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +	r = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +	if (r)
> +		kvm_loongarch_env_exit();
> +
> +	return r;
>   }
>   
>   static void kvm_loongarch_exit(void)
> 
Sorry the the late response.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>

