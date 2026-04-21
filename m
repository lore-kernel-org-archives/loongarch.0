Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB503D6CCD
	for <loongarch@lists.linux.dev>; Tue, 21 Apr 2026 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777881; cv=none; b=tIYNzE+YaitUNh0zjrduZBlO8IBlVCf35sHl+GlmcUDJD1Unb4vFmpOlFr6kzBhCkbtDrEIF7EwdNDkcwsZG07bLqygMJrFCUXMoDA1wd9pcrQGI8kk102+xdOnPwKxbxSGomsotrGX/yE2VA79RXyotBHWjmet3J5sTdE1TS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777881; c=relaxed/simple;
	bh=nKXqCfcmgI/4F53LIA4YsI1i1dRcu3SCWL74z0ilyuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjgsC88uO/FlaNWSXKsDYb6lSeWRINvFZczzWEEcWffhC9SGpgos0Xe+8FEBrs8FJuwAs1xFbbs59npGeNADAvc577CxnX45O6yuYGZKg3tgMZY10KFf3bAU+/TRdST1XVvBkwZT4u5U64LU/90OVBwhlZ8Vi6jfVpBdzMYUfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [117.22.85.157])
	by gateway (Coremail) with SMTP id _____8BxEuuLeudpenwCAA--.9318S3;
	Tue, 21 Apr 2026 21:24:27 +0800 (CST)
Received: from [192.168.0.111] (unknown [117.22.85.157])
	by front1 (Coremail) with SMTP id qMiowJCx_8KGeudpkf1xAA--.20229S3;
	Tue, 21 Apr 2026 21:24:26 +0800 (CST)
Message-ID: <4a6c89b6-72a8-a80b-1f7c-9a620ed24505@loongson.cn>
Date: Tue, 21 Apr 2026 21:25:19 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/5] LoongArch: BPF: Support more atomic instructions
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260413040506.26640-1-yangtiezhu@loongson.cn>
 <CAAhV-H59RuXDEqLe7UNDYssvMFXqZ2YZuW4gOUqdscPQZpqibg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H59RuXDEqLe7UNDYssvMFXqZ2YZuW4gOUqdscPQZpqibg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCx_8KGeudpkf1xAA--.20229S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8czVUUUUUU==

On 4/21/26 20:38, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> Maybe we need V4? If so, please submit as soon as possible.

For now, TBH, I do not want to do that.

Patch #1 is OK.

Patch #2 is OK.

Patch #3 is OK according to Wang Rui's reply.

Patch #4 has no big problems, the current testcases passed,
I am not sure whether it has problem, I can fix it if there
is a real problem, maybe it needs to update the testcase first.

patch #5 is OK, hope you can replace "usable" with "enable" in
the patch subject and commit message when applying.

Thanks,
Tiezhu

