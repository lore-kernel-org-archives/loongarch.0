Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBE51AC887
	for <loongarch@lists.linux.dev>; Thu, 15 Aug 2024 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719472; cv=none; b=Ey/b4wqmQzeowrXB1wKVFMm0l8IxWYcHDMOjtSx2JKVu4Lp5+e1WJAX7NcLa5AC1Hl170dp88U/CKfB2y54pIfH5HuUO80G/zmHelJSo1GjfN4Qo345VSe2iM51ViY3XU2YQ1IvfhsycH3TNqpmxN8U9/VF0bsLC6+oLxJdd4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719472; c=relaxed/simple;
	bh=3lRPdEGgoE3CNo1PJ94+XF+At1dlGGEbdpA8jE5l3jo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TgSDNvLOISmNrt3xNst4l3g2Oyzpo9Eyb9GkrDUz7/7fs1IrH9rQgXJ+eJ+Jh57u0IXPjMrshdBAeEWQy4kZZn+JdQFmjsXtfDPdku2LAHir8vPR3LpLScQgMArhpmxhbVEIxyopr0/jtJaUQTaz8WVtHkVBFQXpCGmrR/CpW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxSuos371mc8EUAA--.49222S3;
	Thu, 15 Aug 2024 18:57:48 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMDxG2cp371mkjQVAA--.2535S3;
	Thu, 15 Aug 2024 18:57:47 +0800 (CST)
Subject: Re: [PATCH Loongarch-avec support V9 1/2] irqchip/loongson-pch-msi:
 Switch to MSI parent domains
To: Xi Ruoyao <xry111@xry111.site>, Thomas Gleixner <tglx@linutronix.de>,
 corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 jiaxun.yang@flygoat.com, gaoliang@loongson.cn, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, yijun@loongson.cn, mhocko@suse.com,
 akpm@linux-foundation.org, dianders@chromium.org, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, nathan@kernel.org, yangtiezhu@loongson.cn,
 zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
References: <20240813085415.20035-1-zhangtianyang@loongson.cn>
 <875xs3petd.ffs@tglx> <6495631f-ec9c-c86a-39d2-1ada793b8098@loongson.cn>
 <8734n6np4a.ffs@tglx> <d5c5fdc8-abd5-685f-b952-f36b9e0bd908@loongson.cn>
 <25d8b51db163c01d62518bd02449d5f5e8748fde.camel@xry111.site>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <c452d88a-1ff7-4d8b-2bf2-c334821a87ea@loongson.cn>
Date: Thu, 15 Aug 2024 18:57:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <25d8b51db163c01d62518bd02449d5f5e8748fde.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxG2cp371mkjQVAA--.2535S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur1DZrW7Xw47KF4kCw4kGrX_yoWDXFgE9a
	srZr1DCr1DGFs7KFsrtrsIqrnFyFyDK3yrtw4jyr4Yv39Yqr98Xan8W34kXFn8Jan7Xr9I
	vF90q3ZxXrnruosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz2NtUUUUU=


在 2024/8/15 下午6:51, Xi Ruoyao 写道:
> On Thu, 2024-08-15 at 18:43 +0800, Tianyang Zhang wrote:
>> Hi, Thomas
>>
>> 在 2024/8/15 下午4:53, Thomas Gleixner 写道:
>>> On Thu, Aug 15 2024 at 09:13, Tianyang Zhang wrote:
>>>> https://lore.kernel.org/all/20240813085427.20194-1-zhangtianyang@loongson.cn/
>>>>
>>>> 在 2024/8/14 下午6:41, Thomas Gleixner 写道:
>>>>> On Tue, Aug 13 2024 at 16:54, Tianyang Zhang wrote:
>>>>>
>>>>> Where is patch 2/2 ?
>>> Can you please thread your submissions properly and not send them
>>> separately?
>>>
>>> Thanks,
>>>
>>>           tglx
>> I relearned the series of patches in the kernel submission guide. Now I
>> know how to generate the series-cover.
>>
>> Can I resend all patches directly with a correct cover now?
> Just version it v10.  Using "resend" in the subject can sometimes cause
> confusion, and there's no harm to bump the version number anyway even
> without real code change.
OK, I got it , thank you

