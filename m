Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB81A3AEF4A
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 03:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784087377; cv=none; b=FRF4D7HWxb/i3zyEaaQDEQg+GDWbDAyBeMq9XsRsksJd13Phjvvpx3g28cuVfDv2mNQHDcSZT7dNSYL6N2LTNafiT6KtO9M8e5z6TIc7ikZLOnx2s6pnG7zoAl/CAcQ6LE8Hqoxso8eGaJIFf+aqxhVGlFTBQpFMg1w/6mLdZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784087377; c=relaxed/simple;
	bh=vFwQz2etGugy0LsEvX5fe1cAB9D9ybGz33nLn/EK4yQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JEY9cvcC2M5zen0Z0iVH1lac9QvzUXueTpXk43nvfGYLfHQBnG2ZKwqV32iW2h2848IsMRT7+9X9/d/C00DTVYXMzJ90n3RDV4++QRkI7+JzptgrrIHILsUI1snprctzxfsfXt6kTqJZhwhF6wBzlhXWV1UzPplJG3dJTokau54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxmutEA1dqz6cDAA--.14651S3;
	Wed, 15 Jul 2026 11:49:24 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxTsVDA1dqeIwNAA--.65426S2;
	Wed, 15 Jul 2026 11:49:23 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Reload one-shot TVAL on migration
 destination
To: Tao Cui <cui.tao@linux.dev>, zhaotianrui@loongson.cn
Cc: chenhuacai@kernel.org, kernel@xen0n.name, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 lixianglai@loongson.cn, cuitao@kylinos.cn
References: <20260715032831.1411664-1-cui.tao@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <a93bc0fe-58b9-f5af-aefb-f5659e54304f@loongson.cn>
Date: Wed, 15 Jul 2026 11:49:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260715032831.1411664-1-cui.tao@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxTsVDA1dqeIwNAA--.65426S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArW5CFWxZw1xZw1ruryrXwc_yoW8ZFy8pF
	4xAwnxJrZ5Zr17G3Z8W3WYgFy3u3y8Gr1fWa4DCrWakrsxtw1rtF4IgFW7XFW3Kw40v39a
	qr4Fgw15Z3WDA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==



On 2026/7/15 上午11:28, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> kvm_restore_timer() rebuilds the remaining timer countdown from
> vcpu->arch.expire, which is host-internal and is not part of the migrated
> vCPU state. On the migration destination it is still 0, so for a one-shot
> timer that has not expired yet the computed delta is 0 and
> write_gcsr_timertick(0) injects the timer interrupt immediately instead of
> after the remaining time. The guest observes a premature timer event right
> after migration.
> 
> The expired one-shot case (TVAL = -1) is already handled earlier, so only
> the non-expired one-shot path is affected. When expire has not been set
> (i.e. on the destination), reload the remaining countdown from the
> migrated TVAL. The regular preempt/resume path on the source, where
> expire is valid, is unchanged.
> 
> Fixes: a5857b9ff6e0 ("LoongArch: KVM: Implement vcpu timer operations")
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/timer.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
> index 3829f35a4070..57f53d19a00a 100644
> --- a/arch/loongarch/kvm/timer.c
> +++ b/arch/loongarch/kvm/timer.c
> @@ -132,6 +132,14 @@ void kvm_restore_timer(struct kvm_vcpu *vcpu)
>   		 * during injecting intr async
>   		 */
>   		kvm_queue_irq(vcpu, INT_TI);
> +	} else if (!expire) {
> +		/*
> +		 * One-shot timer on the migration destination: vcpu->arch.expire
> +		 * is host-internal and is not migrated, so it is still 0 here.
Good catch, I ever noticed this issue before however without good 
method. My previous method is to recalculate vcpu->arch.expire in 
function _kvm_setcsr() when LOONGARCH_CSR_TVAL is set and value of 
vcpu->arch.expire is 0.

Regards
Bibo Mao
> +		 * Reload the remaining countdown from the migrated TVAL instead
> +		 * of firing the timer immediately.
> +		 */
> +		delta = ticks;
>   	}
>   
>   	write_gcsr_timertick(delta);
> 

