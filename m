Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C031DDC3F
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765246110; cv=none; b=PTSb8ysZPVaOKtK4a9OeBVhM/lsn/abto3X61RpOM3PL7TvsyKpvtaOJUEY2Hq/cgpyiDcXtfLsTGyanzRlRSQHgh9ufClJM4wtOybtilM9jMA7g9oHDPvZ6ofR5ePBdnFMIkgAKSYSGgoMGpE1iqDdaRqeye+knw/n/vZZGo5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765246110; c=relaxed/simple;
	bh=bvCpVa1xOGmJKrr+zelz211QpvanjA1V8AY+VmvygiI=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DGwHDrmIXFJ5eojzjQ4+U1agleKYW1bvk920oPbVyyV877Ywtu6c7IqXCnxuXI7Tj8rYcoXnpJ0n8wX4G3EioViqRzHtQC8AdnyZR1LZM0OTt8T2Lar0GUFEtCJ4svyYC6OG2RbPW4BhvHR1QzbHYRyEBEvieUqknolns8tpk94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaNGZhDdpBoIsAA--.30993S3;
	Tue, 09 Dec 2025 10:08:25 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxQ+SXhDdp90BHAQ--.62762S3;
	Tue, 09 Dec 2025 10:08:24 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
 <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
Message-ID: <e4101f85-d580-0739-4282-13c80abceed3@loongson.cn>
Date: Tue, 9 Dec 2025 10:08:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+SXhDdp90BHAQ--.62762S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF43KF15GF17Jw13Gw1DCFX_yoW8GFWrpa
	1rtF17trZ7GF18Gr18Jr18WFy7Jw4rtw1UJr1kXFyUJ3yUtFnaqr1jqryqgryUAr4xKr1Y
	vF10qF95Zr1UJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUU
	UUU==

On 2025/11/26 下午5:09, Tiezhu Yang wrote:
...
>> I will do more test and send v2 later.
> 
> Here are the draft changes:
...
> +#if IS_ENABLED(CONFIG_KVM)
> +       unsigned long old, new, size;
> +
> +       if (get_kvm_entry_info) {
> +               get_kvm_entry_info(&old, &new, &size);
> +               if (ra >= new && ra < new + size)
> +                       return old + (ra - new);
> +       }
> +#endif
...
> 
> I tested with config UNWINDER_ORC, it can unwind from kvm_handle_exit()
> to its previous frame kvm_exc_entry() which is the end of stack, there
> is no "unreliable stack" in debug mode and also no timeout for kernel
> livepatching.
> 
> I also tested with config UNWINDER_PROLOGUE and config UNWINDER_GUESS,
> no build errors and the virtual machine can boot normally.
> 
> I would like to receive comments for the draft changes first and then
> send the formal v2, the function and variable name may be not proper,
> so any comments are welcome.
> 
> Since the merge window is coming soon and I am busy with the other
> higher priority stuff, so maybe I will send v2 after the merge window.

FYI, after some internal discussions, it will only modify the code of
KVM to fix this problem, so please ignore this patch and the above diff,
I will not send new version and please wait for the KVM patch.

Thanks,
Tiezhu

