Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D4F1E9B37
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114242; cv=none; b=QhoLAir2uCGG0vqKR7V2a1G7juMzWosfQIz3+I4TtLgyhsnrbKwCbQqUIszERmD0gZIpklidQ4DaZM/TlKl4uAJdjbVaOshRmAZW93ZwBoSoBorCxSIUIqWgKk8ZpLS/ym13chKcJrZwqwKchelg4rkA/f7Y2ND798NfBK0AMT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114242; c=relaxed/simple;
	bh=NHjPVffI4vaUZO+Vsx8dzVQOq3E63OHQvnKtyn4jZqo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=D61theGtnvqotXzkoXaOz+Ke1mHs7ouWR9lK63ZUWL7ULmiT4e44hWMZG66HVE7YS9yAotyNvYFsxYvko2YohGP5i+PUPf9r/J8Edn9nR8rx9svaUS4/O/fTGgoY3Tn4dAonvrCG+P3s0LbJFIvfcz/QU1wbZ59spfpWPtEhKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxYdE8ftFqo1oWAA--.297S3;
	Fri, 16 Oct 2026 09:30:36 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxRs07ftFqI_AsAA--.15901S2;
	Fri, 16 Oct 2026 09:30:35 +0800 (CST)
Subject: Re: [PATCH v4 3/3] LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
To: Tao Cui <cui.tao@linux.dev>, chenhuacai@kernel.org,
 zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@xen0n.name,
 nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
References: <20261015234638.1077815-1-cui.tao@linux.dev>
 <20261015234638.1077815-4-cui.tao@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <bd455df4-49e8-c80c-a5cc-b0feabeb3262@loongson.cn>
Date: Fri, 16 Oct 2026 09:31:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261015234638.1077815-4-cui.tao@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxRs07ftFqI_AsAA--.15901S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFykJr4xCFyDGr4DAF4fWFX_yoW8tFW5pr
	W8Ca9xCrW8Wr1I9Fs7Zwn7XFyI9a1I9w4F9F1YyFy2kr15tr9YqFyFya15X3WDJ3y8AFyI
	qFs8G34Fva1UAabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jYSoJUUUUU=



On 2026/10/16 上午7:46, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> KVM_DEV_LOONGARCH_PCH_PIC_CTRL_INIT has no guard against repeated
> invocation: every call overwrites pch_pic_base and registers the same
> kvm_io_device on the MMIO bus at the new address, while
> kvm_pch_pic_destroy() unregisters only one bus range.  After a repeated
> init, MMIO to the stale ranges computes its register offset against the
> new base and silently reads 0 / drops writes, and the leftover bus
> entries persist until the VM is destroyed.
> 
> Reject repeated initialization with -EEXIST, using the initialized
> state of the kvm_io_device as the indicator.  The check, the MMIO base
> update and the bus registration are serialized by slots_lock, and the
> real registration error is propagated instead of being replaced with
> -EFAULT.
> 
> Fixes: d206d9514873 ("LoongArch: KVM: Add PCHPIC user mode read and write functions")
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/pch_pic.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index 51e4a6a39dc0..a4c35ed704be 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -281,16 +281,21 @@ static int kvm_pch_pic_init(struct kvm_device *dev, u64 addr)
>   	struct kvm_io_device *device;
>   	struct loongarch_pch_pic *s = dev->kvm->arch.pch_pic;
>   
> -	s->pch_pic_base = addr;
>   	device = &s->device;
> +	mutex_lock(&kvm->slots_lock);
> +	if (s->device.ops) {
> +		ret = -EEXIST;
> +		goto out;
> +	}
> +	s->pch_pic_base = addr;
>   	/* init device by pch pic writing and reading ops */
>   	kvm_iodevice_init(device, &kvm_pch_pic_ops);
> -	mutex_lock(&kvm->slots_lock);
>   	/* register pch pic device */
>   	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, addr, PCH_PIC_SIZE, device);
> +out:
>   	mutex_unlock(&kvm->slots_lock);
one small nit, what to do if there is failure with 
kvm_io_bus_register_dev()?  clear s->pch_pic_base and  s->device.ops?

Regards
Bibo Mao
>   
> -	return (ret < 0) ? -EFAULT : 0;
> +	return ret;
>   }
>   
>   /* used by user space to get or set pch pic registers */
> 

