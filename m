Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDB11509AB
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 01:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168486; cv=none; b=Sj0RBDPEoANd8x38v5Ij1CuzbtgfpidAvV0tD7PE48wdFU2XzrLRRjcnh81QMfnkP9fHNuwJJDZ+l5kEF5A59587V8nNEDMUZwQfgZRlackC4gg9RTuN85oB0RUXxzRHVgcTgux3l7SGcnih1tiexz68AqvrNfNiZ/g6Z5u9tXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168486; c=relaxed/simple;
	bh=OFxd1GrBys77zioOdyfC6ks98+Ht3t6RYfgESLqbAUs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZgaZfqnqSMC/cnNEeaUMfDdIaB49nOxgbWMLM8S+tvq7gJDKfNHrCuLnKNZDuVBfp5L3lU9QivZyso+GSitQQZkLTaTb9Qrj1BAyLprmU0hWvadyDgQPkjKek5dyoK58IQv2HUVttWTSkxnP+VsJ4+Kq7/9icfngkP9Ub3IdOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxOMKaoIJpwpkPAA--.51004S3;
	Wed, 04 Feb 2026 09:27:54 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJCxOMGXoIJpQ3A_AA--.38473S3;
	Wed, 04 Feb 2026 09:27:54 +0800 (CST)
Subject: Re: [PATCH v11 2/4] irqchip/irq-loonarch-avec: Prepare for interrupt
 redirection support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
 <20260203124522.2288900-3-zhangtianyang@loongson.cn> <87tsvx3fxq.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <ccd4a8be-23e2-45f2-5b90-8a8e8f9ae6d6@loongson.cn>
Date: Wed, 4 Feb 2026 09:26:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87tsvx3fxq.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGXoIJpQ3A_AA--.38473S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw4kGw1rXF47Ww15GrW7trc_yoWkCwb_Wr
	y5Krs7G34DWFWfWFZxGrZ3Xr9xGFyruFyDArW5uF12qryFyFWkCF1qgryS93yrC3y2vrn3
	ur98Xw1fWw1a9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8hiSPUUUUU==

Hi, Thomas

ÔÚ 2026/2/4 ÉÏÎç1:17, Thomas Gleixner Ð´µÀ:
> On Tue, Feb 03 2026 at 20:45, Tianyang Zhang wrote:
> 
> $Subject: irqchip/irq-loonarch-avec
> 
> I know you blindly copied my suggestion and obviously you failed to spot
> the missing 'g'.
......ok......
> 
>> Interrupt redirection support requires a new interrupt chip, which
>> needs to share data structures, constants and functions with the AVEC
>> code.
>>
>> Move them to the header file and make the required functions public.
> 
> But then you still keep this nonsense around, which has no place in the
> change log as I explained to you before:
> 
>    "Enumerating the details of what is moved is a pointless exercise
>     because that can bee seen from the diff itself."
> 
> What's so hard about that to understand?
> 
> Just in case I'm not able to express myself coherently, this means:
> 
> Remove the following 4 lines:
Ok, I got it
> 
>> including:
>> 1 marco AVEC_MSG_OFFSET
>> 2 struct avecintc_data
>> 3 Make avecintc_sync public
> 
> Sigh. Though I have to admit that 'loonarch' gave me a good laugh at
> least.
......Maybe that's a happy little accident
> 
> Thanks,
> 
>          tglx
> 
Thanks
Tianyang

